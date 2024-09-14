// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPromotionDTOImpl _$$ProductPromotionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPromotionDTOImpl(
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String?,
      promotionId: (json['promotion_id'] as num).toInt(),
      promotionName: json['promotion_name'] as String?,
      productPromotionImage: json['product_promotion_image'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$ProductPromotionDTOImplToJson(
        _$ProductPromotionDTOImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'promotion_id': instance.promotionId,
      'promotion_name': instance.promotionName,
      'product_promotion_image': instance.productPromotionImage,
      'active': instance.active,
    };
