import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/image/domain/image_failure.dart';
import 'package:classic_shop_admin/src/features/image/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_kit_notifier.freezed.dart';
part 'image_kit_notifier.g.dart';

@freezed
class ImageKitState with _$ImageKitState {
  const ImageKitState._();
  const factory ImageKitState.initial(
    Fresh<List<ImageKit>> imageKits,
  ) = _Initial;
  const factory ImageKitState.loadInProgress(
    Fresh<List<ImageKit>> imageKits,
  ) = _LoadInProgress;
  const factory ImageKitState.loadSuccess(
    Fresh<List<ImageKit>> imageKits, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory ImageKitState.loadFailure(
    Fresh<List<ImageKit>> imageKits,
    ImageFailure failure,
  ) = _LoadFailure;
}

@Riverpod(keepAlive: true)
class ImageKitsNotifier extends _$ImageKitsNotifier {
  late final ImageRepository _repository;
  @override
  ImageKitState build() {
    _repository = ref.watch(imageRepositoryProvider);
    return ImageKitState.initial(Fresh.yes([]));
  }

  Future<void> fetchImages() async {
    state = ImageKitState.loadInProgress(state.imageKits);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrImages = await _repository.fetchImageKits(adminId: admin.id);
    state = failureOrImages.fold(
      (l) => ImageKitState.loadFailure(state.imageKits, l),
      (r) => ImageKitState.loadSuccess(r, isNextPageAvailable: false),
    );
  }
}
