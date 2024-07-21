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

  factory ImageKitDTO.fromDomain(Image _) {
    return ImageKitDTO(
      url: _.url,
    );
  }

  Image toDomain() {
    return Image(
      url: url,
    );
  }
}

@freezed
class ImageDTO with _$ImageDTO {
  const factory ImageDTO({
    required String productImage_1,
    required String productImage_2,
    required String productImage_3,
  }) = _ImageDTO;
  const ImageDTO._();

  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);
}
