import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/product_promotion/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_product_promotion_notifier.g.dart';

@riverpod
class AddProductPromotionNotifier extends _$AddProductPromotionNotifier {
  late final ProductPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(productPromotionRepositoryProvider);
  }

  Future<void> createProductPromotion({
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createProductPromotion(
        adminId: admin.id,
        productId: productId,
        promotionId: promotionId,
        productPromotionImage: productPromotionImage,
        active: active,
      ),
    );
  }
}
