import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_promotion_update_delete_notifier.g.dart';

@riverpod
class BrandPromotionUpdateDeleteNotifier
    extends _$BrandPromotionUpdateDeleteNotifier {
  late final BrandPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(brandPromotionRepositoryProvider);
  }

  Future<void> updateBrandPromotion({
    required int promotionId,
    required int brandId,
    String? brandPromotionImage,
    bool? active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateBrandPromotion(
        adminId: admin.id,
        promotionId: promotionId,
        brandId: brandId,
        brandPromotionImage: brandPromotionImage,
        active: active,
      ),
    );
  }
}
