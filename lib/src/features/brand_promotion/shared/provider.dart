import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_api.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

// @Riverpod(keepAlive: true)
// BrandPromotionLocalService brandPromotionLocalService(BrandPromotionLocalServiceRef ref) {
//   return BrandPromotionLocalService(
//     ref.watch(sembastProvider),
//   );
// }

// @Riverpod(keepAlive: true)
// BrandPromotionApi brandPromotionApi(BrandPromotionApiRef ref) {
//   return BrandPromotionApi.create();
// }

@Riverpod(keepAlive: true)
BrandPromotionAdminApi brandPromotionAdminApi(
  BrandPromotionAdminApiRef ref,
) {
  return BrandPromotionAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
BrandPromotionRemoteService brandPromotionRemoteService(
  BrandPromotionRemoteServiceRef ref,
) {
  return BrandPromotionRemoteService(
    // ref.watch(brandPromotionApiProvider),
    ref.watch(brandPromotionAdminApiProvider),
    // ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
BrandPromotionRepository brandPromotionRepository(
  BrandPromotionRepositoryRef ref,
) {
  return BrandPromotionRepository(
    // ref.watch(brandPromotionLocalServiceProvider),
    ref.watch(brandPromotionRemoteServiceProvider),
  );
}
