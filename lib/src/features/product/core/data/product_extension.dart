import 'package:classic_shop_admin/src/features/product/core/data/product_dto.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product.dart';

extension DTOListToDomainList on List<ProductDTO> {
  List<Product> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
