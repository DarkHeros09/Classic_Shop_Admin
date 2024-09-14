import 'package:classic_shop_admin/src/features/size/core/data/size_dto.dart';
import 'package:classic_shop_admin/src/features/size/core/domain/size.dart';

extension DTOListToDomainList on List<SizeDTO> {
  List<SizeModel> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
