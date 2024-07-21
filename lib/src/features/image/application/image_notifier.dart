import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/image/domain/image_failure.dart';
import 'package:classic_shop_admin/src/features/image/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_notifier.freezed.dart';
part 'image_notifier.g.dart';

@freezed
class ImageState with _$ImageState {
  const ImageState._();
  const factory ImageState.initial(
    Fresh<List<Image>> images,
  ) = _Initial;
  const factory ImageState.loadInProgress(
    Fresh<List<Image>> images,
  ) = _LoadInProgress;
  const factory ImageState.loadSuccess(
    Fresh<List<Image>> images, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory ImageState.loadFailure(
    Fresh<List<Image>> images,
    ImageFailure failure,
  ) = _LoadFailure;
}

@Riverpod(keepAlive: true)
class ImagesNotifier extends _$ImagesNotifier {
  late final ImageRepository _repository;
  @override
  ImageState build() {
    _repository = ref.watch(imageRepositoryProvider);
    return ImageState.initial(Fresh.yes([]));
  }

  Future<void> fetchImages() async {
    state = ImageState.loadInProgress(state.images);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrImages = await _repository.fetchImages(adminId: admin.id);
    state = failureOrImages.fold(
      (l) => ImageState.loadFailure(state.images, l),
      (r) => ImageState.loadSuccess(r, isNextPageAvailable: false),
    );
  }
}
