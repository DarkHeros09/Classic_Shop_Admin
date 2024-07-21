import 'package:classic_shop_admin/src/features/brand/data/brand_dto.dart';
import 'package:classic_shop_admin/src/features/brand/domain/brand.dart';

extension DTOListToDomainList on List<BrandDTO> {
  List<Brand> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
