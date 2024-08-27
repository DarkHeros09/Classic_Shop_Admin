// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandPromotionDTOImpl _$$BrandPromotionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandPromotionDTOImpl(
      brandId: (json['brand_id'] as num).toInt(),
      promotionId: (json['promotion_id'] as num).toInt(),
      brandPromotionImage: json['brand_promotion_image'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$BrandPromotionDTOImplToJson(
        _$BrandPromotionDTOImpl instance) =>
    <String, dynamic>{
      'brand_id': instance.brandId,
      'promotion_id': instance.promotionId,
      'brand_promotion_image': instance.brandPromotionImage,
      'active': instance.active,
    };
