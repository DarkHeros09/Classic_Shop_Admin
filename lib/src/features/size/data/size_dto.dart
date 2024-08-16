import 'package:classic_shop_admin/src/features/size/domain/size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'size_dto.freezed.dart';
part 'size_dto.g.dart';

@freezed
class SizeDTO with _$SizeDTO {
  const factory SizeDTO({
    required int id,
    required String sizeValue,
  }) = _SizeDTO;
  const SizeDTO._();
  factory SizeDTO.fromJson(Map<String, dynamic> json) =>
      _$SizeDTOFromJson(json);

  factory SizeDTO.fromDomain(Size _) {
    return SizeDTO(
      id: _.id,
      sizeValue: _.sizeValue,
    );
  }

  Size toDomain() {
    return Size(
      id: id,
      sizeValue: sizeValue,
    );
  }
}
