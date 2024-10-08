import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_repository.dart';
import 'package:classic_shop_admin/src/features/color/core/domain/color.dart';
import 'package:classic_shop_admin/src/features/color/core/domain/color_failure.dart';
import 'package:classic_shop_admin/src/features/color/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_notifier.freezed.dart';
part 'color_notifier.g.dart';

@freezed
class ColorState with _$ColorState {
  const ColorState._();
  const factory ColorState.initial(
    Fresh<List<ColorModel>> colors,
  ) = _Initial;
  const factory ColorState.loadInProgress(
    Fresh<List<ColorModel>> colors,
  ) = _LoadInProgress;
  const factory ColorState.loadSuccess(
    Fresh<List<ColorModel>> colors,
  ) = _LoadSuccess;
  const factory ColorState.loadFailure(
    Fresh<List<ColorModel>> colors,
    ColorFailure failure,
  ) = _LoadFailure;
}

@riverpod
class ColorNotifier extends _$ColorNotifier {
  late final ColorRepository _repository;
  @override
  ColorState build() {
    _repository = ref.watch(colorRepositoryProvider);
    state = ColorState.initial(Fresh.yes([]));
    getColors();
    return state;
  }

  Future<void> getColors() async {
    // state = ColorState.loadFailure(
    //   state.categories,
    //   const ColorFailure.api(404),
    // );
    state = ColorState.loadInProgress(state.colors);
    final failureOrCategories = await _repository.fetchColors();
    state = failureOrCategories.fold(
      (l) => ColorState.loadFailure(state.colors, l),
      ColorState.loadSuccess,
    );
  }
}
