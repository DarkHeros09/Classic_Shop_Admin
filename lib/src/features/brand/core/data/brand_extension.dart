import 'package:classic_shop_admin/src/features/brand/core/data/brand_dto.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand.dart';

extension DTOListToDomainList on List<BrandDTO> {
  List<Brand> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
