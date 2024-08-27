import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/domain/brand_promotion_failure.dart';
import 'package:dartz/dartz.dart';

class BrandPromotionRepository {
  BrandPromotionRepository(
    // this._localService,
    this._remoteService,
  );

  // final BrandPromotionLocalService _localService;
  final BrandPromotionRemoteService _remoteService;

  // Future<Either<BrandPromotionFailure, Fresh<List<BrandPromotion>>>> fetchBrandPromotion() async {
  //   try {
  //     final requestUri = Uri.http(
  //       Env.httpAddress,
  //       '/api/v1/promotions',
  //     );
  //     final promotion = await _remoteService.fetchBrandPromotions(
  //       requestUri: requestUri,
  //     );

  //     return right(
  //       await promotion.when(
  //         noConnection: () async => Fresh.no(
  //           await _localService.fetchBrandPromotion().then((_) => _.toDomain()),
  //         ),
  //         noContent: () async {
  //           await _localService.deleteAllBrandPromotions();
  //           return Fresh.no([], isNextPageAvailable: false);
  //         },
  //         notModified: (_) async => Fresh.yes(
  //           await _localService.fetchBrandPromotion().then((_) => _.toDomain()),
  //         ),
  //         withNewData: (data, _) async {
  //           await _localService.setBrandPromotion(data);
  //           return Fresh.yes(data.toDomain());
  //         },
  //       ),
  //     );
  //   } on RestApiException catch (e) {
  //     return left(BrandPromotionFailure.api(e.errorCode));
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }

  Future<Either<BrandPromotionFailure, Unit>> createBrandPromotion({
    required int adminId,
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) async {
    try {
      final promotion = await _remoteService.createBrandPromotion(
        adminId: adminId,
        brandId: brandId,
        promotionId: promotionId,
        brandPromotionImage: brandPromotionImage,
        active: active,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const BrandPromotionFailure.server('Could not create promotion'),
        ),
      );
    } on RestApiException catch (e) {
      return left(BrandPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const BrandPromotionFailure.server('Could not create promotion'),
      );
    }
  }
}