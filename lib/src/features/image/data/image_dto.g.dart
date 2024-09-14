// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageKitDTOImpl _$$ImageKitDTOImplFromJson(Map<String, dynamic> json) =>
    _$ImageKitDTOImpl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ImageKitDTOImplToJson(_$ImageKitDTOImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$ProductItemImageDTOImpl _$$ProductItemImageDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductItemImageDTOImpl(
      id: (json['id'] as num).toInt(),
      productImage_1: json['product_image_1'] as String,
      productImage_2: json['product_image_2'] as String,
      productImage_3: json['product_image_3'] as String,
    );

Map<String, dynamic> _$$ProductItemImageDTOImplToJson(
        _$ProductItemImageDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_image_1': instance.productImage_1,
      'product_image_2': instance.productImage_2,
      'product_image_3': instance.productImage_3,
    };
