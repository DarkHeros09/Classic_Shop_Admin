import 'package:classic_shop_admin/src/features/color/core/domain/color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_dto.freezed.dart';
part 'color_dto.g.dart';

@freezed
class ColorDTO with _$ColorDTO {
  const factory ColorDTO({
    required int id,
    required String colorValue,
  }) = _ColorDTO;
  const ColorDTO._();
  factory ColorDTO.fromJson(Map<String, dynamic> json) =>
      _$ColorDTOFromJson(json);

  factory ColorDTO.fromDomain(ColorModel _) {
    return ColorDTO(
      id: _.id,
      colorValue: _.colorValue,
    );
  }

  ColorModel toDomain() {
    return ColorModel(
      id: id,
      colorValue: colorValue,
    );
  }
}
