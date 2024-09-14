// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandPromotionDTOImpl _$$BrandPromotionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$BrandPromotionDTOImpl(
      brandId: (json['brand_id'] as num).toInt(),
      brandName: json['brand_name'] as String?,
      promotionId: (json['promotion_id'] as num).toInt(),
      promotionName: json['promotion_name'] as String?,
      brandPromotionImage: json['brand_promotion_image'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$BrandPromotionDTOImplToJson(
        _$BrandPromotionDTOImpl instance) =>
    <String, dynamic>{
      'brand_id': instance.brandId,
      'brand_name': instance.brandName,
      'promotion_id': instance.promotionId,
      'promotion_name': instance.promotionName,
      'brand_promotion_image': instance.brandPromotionImage,
      'active': instance.active,
    };
