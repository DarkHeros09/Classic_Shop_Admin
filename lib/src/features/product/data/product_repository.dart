import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/features/product/data/product_remote_service.dart';
import 'package:classic_shop_admin/src/features/product/domain/product_failure.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  ProductRepository(
    // this._localService,
    this._remoteService,
  );

  // final ProductLocalService _localService;
  final ProductRemoteService _remoteService;

  // Future<Either<ProductFailure, Fresh<List<Product>>>> fetchProducts() async {
  //   try {
  //     final requestUri = Uri.http(
  //       Env.httpAddress,
  //       '/api/v1/products',
  //     );
  //     final category = await _remoteService.fetchProducts(
  //       requestUri: requestUri,
  //     );

  //     return right(
  //       await category.when(
  //         noConnection: () async => Fresh.no(
  //           await _localService.fetchProduct().then((_) => _.toDomain()),
  //         ),
  //         noContent: () async {
  //           await _localService.deleteAllProducts();
  //           return Fresh.no([], isNextPageAvailable: false);
  //         },
  //         notModified: (_) async => Fresh.yes(
  //           await _localService.fetchProduct().then((_) => _.toDomain()),
  //         ),
  //         withNewData: (data, _) async {
  //           await _localService.setProduct(data);
  //           return Fresh.yes(data.toDomain());
  //         },
  //       ),
  //     );
  //   } on RestApiException catch (e) {
  //     return left(ProductFailure.api(e.errorCode));
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }

  Future<Either<ProductFailure, Unit>> createProduct({
    required int adminId,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool isActive,
  }) async {
    try {
      final product = await _remoteService.createProduct(
        adminId: adminId,
        name: name,
        description: description,
        categoryId: categoryId,
        brandId: brandId,
        isActive: isActive,
      );

      return await product.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ProductFailure.server('Could not create product')),
      );
    } on RestApiException catch (e) {
      return left(ProductFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ProductFailure.server('Could not create product'));
    }
  }
}
