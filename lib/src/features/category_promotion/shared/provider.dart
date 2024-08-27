import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_api.dart';
import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_remote_service.dart';
import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

// @Riverpod(keepAlive: true)
// CategoryPromotionLocalService categoryPromotionLocalService(CategoryPromotionLocalServiceRef ref) {
//   return CategoryPromotionLocalService(
//     ref.watch(sembastProvider),
//   );
// }

// @Riverpod(keepAlive: true)
// CategoryPromotionApi categoryPromotionApi(CategoryPromotionApiRef ref) {
//   return CategoryPromotionApi.create();
// }

@Riverpod(keepAlive: true)
CategoryPromotionAdminApi categoryPromotionAdminApi(
  CategoryPromotionAdminApiRef ref,
) {
  return CategoryPromotionAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
CategoryPromotionRemoteService categoryPromotionRemoteService(
  CategoryPromotionRemoteServiceRef ref,
) {
  return CategoryPromotionRemoteService(
    // ref.watch(categoryPromotionApiProvider),
    ref.watch(categoryPromotionAdminApiProvider),
    // ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
CategoryPromotionRepository categoryPromotionRepository(
  CategoryPromotionRepositoryRef ref,
) {
  return CategoryPromotionRepository(
    // ref.watch(categoryPromotionLocalServiceProvider),
    ref.watch(categoryPromotionRemoteServiceProvider),
  );
}
