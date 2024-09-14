import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_promotion_update_delete_notifier.g.dart';

@riverpod
class ProductPromotionUpdateDeleteNotifier
    extends _$ProductPromotionUpdateDeleteNotifier {
  late final ProductPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(productPromotionRepositoryProvider);
  }

  Future<void> updateProductPromotion({
    required int promotionId,
    required int productId,
    String? productPromotionImage,
    bool? active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateProductPromotion(
        adminId: admin.id,
        promotionId: promotionId,
        productId: productId,
        productPromotionImage: productPromotionImage,
        active: active,
      ),
    );
  }
}
