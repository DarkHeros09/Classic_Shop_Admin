import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/domain/product_promotion.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/domain/product_promotion_failure.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_promotions_notifier.freezed.dart';
part 'product_promotions_notifier.g.dart';

@freezed
class ProductPromotionState with _$ProductPromotionState {
  const ProductPromotionState._();
  const factory ProductPromotionState.initial(
    Fresh<List<ProductPromotion>> productPromotions,
  ) = _Initial;
  const factory ProductPromotionState.loadInProgress(
    Fresh<List<ProductPromotion>> productPromotions,
  ) = _LoadInProgress;
  const factory ProductPromotionState.loadSuccess(
    Fresh<List<ProductPromotion>> productPromotions,
  ) = _LoadSuccess;
  const factory ProductPromotionState.loadFailure(
    Fresh<List<ProductPromotion>> productPromotions,
    ProductPromotionFailure failure,
  ) = _LoadFailure;
}

@riverpod
class ProductPromotionsNotifier extends _$ProductPromotionsNotifier {
  late final ProductPromotionRepository _repository;
  @override
  ProductPromotionState build() {
    _repository = ref.watch(productPromotionRepositoryProvider);
    state = ProductPromotionState.initial(Fresh.yes([]));
    getProductPromotions();
    return state;
  }

  Future<void> getProductPromotions() async {
    // state = ProductPromotionState.loadFailure(
    //   state.promotions,
    //   const ProductPromotionFailure.api(404),
    // );
    state = ProductPromotionState.loadInProgress(state.productPromotions);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrCategories =
        await _repository.fetchProductPromotions(adminId: admin.id);
    state = failureOrCategories.fold(
      (l) => ProductPromotionState.loadFailure(state.productPromotions, l),
      ProductPromotionState.loadSuccess,
    );
  }
}
