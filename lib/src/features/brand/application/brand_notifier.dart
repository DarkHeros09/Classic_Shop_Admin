import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_repository.dart';
import 'package:classic_shop_admin/src/features/brand/domain/brand.dart';
import 'package:classic_shop_admin/src/features/brand/domain/brand_failure.dart';
import 'package:classic_shop_admin/src/features/brand/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_notifier.freezed.dart';
part 'brand_notifier.g.dart';

@freezed
class BrandState with _$BrandState {
  const BrandState._();
  const factory BrandState.initial(
    Fresh<List<Brand>> brands,
  ) = _Initial;
  const factory BrandState.loadInProgress(
    Fresh<List<Brand>> brands,
  ) = _LoadInProgress;
  const factory BrandState.loadSuccess(
    Fresh<List<Brand>> brands,
  ) = _LoadSuccess;
  const factory BrandState.loadFailure(
    Fresh<List<Brand>> brands,
    BrandFailure failure,
  ) = _LoadFailure;
}

@riverpod
class BrandNotifier extends _$BrandNotifier {
  late final BrandRepository _repository;
  @override
  BrandState build() {
    _repository = ref.watch(brandRepositoryProvider);
    return state = BrandState.initial(Fresh.yes([]));
  }

  Future<void> getBrandss() async {
    // state = BrandState.loadFailure(
    //   state.categories,
    //   const BrandFailure.api(404),
    // );
    state = BrandState.loadInProgress(state.brands);
    final failureOrCategories = await _repository.fetchBrands();
    state = failureOrCategories.fold(
      (l) => BrandState.loadFailure(state.brands, l),
      BrandState.loadSuccess,
    );
  }
}
