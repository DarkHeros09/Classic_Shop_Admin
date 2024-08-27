// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryPromotion {
  int get categoryId => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String get categoryPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Create a copy of CategoryPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryPromotionCopyWith<CategoryPromotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPromotionCopyWith<$Res> {
  factory $CategoryPromotionCopyWith(
          CategoryPromotion value, $Res Function(CategoryPromotion) then) =
      _$CategoryPromotionCopyWithImpl<$Res, CategoryPromotion>;
  @useResult
  $Res call(
      {int categoryId,
      int promotionId,
      String categoryPromotionImage,
      bool active});
}

/// @nodoc
class _$CategoryPromotionCopyWithImpl<$Res, $Val extends CategoryPromotion>
    implements $CategoryPromotionCopyWith<$Res> {
  _$CategoryPromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? promotionId = null,
    Object? categoryPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPromotionImage: null == categoryPromotionImage
          ? _value.categoryPromotionImage
          : categoryPromotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryPromotionImplCopyWith<$Res>
    implements $CategoryPromotionCopyWith<$Res> {
  factory _$$CategoryPromotionImplCopyWith(_$CategoryPromotionImpl value,
          $Res Function(_$CategoryPromotionImpl) then) =
      __$$CategoryPromotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      int promotionId,
      String categoryPromotionImage,
      bool active});
}

/// @nodoc
class __$$CategoryPromotionImplCopyWithImpl<$Res>
    extends _$CategoryPromotionCopyWithImpl<$Res, _$CategoryPromotionImpl>
    implements _$$CategoryPromotionImplCopyWith<$Res> {
  __$$CategoryPromotionImplCopyWithImpl(_$CategoryPromotionImpl _value,
      $Res Function(_$CategoryPromotionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryPromotion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? promotionId = null,
    Object? categoryPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$CategoryPromotionImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryPromotionImage: null == categoryPromotionImage
          ? _value.categoryPromotionImage
          : categoryPromotionImage // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CategoryPromotionImpl implements _CategoryPromotion {
  const _$CategoryPromotionImpl(
      {required this.categoryId,
      required this.promotionId,
      required this.categoryPromotionImage,
      required this.active});

  @override
  final int categoryId;
  @override
  final int promotionId;
  @override
  final String categoryPromotionImage;
  @override
  final bool active;

  @override
  String toString() {
    return 'CategoryPromotion(categoryId: $categoryId, promotionId: $promotionId, categoryPromotionImage: $categoryPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPromotionImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.categoryPromotionImage, categoryPromotionImage) ||
                other.categoryPromotionImage == categoryPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, promotionId, categoryPromotionImage, active);

  /// Create a copy of CategoryPromotion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryPromotionImplCopyWith<_$CategoryPromotionImpl> get copyWith =>
      __$$CategoryPromotionImplCopyWithImpl<_$CategoryPromotionImpl>(
          this, _$identity);
}

abstract class _CategoryPromotion implements CategoryPromotion {
  const factory _CategoryPromotion(
      {required final int categoryId,
      required final int promotionId,
      required final String categoryPromotionImage,
      required final bool active}) = _$CategoryPromotionImpl;

  @override
  int get categoryId;
  @override
  int get promotionId;
  @override
  String get categoryPromotionImage;
  @override
  bool get active;

  /// Create a copy of CategoryPromotion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryPromotionImplCopyWith<_$CategoryPromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
