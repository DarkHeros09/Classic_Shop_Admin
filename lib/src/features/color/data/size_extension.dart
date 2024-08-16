import 'package:classic_shop_admin/src/features/color/data/color_dto.dart';
import 'package:classic_shop_admin/src/features/color/domain/color.dart';

extension DTOListToDomainList on List<ColorDTO> {
  List<Color> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
