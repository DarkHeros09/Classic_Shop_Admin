import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_api.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

// @Riverpod(keepAlive: true)
// ProductPromotionLocalService productPromotionLocalService(ProductPromotionLocalServiceRef ref) {
//   return ProductPromotionLocalService(
//     ref.watch(sembastProvider),
//   );
// }

// @Riverpod(keepAlive: true)
// ProductPromotionApi productPromotionApi(ProductPromotionApiRef ref) {
//   return ProductPromotionApi.create();
// }

@Riverpod(keepAlive: true)
ProductPromotionAdminApi productPromotionAdminApi(
  ProductPromotionAdminApiRef ref,
) {
  return ProductPromotionAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ProductPromotionRemoteService productPromotionRemoteService(
  ProductPromotionRemoteServiceRef ref,
) {
  return ProductPromotionRemoteService(
    // ref.watch(productPromotionApiProvider),
    ref.watch(productPromotionAdminApiProvider),
    // ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ProductPromotionRepository productPromotionRepository(
  ProductPromotionRepositoryRef ref,
) {
  return ProductPromotionRepository(
    // ref.watch(productPromotionLocalServiceProvider),
    ref.watch(productPromotionRemoteServiceProvider),
  );
}
