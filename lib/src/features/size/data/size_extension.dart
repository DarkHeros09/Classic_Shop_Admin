import 'package:classic_shop_admin/src/features/size/data/size_dto.dart';
import 'package:classic_shop_admin/src/features/size/domain/size.dart';

extension DTOListToDomainList on List<SizeDTO> {
  List<Size> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
