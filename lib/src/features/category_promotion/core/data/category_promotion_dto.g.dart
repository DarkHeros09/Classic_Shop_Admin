// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryPromotionDTOImpl _$$CategoryPromotionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryPromotionDTOImpl(
      categoryId: (json['category_id'] as num).toInt(),
      categoryName: json['category_name'] as String?,
      promotionId: (json['promotion_id'] as num).toInt(),
      promotionName: json['promotion_name'] as String?,
      categoryPromotionImage: json['category_promotion_image'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$CategoryPromotionDTOImplToJson(
        _$CategoryPromotionDTOImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'promotion_id': instance.promotionId,
      'promotion_name': instance.promotionName,
      'category_promotion_image': instance.categoryPromotionImage,
      'active': instance.active,
    };
