import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/data/add_product_item_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item_failure.dart';
import 'package:dartz/dartz.dart';

class AddProductItemRepository {
  AddProductItemRepository(this._remoteService);

  final AddProductItemRemoteService _remoteService;

  Future<Either<ProductItemFailure, Unit>> createProductItem({
    required int adminId,
    required int productId,
    required int sizeId,
    required int imageId,
    required int colorId,
    required int productSku,
    required int qtyInStock,
    required String price,
    required bool active,
  }) async {
    try {
      final category = await _remoteService.createProductItem(
        adminId: adminId,
        productId: productId,
        sizeId: sizeId,
        imageId: imageId,
        colorId: colorId,
        productSku: productSku,
        qtyInStock: qtyInStock,
        price: price,
        active: active,
      );

      return await category.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const ProductItemFailure.server('Could not create product item'),
        ),
      );
    } on RestApiException catch (e) {
      return left(ProductItemFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const ProductItemFailure.server('Could not create product item'),
      );
    }
  }
}
