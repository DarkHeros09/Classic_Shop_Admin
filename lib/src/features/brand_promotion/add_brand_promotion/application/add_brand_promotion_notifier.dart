import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_brand_promotion_notifier.g.dart';

@riverpod
class AddBrandPromotionNotifier extends _$AddBrandPromotionNotifier {
  late final BrandPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(brandPromotionRepositoryProvider);
  }

  Future<void> createBrandPromotion({
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createBrandPromotion(
        adminId: admin.id,
        brandId: brandId,
        promotionId: promotionId,
        brandPromotionImage: brandPromotionImage,
        active: active,
      ),
    );
  }
}
