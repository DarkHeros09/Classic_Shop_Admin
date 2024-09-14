import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_repository.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/domain/brand_promotion.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/domain/brand_promotion_failure.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_promotions_notifier.freezed.dart';
part 'brand_promotions_notifier.g.dart';

@freezed
class BrandPromotionState with _$BrandPromotionState {
  const BrandPromotionState._();
  const factory BrandPromotionState.initial(
    Fresh<List<BrandPromotion>> brandPromotions,
  ) = _Initial;
  const factory BrandPromotionState.loadInProgress(
    Fresh<List<BrandPromotion>> brandPromotions,
  ) = _LoadInProgress;
  const factory BrandPromotionState.loadSuccess(
    Fresh<List<BrandPromotion>> brandPromotions,
  ) = _LoadSuccess;
  const factory BrandPromotionState.loadFailure(
    Fresh<List<BrandPromotion>> brandPromotions,
    BrandPromotionFailure failure,
  ) = _LoadFailure;
}

@riverpod
class BrandPromotionsNotifier extends _$BrandPromotionsNotifier {
  late final BrandPromotionRepository _repository;
  @override
  BrandPromotionState build() {
    _repository = ref.watch(brandPromotionRepositoryProvider);
    state = BrandPromotionState.initial(Fresh.yes([]));
    getBrandPromotions();
    return state;
  }

  Future<void> getBrandPromotions() async {
    // state = BrandPromotionState.loadFailure(
    //   state.promotions,
    //   const BrandPromotionFailure.api(404),
    // );
    state = BrandPromotionState.loadInProgress(state.brandPromotions);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrCategories =
        await _repository.fetchBrandPromotions(adminId: admin.id);
    state = failureOrCategories.fold(
      (l) => BrandPromotionState.loadFailure(state.brandPromotions, l),
      BrandPromotionState.loadSuccess,
    );
  }
}
