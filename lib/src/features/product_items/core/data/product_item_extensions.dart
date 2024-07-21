import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';

extension DTOListToDomainList on List<ProductItemDTO> {
  List<ProductItem> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
