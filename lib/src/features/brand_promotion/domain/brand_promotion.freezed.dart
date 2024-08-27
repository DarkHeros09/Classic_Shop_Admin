// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandPromotion {
  int get brandId => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String get brandPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Create a copy of BrandPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandPromotionCopyWith<BrandPromotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandPromotionCopyWith<$Res> {
  factory $BrandPromotionCopyWith(
          BrandPromotion value, $Res Function(BrandPromotion) then) =
      _$BrandPromotionCopyWithImpl<$Res, BrandPromotion>;
  @useResult
  $Res call(
      {int brandId, int promotionId, String brandPromotionImage, bool active});
}

/// @nodoc
class _$BrandPromotionCopyWithImpl<$Res, $Val extends BrandPromotion>
    implements $BrandPromotionCopyWith<$Res> {
  _$BrandPromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? promotionId = null,
    Object? brandPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$BrandPromotionImplCopyWith<$Res>
    implements $BrandPromotionCopyWith<$Res> {
  factory _$$BrandPromotionImplCopyWith(_$BrandPromotionImpl value,
          $Res Function(_$BrandPromotionImpl) then) =
      __$$BrandPromotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int brandId, int promotionId, String brandPromotionImage, bool active});
}

/// @nodoc
class __$$BrandPromotionImplCopyWithImpl<$Res>
    extends _$BrandPromotionCopyWithImpl<$Res, _$BrandPromotionImpl>
    implements _$$BrandPromotionImplCopyWith<$Res> {
  __$$BrandPromotionImplCopyWithImpl(
      _$BrandPromotionImpl _value, $Res Function(_$BrandPromotionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? promotionId = null,
    Object? brandPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$BrandPromotionImpl(
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$BrandPromotionImpl implements _BrandPromotion {
  const _$BrandPromotionImpl(
      {required this.brandId,
      required this.promotionId,
      required this.brandPromotionImage,
      required this.active});

  @override
  final int brandId;
  @override
  final int promotionId;
  @override
  final String brandPromotionImage;
  @override
  final bool active;

  @override
  String toString() {
    return 'BrandPromotion(brandId: $brandId, promotionId: $promotionId, brandPromotionImage: $brandPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandPromotionImpl &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.brandPromotionImage, brandPromotionImage) ||
                other.brandPromotionImage == brandPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, brandId, promotionId, brandPromotionImage, active);

  /// Create a copy of BrandPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandPromotionImplCopyWith<_$BrandPromotionImpl> get copyWith =>
      __$$BrandPromotionImplCopyWithImpl<_$BrandPromotionImpl>(
          this, _$identity);
}

abstract class _BrandPromotion implements BrandPromotion {
  const factory _BrandPromotion(
      {required final int brandId,
      required final int promotionId,
      required final String brandPromotionImage,
      required final bool active}) = _$BrandPromotionImpl;

  @override
  int get brandId;
  @override
  int get promotionId;
  @override
  String get brandPromotionImage;
  @override
  bool get active;

  /// Create a copy of BrandPromotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandPromotionImplCopyWith<_$BrandPromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
