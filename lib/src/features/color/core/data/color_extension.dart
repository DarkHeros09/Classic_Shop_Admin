import 'package:classic_shop_admin/src/features/color/core/data/color_dto.dart';
import 'package:classic_shop_admin/src/features/color/core/domain/color.dart';

extension DTOListToDomainList on List<ColorDTO> {
  List<ColorModel> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
