import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_order.freezed.dart';

@freezed
class ShopOrder with _$ShopOrder {
  const factory ShopOrder({
    required int id,
    required String? status,
    required int? itemCount,
    required String trackNumber,
    required int orderNumber,
    required int userId,
    required String? username,
    required int paymentTypeId,
    required int shippingAddressId,
    required String orderTotal,
    required int shippingMethodId,
    required int? orderStatusId,
    required int totalCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime completedAt,
  }) = _ShopOrder;
  const ShopOrder._();
}
