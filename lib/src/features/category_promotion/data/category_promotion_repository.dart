import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/category_promotion/domain/category_promotion_failure.dart';
import 'package:dartz/dartz.dart';

class CategoryPromotionRepository {
  CategoryPromotionRepository(
    // this._localService,
    this._remoteService,
  );

  // final CategoryPromotionLocalService _localService;
  final CategoryPromotionRemoteService _remoteService;

  // Future<Either<CategoryPromotionFailure, Fresh<List<CategoryPromotion>>>> fetchCategoryPromotion() async {
  //   try {
  //     final requestUri = Uri.http(
  //       Env.httpAddress,
  //       '/api/v1/promotions',
  //     );
  //     final promotion = await _remoteService.fetchCategoryPromotions(
  //       requestUri: requestUri,
  //     );

  //     return right(
  //       await promotion.when(
  //         noConnection: () async => Fresh.no(
  //           await _localService.fetchCategoryPromotion().then((_) => _.toDomain()),
  //         ),
  //         noContent: () async {
  //           await _localService.deleteAllCategoryPromotions();
  //           return Fresh.no([], isNextPageAvailable: false);
  //         },
  //         notModified: (_) async => Fresh.yes(
  //           await _localService.fetchCategoryPromotion().then((_) => _.toDomain()),
  //         ),
  //         withNewData: (data, _) async {
  //           await _localService.setCategoryPromotion(data);
  //           return Fresh.yes(data.toDomain());
  //         },
  //       ),
  //     );
  //   } on RestApiException catch (e) {
  //     return left(CategoryPromotionFailure.api(e.errorCode));
  //   } on Exception catch (_) {
  //     rethrow;
  //   }
  // }

  Future<Either<CategoryPromotionFailure, Unit>> createCategoryPromotion({
    required int adminId,
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  }) async {
    try {
      final promotion = await _remoteService.createCategoryPromotion(
        adminId: adminId,
        categoryId: categoryId,
        promotionId: promotionId,
        categoryPromotionImage: categoryPromotionImage,
        active: active,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const CategoryPromotionFailure.server('Could not create promotion'),
        ),
      );
    } on RestApiException catch (e) {
      return left(CategoryPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const CategoryPromotionFailure.server('Could not create promotion'),
      );
    }
  }
}
