import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_extension.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_local_service.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion_failure.dart';
import 'package:dartz/dartz.dart';

class CategoryPromotionRepository {
  CategoryPromotionRepository(
    this._localService,
    this._remoteService,
  );

  final CategoryPromotionLocalService _localService;
  final CategoryPromotionRemoteService _remoteService;

  Future<Either<CategoryPromotionFailure, Fresh<List<CategoryPromotion>>>>
      fetchCategoryPromotions({
    required int adminId,
  }) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/category-promotions',
      );
      final promotion = await _remoteService.fetchCategoryPromotions(
        adminId: adminId,
        requestUri: requestUri,
      );

      return right(
        await promotion.when(
          noConnection: () async => Fresh.no(
            await _localService
                .fetchCategoryPromotions()
                .then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllCategoryPromotions();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService
                .fetchCategoryPromotions()
                .then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setCategoryPromotion(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(CategoryPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

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
          const CategoryPromotionFailure.server(
            'Could not create category promotion',
          ),
        ),
      );
    } on RestApiException catch (e) {
      return left(CategoryPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const CategoryPromotionFailure.server(
          'Could not create category promotion',
        ),
      );
    }
  }

  Future<Either<CategoryPromotionFailure, Unit>> updateCategoryPromotion({
    required int adminId,
    required int promotionId,
    required int categoryId,
    String? categoryPromotionImage,
    bool? active,
  }) async {
    try {
      final promotion = await _remoteService.updateCategoryPromotion(
        adminId: adminId,
        promotionId: promotionId,
        categoryId: categoryId,
        categoryPromotionImage: categoryPromotionImage,
        active: active,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const CategoryPromotionFailure.server(
            'Could not create category promotion',
          ),
        ),
      );
    } on RestApiException catch (e) {
      return left(CategoryPromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const CategoryPromotionFailure.server(
          'Could not create category promotion',
        ),
      );
    }
  }
}
