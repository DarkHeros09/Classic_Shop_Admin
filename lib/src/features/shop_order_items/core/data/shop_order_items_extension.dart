import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_dto.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/domain/shop_order_items.dart';

extension DTOListToDomainList on List<ShopOrderItemsDTO> {
  List<ShopOrderItems> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
