// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPromotionDTO _$ProductPromotionDTOFromJson(Map<String, dynamic> json) {
  return _ProductPromotionDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductPromotionDTO {
  int get productId => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String get productPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this ProductPromotionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPromotionDTOCopyWith<ProductPromotionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPromotionDTOCopyWith<$Res> {
  factory $ProductPromotionDTOCopyWith(
          ProductPromotionDTO value, $Res Function(ProductPromotionDTO) then) =
      _$ProductPromotionDTOCopyWithImpl<$Res, ProductPromotionDTO>;
  @useResult
  $Res call(
      {int productId,
      int promotionId,
      String productPromotionImage,
      bool active});
}

/// @nodoc
class _$ProductPromotionDTOCopyWithImpl<$Res, $Val extends ProductPromotionDTO>
    implements $ProductPromotionDTOCopyWith<$Res> {
  _$ProductPromotionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? promotionId = null,
    Object? productPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      productPromotionImage: null == productPromotionImage
          ? _value.productPromotionImage
          : productPromotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPromotionDTOImplCopyWith<$Res>
    implements $ProductPromotionDTOCopyWith<$Res> {
  factory _$$ProductPromotionDTOImplCopyWith(_$ProductPromotionDTOImpl value,
          $Res Function(_$ProductPromotionDTOImpl) then) =
      __$$ProductPromotionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId,
      int promotionId,
      String productPromotionImage,
      bool active});
}

/// @nodoc
class __$$ProductPromotionDTOImplCopyWithImpl<$Res>
    extends _$ProductPromotionDTOCopyWithImpl<$Res, _$ProductPromotionDTOImpl>
    implements _$$ProductPromotionDTOImplCopyWith<$Res> {
  __$$ProductPromotionDTOImplCopyWithImpl(_$ProductPromotionDTOImpl _value,
      $Res Function(_$ProductPromotionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? promotionId = null,
    Object? productPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$ProductPromotionDTOImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      productPromotionImage: null == productPromotionImage
          ? _value.productPromotionImage
          : productPromotionImage // ignore: cast_nullable_to_non_nullable
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
class _$ProductPromotionDTOImpl extends _ProductPromotionDTO {
  const _$ProductPromotionDTOImpl(
      {required this.productId,
      required this.promotionId,
      required this.productPromotionImage,
      required this.active})
      : super._();

  factory _$ProductPromotionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPromotionDTOImplFromJson(json);

  @override
  final int productId;
  @override
  final int promotionId;
  @override
  final String productPromotionImage;
  @override
  final bool active;

  @override
  String toString() {
    return 'ProductPromotionDTO(productId: $productId, promotionId: $promotionId, productPromotionImage: $productPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPromotionDTOImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.productPromotionImage, productPromotionImage) ||
                other.productPromotionImage == productPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, promotionId, productPromotionImage, active);

  /// Create a copy of ProductPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPromotionDTOImplCopyWith<_$ProductPromotionDTOImpl> get copyWith =>
      __$$ProductPromotionDTOImplCopyWithImpl<_$ProductPromotionDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPromotionDTOImplToJson(
      this,
    );
  }
}

abstract class _ProductPromotionDTO extends ProductPromotionDTO {
  const factory _ProductPromotionDTO(
      {required final int productId,
      required final int promotionId,
      required final String productPromotionImage,
      required final bool active}) = _$ProductPromotionDTOImpl;
  const _ProductPromotionDTO._() : super._();

  factory _ProductPromotionDTO.fromJson(Map<String, dynamic> json) =
      _$ProductPromotionDTOImpl.fromJson;

  @override
  int get productId;
  @override
  int get promotionId;
  @override
  String get productPromotionImage;
  @override
  bool get active;

  /// Create a copy of ProductPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPromotionDTOImplCopyWith<_$ProductPromotionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
