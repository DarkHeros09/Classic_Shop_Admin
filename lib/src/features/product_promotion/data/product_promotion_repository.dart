import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_promotion/domain/product_promotion_failure.dart';
import 'package:dartz/dartz.dart';

class ProductPromotionRepository {
  ProductPromotionRepository(
    // this._localService,
    this._remoteService,
  );

  // final ProductPromotionLocalService _localService;
  final ProductPromotionRemoteService _remoteService;

  // Future<Either<ProductPromotionFailure, Fresh<List<ProductPromotion>>>> fetchProductPromotion() async {
  //   try {
  //     final requestUri = Uri.http(
  //       Env.httpAddress,
  //       '/api/v1/promotions',
  //     );
  //     final promotion = await _remoteService.fetchProductPromotions(
  //       requestUri: requestUri,
  //     );

  //     return right(
  //       await promotion.when(
  //         noConnection: () async => Fresh.no(
  //           await _localService.fetchProductPromotion().then((_) => _.toDomain()),
  //         ),
  //         noContent: () async {
  //           await _localService.deleteAllProductPromotions();
  //           return Fresh.no([], isNextPageAvailable: false);
  //         },
  //         notModified: (_) async => Fresh.yes(
  //           await _localService.fetchProductPromotion().then((_) => _.toDomain()),
  //         ),
  //         withNewData: (data, _) async {
  //           await _localService.setProductPromotion(data);
  //           return Fresh.yes(data.toDomain());
  //         },
  //       ),
  //     );
  //   } on RestApiException catch (e) {
  //     return left(ProductPromotionFailure.api(e.errorCode));
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }

  Future<Either<ProductPromotionFailure, Unit>> createProductPromotion({
    required int adminId,
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  }) async {
    try {
      final promotion = await _remoteService.createProductPromotion(
        adminId: adminId,
        productId: productId,
        promotionId: promotionId,
        productPromotionImage: productPromotionImage,
        active: active,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
            const ProductPromotionFailure.server('Could not create promotion')),
      );
    } on RestApiException catch (e) {
      return left(ProductPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
          const ProductPromotionFailure.server('Could not create promotion'));
    }
  }
}
