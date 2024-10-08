import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_order_dto.freezed.dart';
part 'shop_order_dto.g.dart';

@freezed
class ShopOrderDTO with _$ShopOrderDTO {
  const factory ShopOrderDTO({
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
  }) = _ShopOrderDTO;
  const ShopOrderDTO._();
  factory ShopOrderDTO.fromJson(Map<String, dynamic> json) =>
      _$ShopOrderDTOFromJson(json);

  factory ShopOrderDTO.fromDomain(ShopOrder _) {
    return ShopOrderDTO(
      id: _.id,
      status: _.status,
      itemCount: _.itemCount,
      trackNumber: _.trackNumber,
      orderNumber: _.orderNumber,
      userId: _.userId,
      username: _.username,
      paymentTypeId: _.paymentTypeId,
      shippingAddressId: _.shippingAddressId,
      orderTotal: _.orderTotal,
      shippingMethodId: _.shippingMethodId,
      orderStatusId: _.orderStatusId,
      totalCount: _.totalCount,
      createdAt: _.createdAt,
      updatedAt: _.updatedAt,
      completedAt: _.completedAt,
    );
  }

  ShopOrder toDomain() {
    return ShopOrder(
      id: id,
      status: status,
      itemCount: itemCount,
      trackNumber: trackNumber,
      orderNumber: orderNumber,
      userId: userId,
      username: username,
      paymentTypeId: paymentTypeId,
      shippingAddressId: shippingAddressId,
      orderTotal: orderTotal,
      shippingMethodId: shippingMethodId,
      orderStatusId: orderStatusId,
      totalCount: totalCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      completedAt: completedAt,
    );
  }
}
