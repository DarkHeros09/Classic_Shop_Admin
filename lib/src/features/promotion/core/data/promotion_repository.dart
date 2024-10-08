import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_extension.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_local_service.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion_failure.dart';
import 'package:dartz/dartz.dart';

class PromotionRepository {
  PromotionRepository(
    this._localService,
    this._remoteService,
  );

  final PromotionLocalService _localService;
  final PromotionRemoteService _remoteService;

  Future<Either<PromotionFailure, Fresh<List<Promotion>>>>
      fetchPromotions() async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/promotions',
      );
      final promotion = await _remoteService.fetchPromotions(
        requestUri: requestUri,
      );

      return right(
        await promotion.when(
          noConnection: (nextAvailable) async => Fresh.no(
            await _localService.fetchPromotions().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllPromotions();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async => Fresh.yes(
            await _localService.fetchPromotions().then((_) => _.toDomain()),
          ),
          withNewData: (data, _) async {
            await _localService.setPromotion(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(PromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<PromotionFailure, Unit>> createPromotion({
    required int adminId,
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final promotion = await _remoteService.createPromotion(
        adminId: adminId,
        name: name,
        description: description,
        discountRate: discountRate,
        active: active,
        startDate: startDate,
        endDate: endDate,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const PromotionFailure.server('Could not create promotion')),
      );
    } on RestApiException catch (e) {
      return left(PromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const PromotionFailure.server('Could not create promotion'));
    }
  }

  Future<Either<PromotionFailure, Unit>> updatePromotion({
    required int adminId,
    required int promotionId,
    String? name,
    String? description,
    int? discountRate,
    bool? active,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final promotion = await _remoteService.updatePromotion(
        adminId: adminId,
        promotionId: promotionId,
        name: name,
        description: description,
        discountRate: discountRate,
        active: active,
        startDate: startDate,
        endDate: endDate,
      );

      return await promotion.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const PromotionFailure.server('Could not create promotion')),
      );
    } on RestApiException catch (e) {
      return left(PromotionFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const PromotionFailure.server('Could not create promotion'));
    }
  }
}
