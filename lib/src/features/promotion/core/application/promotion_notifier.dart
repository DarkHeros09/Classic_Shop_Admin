import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_repository.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion_failure.dart';
import 'package:classic_shop_admin/src/features/promotion/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promotion_notifier.freezed.dart';
part 'promotion_notifier.g.dart';

@freezed
class PromotionState with _$PromotionState {
  const PromotionState._();
  const factory PromotionState.initial(
    Fresh<List<Promotion>> promotions,
  ) = _Initial;
  const factory PromotionState.loadInProgress(
    Fresh<List<Promotion>> promotions,
  ) = _LoadInProgress;
  const factory PromotionState.loadSuccess(
    Fresh<List<Promotion>> promotions,
  ) = _LoadSuccess;
  const factory PromotionState.loadFailure(
    Fresh<List<Promotion>> promotions,
    PromotionFailure failure,
  ) = _LoadFailure;
}

@riverpod
class PromotionNotifier extends _$PromotionNotifier {
  late final PromotionRepository _repository;
  @override
  PromotionState build() {
    _repository = ref.watch(promotionRepositoryProvider);
    state = PromotionState.initial(Fresh.yes([]));
    getPromotions();
    return state;
  }

  Future<void> getPromotions() async {
    // state = PromotionState.loadFailure(
    //   state.promotions,
    //   const PromotionFailure.api(404),
    // );
    state = PromotionState.loadInProgress(state.promotions);
    final failureOrCategories = await _repository.fetchPromotions();
    state = failureOrCategories.fold(
      (l) => PromotionState.loadFailure(state.promotions, l),
      PromotionState.loadSuccess,
    );
  }
}
