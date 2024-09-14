import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_api.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_local_service.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
PromotionLocalService promotionLocalService(PromotionLocalServiceRef ref) {
  return PromotionLocalService(
    ref.watch(sembastProvider),
  );
}

@Riverpod(keepAlive: true)
PromotionApi promotionApi(PromotionApiRef ref) {
  return PromotionApi.create();
}

@Riverpod(keepAlive: true)
PromotionAdminApi promotionAdminApi(PromotionAdminApiRef ref) {
  return PromotionAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
PromotionRemoteService promotionRemoteService(PromotionRemoteServiceRef ref) {
  return PromotionRemoteService(
    ref.watch(promotionApiProvider),
    ref.watch(promotionAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
PromotionRepository promotionRepository(PromotionRepositoryRef ref) {
  return PromotionRepository(
    ref.watch(promotionLocalServiceProvider),
    ref.watch(promotionRemoteServiceProvider),
  );
}
