import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';

extension DTOListToDomainList on List<ImageKitDTO> {
  List<Image> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
