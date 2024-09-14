// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPromotion {
  int get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String? get promotionName => throw _privateConstructorUsedError;
  String get productPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Create a copy of ProductPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPromotionCopyWith<ProductPromotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPromotionCopyWith<$Res> {
  factory $ProductPromotionCopyWith(
          ProductPromotion value, $Res Function(ProductPromotion) then) =
      _$ProductPromotionCopyWithImpl<$Res, ProductPromotion>;
  @useResult
  $Res call(
      {int productId,
      String? productName,
      int promotionId,
      String? promotionName,
      String productPromotionImage,
      bool active});
}

/// @nodoc
class _$ProductPromotionCopyWithImpl<$Res, $Val extends ProductPromotion>
    implements $ProductPromotionCopyWith<$Res> {
  _$ProductPromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = freezed,
    Object? promotionId = null,
    Object? promotionName = freezed,
    Object? productPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionName: freezed == promotionName
          ? _value.promotionName
          : promotionName // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ProductPromotionImplCopyWith<$Res>
    implements $ProductPromotionCopyWith<$Res> {
  factory _$$ProductPromotionImplCopyWith(_$ProductPromotionImpl value,
          $Res Function(_$ProductPromotionImpl) then) =
      __$$ProductPromotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId,
      String? productName,
      int promotionId,
      String? promotionName,
      String productPromotionImage,
      bool active});
}

/// @nodoc
class __$$ProductPromotionImplCopyWithImpl<$Res>
    extends _$ProductPromotionCopyWithImpl<$Res, _$ProductPromotionImpl>
    implements _$$ProductPromotionImplCopyWith<$Res> {
  __$$ProductPromotionImplCopyWithImpl(_$ProductPromotionImpl _value,
      $Res Function(_$ProductPromotionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = freezed,
    Object? promotionId = null,
    Object? promotionName = freezed,
    Object? productPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$ProductPromotionImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionName: freezed == promotionName
          ? _value.promotionName
          : promotionName // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$ProductPromotionImpl implements _ProductPromotion {
  const _$ProductPromotionImpl(
      {required this.productId,
      required this.productName,
      required this.promotionId,
      required this.promotionName,
      required this.productPromotionImage,
      required this.active});

  @override
  final int productId;
  @override
  final String? productName;
  @override
  final int promotionId;
  @override
  final String? promotionName;
  @override
  final String productPromotionImage;
  @override
  final bool active;

  @override
  String toString() {
    return 'ProductPromotion(productId: $productId, productName: $productName, promotionId: $promotionId, promotionName: $promotionName, productPromotionImage: $productPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPromotionImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.promotionName, promotionName) ||
                other.promotionName == promotionName) &&
            (identical(other.productPromotionImage, productPromotionImage) ||
                other.productPromotionImage == productPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, productName,
      promotionId, promotionName, productPromotionImage, active);

  /// Create a copy of ProductPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPromotionImplCopyWith<_$ProductPromotionImpl> get copyWith =>
      __$$ProductPromotionImplCopyWithImpl<_$ProductPromotionImpl>(
          this, _$identity);
}

abstract class _ProductPromotion implements ProductPromotion {
  const factory _ProductPromotion(
      {required final int productId,
      required final String? productName,
      required final int promotionId,
      required final String? promotionName,
      required final String productPromotionImage,
      required final bool active}) = _$ProductPromotionImpl;

  @override
  int get productId;
  @override
  String? get productName;
  @override
  int get promotionId;
  @override
  String? get promotionName;
  @override
  String get productPromotionImage;
  @override
  bool get active;

  /// Create a copy of ProductPromotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPromotionImplCopyWith<_$ProductPromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
