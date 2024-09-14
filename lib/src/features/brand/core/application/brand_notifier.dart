import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_repository.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand_failure.dart';
import 'package:classic_shop_admin/src/features/brand/core/shared/provider.dart';
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
    return BrandState.initial(Fresh.yes([]));
    // getBrands();
    // return state;
  }

  Future<void> getBrands() async {
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

@riverpod
class GetBrandNotifier extends _$GetBrandNotifier {
  late final BrandRepository _repository;
  @override
  FutureOr<Brand?> build() {
    _repository = ref.watch(brandRepositoryProvider);
    return null;
  }

  Future<void> getBrand({required int brandId}) async {
    // state = BrandState.loadFailure(
    //   state.categories,
    //   const BrandFailure.api(404),
    // );
    state = const AsyncValue.loading();

    final failureOrBrand = await _repository.fetchBrandById(brandId: brandId);

    state = failureOrBrand.fold(
      (l) => const AsyncValue.data(null),
      (r) => AsyncValue.data(r.entity),
    );
  }
}
