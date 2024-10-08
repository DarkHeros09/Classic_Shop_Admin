// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopOrderDTOImpl _$$ShopOrderDTOImplFromJson(Map<String, dynamic> json) =>
    _$ShopOrderDTOImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String?,
      itemCount: (json['item_count'] as num?)?.toInt(),
      trackNumber: json['track_number'] as String,
      orderNumber: (json['order_number'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      username: json['username'] as String?,
      paymentTypeId: (json['payment_type_id'] as num).toInt(),
      shippingAddressId: (json['shipping_address_id'] as num).toInt(),
      orderTotal: json['order_total'] as String,
      shippingMethodId: (json['shipping_method_id'] as num).toInt(),
      orderStatusId: (json['order_status_id'] as num?)?.toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      completedAt: DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$ShopOrderDTOImplToJson(_$ShopOrderDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'item_count': instance.itemCount,
      'track_number': instance.trackNumber,
      'order_number': instance.orderNumber,
      'user_id': instance.userId,
      'username': instance.username,
      'payment_type_id': instance.paymentTypeId,
      'shipping_address_id': instance.shippingAddressId,
      'order_total': instance.orderTotal,
      'shipping_method_id': instance.shippingMethodId,
      'order_status_id': instance.orderStatusId,
      'total_count': instance.totalCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'completed_at': instance.completedAt.toIso8601String(),
    };
