import 'package:classic_shop_admin/src/features/order_status/data/order_status_dto.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status.dart';

extension DTOListToDomainList on List<OrderStatusDTO> {
  List<OrderStatus> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
