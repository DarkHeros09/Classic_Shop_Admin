// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorDTOImpl _$$ColorDTOImplFromJson(Map<String, dynamic> json) =>
    _$ColorDTOImpl(
      id: (json['id'] as num).toInt(),
      colorValue: json['color_value'] as String,
    );

Map<String, dynamic> _$$ColorDTOImplToJson(_$ColorDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color_value': instance.colorValue,
    };
