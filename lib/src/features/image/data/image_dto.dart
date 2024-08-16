import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

@freezed
class ImageKitDTO with _$ImageKitDTO {
  const factory ImageKitDTO({
    required String url,
  }) = _ImageKitDTO;
  const ImageKitDTO._();

  factory ImageKitDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageKitDTOFromJson(json);

  factory ImageKitDTO.fromDomain(ImageKit _) {
    return ImageKitDTO(
      url: _.url,
    );
  }

  ImageKit toDomain() {
    return ImageKit(
      url: url,
    );
  }
}

@freezed
class ProductImageDTO with _$ProductImageDTO {
  const factory ProductImageDTO({
    required int id,
    required String productImage_1,
    required String productImage_2,
    required String productImage_3,
  }) = _ProductImageDTO;
  const ProductImageDTO._();

  factory ProductImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductImageDTOFromJson(json);

  factory ProductImageDTO.fromDomain(ProductImage _) {
    return ProductImageDTO(
      id: _.id,
      productImage_1: _.productImage_1,
      productImage_2: _.productImage_2,
      productImage_3: _.productImage_3,
    );
  }

  ProductImage toDomain() {
    return ProductImage(
      id: id,
      productImage_1: productImage_1,
      productImage_2: productImage_2,
      productImage_3: productImage_3,
    );
  }
}
