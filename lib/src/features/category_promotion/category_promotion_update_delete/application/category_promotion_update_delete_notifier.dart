import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_promotion_update_delete_notifier.g.dart';

@riverpod
class CategoryPromotionUpdateDeleteNotifier
    extends _$CategoryPromotionUpdateDeleteNotifier {
  late final CategoryPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(categoryPromotionRepositoryProvider);
  }

  Future<void> updateCategoryPromotion({
    required int promotionId,
    required int categoryId,
    String? categoryPromotionImage,
    bool? active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateCategoryPromotion(
        adminId: admin.id,
        promotionId: promotionId,
        categoryId: categoryId,
        categoryPromotionImage: categoryPromotionImage,
        active: active,
      ),
    );
  }
}
