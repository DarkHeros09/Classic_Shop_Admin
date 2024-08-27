// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPromotionDTOImpl _$$ProductPromotionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductPromotionDTOImpl(
      productId: (json['product_id'] as num).toInt(),
      promotionId: (json['promotion_id'] as num).toInt(),
      productPromotionImage: json['product_promotion_image'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$ProductPromotionDTOImplToJson(
        _$ProductPromotionDTOImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'promotion_id': instance.promotionId,
      'product_promotion_image': instance.productPromotionImage,
      'active': instance.active,
    };
