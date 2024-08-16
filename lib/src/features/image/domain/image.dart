import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
class ImageKit with _$ImageKit {
  const factory ImageKit({
    required String url,
  }) = _ImageKit;
  const ImageKit._();

  String get cardImageKitsUrls => '$url?tr=h-224,w-190';
}

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required int id,
    required String productImage_1,
    required String productImage_2,
    required String productImage_3,
  }) = _ProductImage;
  const ProductImage._();
}

@freezed
class ProductImageUrl with _$ProductImageUrl {
  const factory ProductImageUrl({
    required int id,
    required String url,
  }) = _ProductImageUrl;
  const ProductImageUrl._();
}

extension ProductImageConversion on ProductImage {
  List<ProductImageUrl> toProductImageUrls() {
    return [
      ProductImageUrl(id: id, url: productImage_1),
      ProductImageUrl(id: id, url: productImage_2),
      ProductImageUrl(id: id, url: productImage_3),
    ];
  }
}
