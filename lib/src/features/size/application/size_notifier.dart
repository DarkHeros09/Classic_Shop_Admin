import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/size/data/size_repository.dart';
import 'package:classic_shop_admin/src/features/size/domain/size.dart';
import 'package:classic_shop_admin/src/features/size/domain/size_failure.dart';
import 'package:classic_shop_admin/src/features/size/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size_notifier.freezed.dart';
part 'size_notifier.g.dart';

@freezed
class SizeState with _$SizeState {
  const SizeState._();
  const factory SizeState.initial(
    Fresh<List<Size>> sizes,
  ) = _Initial;
  const factory SizeState.loadInProgress(
    Fresh<List<Size>> sizes,
  ) = _LoadInProgress;
  const factory SizeState.loadSuccess(
    Fresh<List<Size>> sizes,
  ) = _LoadSuccess;
  const factory SizeState.loadFailure(
    Fresh<List<Size>> sizes,
    SizeFailure failure,
  ) = _LoadFailure;
}

@riverpod
class SizeNotifier extends _$SizeNotifier {
  late final SizeRepository _repository;
  @override
  SizeState build() {
    _repository = ref.watch(sizeRepositoryProvider);
    return state = SizeState.initial(Fresh.yes([]));
  }

  Future<void> getSizes() async {
    // state = SizeState.loadFailure(
    //   state.categories,
    //   const SizeFailure.api(404),
    // );
    state = SizeState.loadInProgress(state.sizes);
    final failureOrCategories = await _repository.fetchSizes();
    state = failureOrCategories.fold(
      (l) => SizeState.loadFailure(state.sizes, l),
      SizeState.loadSuccess,
    );
  }
}
