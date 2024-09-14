import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_category_promotion_notifier.g.dart';

@riverpod
class AddCategoryPromotionNotifier extends _$AddCategoryPromotionNotifier {
  late final CategoryPromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(categoryPromotionRepositoryProvider);
  }

  Future<void> createCategoryPromotion({
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createCategoryPromotion(
        adminId: admin.id,
        categoryId: categoryId,
        promotionId: promotionId,
        categoryPromotionImage: categoryPromotionImage,
        active: active,
      ),
    );
  }
}
