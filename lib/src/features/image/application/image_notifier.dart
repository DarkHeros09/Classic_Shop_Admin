import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/image/domain/image_failure.dart';
import 'package:classic_shop_admin/src/features/image/helpers/enums.dart';
import 'package:classic_shop_admin/src/features/image/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_notifier.freezed.dart';
part 'image_notifier.g.dart';

@freezed
class ProductImageState with _$ProductImageState {
  const ProductImageState._();
  const factory ProductImageState.initial(
    Fresh<List<ProductImage>> images,
  ) = _Initial;
  const factory ProductImageState.loadInProgress(
    Fresh<List<ProductImage>> images,
  ) = _LoadInProgress;
  const factory ProductImageState.loadSuccess(
    Fresh<List<ProductImage>> images, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory ProductImageState.loadFailure(
    Fresh<List<ProductImage>> images,
    ImageFailure failure,
  ) = _LoadFailure;
}

@Riverpod(keepAlive: true)
class ProductImagesNotifier extends _$ProductImagesNotifier {
  late final ImageRepository _repository;
  @override
  ProductImageState build() {
    _repository = ref.watch(imageRepositoryProvider);
    return ProductImageState.initial(Fresh.yes([]));
  }

  int _page = 1;
  int _lastProductImageId = 0;

  Future<void> getProductImagesPage() async {
    state = ProductImageState.loadInProgress(Fresh.yes([]));
    _page = 1;
    _lastProductImageId = 0;
    final failureOrProductImages = await _repository.getImages(
      _page,
      imagesFunction: ImagesFunction.getImages,
    );
    state = failureOrProductImages.fold(
      (l) => ProductImageState.loadFailure(state.images, l),
      (r) {
        _page++;
        _lastProductImageId = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ProductImageState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.images.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }

  Future<void> getProductImagesNextPage() async {
    state = ProductImageState.loadInProgress(state.images);
    final failureOrProductImages = await _repository.getImages(
      _page,
      imagesFunction: ImagesFunction.getImagesNextPage,
      lastImageId: _lastProductImageId,
    );
    state = failureOrProductImages.fold(
      (l) => ProductImageState.loadFailure(state.images, l),
      (r) {
        _page++;
        _lastProductImageId = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ProductImageState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.images.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
