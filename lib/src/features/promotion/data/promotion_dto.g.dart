// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotionDTOImpl _$$PromotionDTOImplFromJson(Map<String, dynamic> json) =>
    _$PromotionDTOImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      discountRate: (json['discount_rate'] as num).toInt(),
      active: json['active'] as bool,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$$PromotionDTOImplToJson(_$PromotionDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'discount_rate': instance.discountRate,
      'active': instance.active,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
    };
