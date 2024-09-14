// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BrandPromotionDTO _$BrandPromotionDTOFromJson(Map<String, dynamic> json) {
  return _BrandPromotionDTO.fromJson(json);
}

/// @nodoc
mixin _$BrandPromotionDTO {
  int get brandId => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String? get promotionName => throw _privateConstructorUsedError;
  String get brandPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this BrandPromotionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandPromotionDTOCopyWith<BrandPromotionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandPromotionDTOCopyWith<$Res> {
  factory $BrandPromotionDTOCopyWith(
          BrandPromotionDTO value, $Res Function(BrandPromotionDTO) then) =
      _$BrandPromotionDTOCopyWithImpl<$Res, BrandPromotionDTO>;
  @useResult
  $Res call(
      {int brandId,
      String? brandName,
      int promotionId,
      String? promotionName,
      String brandPromotionImage,
      bool active});
}

/// @nodoc
class _$BrandPromotionDTOCopyWithImpl<$Res, $Val extends BrandPromotionDTO>
    implements $BrandPromotionDTOCopyWith<$Res> {
  _$BrandPromotionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? brandName = freezed,
    Object? promotionId = null,
    Object? promotionName = freezed,
    Object? brandPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionName: freezed == promotionName
          ? _value.promotionName
          : promotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandPromotionImage: null == brandPromotionImage
          ? _value.brandPromotionImage
          : brandPromotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandPromotionDTOImplCopyWith<$Res>
    implements $BrandPromotionDTOCopyWith<$Res> {
  factory _$$BrandPromotionDTOImplCopyWith(_$BrandPromotionDTOImpl value,
          $Res Function(_$BrandPromotionDTOImpl) then) =
      __$$BrandPromotionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int brandId,
      String? brandName,
      int promotionId,
      String? promotionName,
      String brandPromotionImage,
      bool active});
}

/// @nodoc
class __$$BrandPromotionDTOImplCopyWithImpl<$Res>
    extends _$BrandPromotionDTOCopyWithImpl<$Res, _$BrandPromotionDTOImpl>
    implements _$$BrandPromotionDTOImplCopyWith<$Res> {
  __$$BrandPromotionDTOImplCopyWithImpl(_$BrandPromotionDTOImpl _value,
      $Res Function(_$BrandPromotionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? brandName = freezed,
    Object? promotionId = null,
    Object? promotionName = freezed,
    Object? brandPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$BrandPromotionDTOImpl(
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionName: freezed == promotionName
          ? _value.promotionName
          : promotionName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandPromotionImage: null == brandPromotionImage
          ? _value.brandPromotionImage
          : brandPromotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandPromotionDTOImpl extends _BrandPromotionDTO {
  const _$BrandPromotionDTOImpl(
      {required this.brandId,
      required this.brandName,
      required this.promotionId,
      required this.promotionName,
      required this.brandPromotionImage,
      required this.active})
      : super._();

  factory _$BrandPromotionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandPromotionDTOImplFromJson(json);

  @override
  final int brandId;
  @override
  final String? brandName;
  @override
  final int promotionId;
  @override
  final String? promotionName;
  @override
  final String brandPromotionImage;
  @override
  final bool active;

  @override
  String toString() {
    return 'BrandPromotionDTO(brandId: $brandId, brandName: $brandName, promotionId: $promotionId, promotionName: $promotionName, brandPromotionImage: $brandPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandPromotionDTOImpl &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.promotionName, promotionName) ||
                other.promotionName == promotionName) &&
            (identical(other.brandPromotionImage, brandPromotionImage) ||
                other.brandPromotionImage == brandPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, brandId, brandName, promotionId,
      promotionName, brandPromotionImage, active);

  /// Create a copy of BrandPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandPromotionDTOImplCopyWith<_$BrandPromotionDTOImpl> get copyWith =>
      __$$BrandPromotionDTOImplCopyWithImpl<_$BrandPromotionDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandPromotionDTOImplToJson(
      this,
    );
  }
}

abstract class _BrandPromotionDTO extends BrandPromotionDTO {
  const factory _BrandPromotionDTO(
      {required final int brandId,
      required final String? brandName,
      required final int promotionId,
      required final String? promotionName,
      required final String brandPromotionImage,
      required final bool active}) = _$BrandPromotionDTOImpl;
  const _BrandPromotionDTO._() : super._();

  factory _BrandPromotionDTO.fromJson(Map<String, dynamic> json) =
      _$BrandPromotionDTOImpl.fromJson;

  @override
  int get brandId;
  @override
  String? get brandName;
  @override
  int get promotionId;
  @override
  String? get promotionName;
  @override
  String get brandPromotionImage;
  @override
  bool get active;

  /// Create a copy of BrandPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandPromotionDTOImplCopyWith<_$BrandPromotionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
