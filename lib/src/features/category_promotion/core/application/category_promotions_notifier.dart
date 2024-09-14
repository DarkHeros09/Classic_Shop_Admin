import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion_failure.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_promotions_notifier.freezed.dart';
part 'category_promotions_notifier.g.dart';

@freezed
class CategoryPromotionState with _$CategoryPromotionState {
  const CategoryPromotionState._();
  const factory CategoryPromotionState.initial(
    Fresh<List<CategoryPromotion>> categoryPromotions,
  ) = _Initial;
  const factory CategoryPromotionState.loadInProgress(
    Fresh<List<CategoryPromotion>> categoryPromotions,
  ) = _LoadInProgress;
  const factory CategoryPromotionState.loadSuccess(
    Fresh<List<CategoryPromotion>> categoryPromotions,
  ) = _LoadSuccess;
  const factory CategoryPromotionState.loadFailure(
    Fresh<List<CategoryPromotion>> categoryPromotions,
    CategoryPromotionFailure failure,
  ) = _LoadFailure;
}

@riverpod
class CategoryPromotionsNotifier extends _$CategoryPromotionsNotifier {
  late final CategoryPromotionRepository _repository;
  @override
  CategoryPromotionState build() {
    _repository = ref.watch(categoryPromotionRepositoryProvider);
    state = CategoryPromotionState.initial(Fresh.yes([]));
    getCategoryPromotions();
    return state;
  }

  Future<void> getCategoryPromotions() async {
    // state = CategoryPromotionState.loadFailure(
    //   state.promotions,
    //   const CategoryPromotionFailure.api(404),
    // );
    state = CategoryPromotionState.loadInProgress(state.categoryPromotions);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrCategories =
        await _repository.fetchCategoryPromotions(adminId: admin.id);
    state = failureOrCategories.fold(
      (l) => CategoryPromotionState.loadFailure(state.categoryPromotions, l),
      CategoryPromotionState.loadSuccess,
    );
  }
}
