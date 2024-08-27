// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryPromotionDTO _$CategoryPromotionDTOFromJson(Map<String, dynamic> json) {
  return _CategoryPromotionDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryPromotionDTO {
  int get categoryId => throw _privateConstructorUsedError;
  int get promotionId => throw _privateConstructorUsedError;
  String get categoryPromotionImage => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this CategoryPromotionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryPromotionDTOCopyWith<CategoryPromotionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPromotionDTOCopyWith<$Res> {
  factory $CategoryPromotionDTOCopyWith(CategoryPromotionDTO value,
          $Res Function(CategoryPromotionDTO) then) =
      _$CategoryPromotionDTOCopyWithImpl<$Res, CategoryPromotionDTO>;
  @useResult
  $Res call(
      {int categoryId,
      int promotionId,
      String categoryPromotionImage,
      bool active});
}

/// @nodoc
class _$CategoryPromotionDTOCopyWithImpl<$Res,
        $Val extends CategoryPromotionDTO>
    implements $CategoryPromotionDTOCopyWith<$Res> {
  _$CategoryPromotionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryPromotionDTO
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
abstract class _$$CategoryPromotionDTOImplCopyWith<$Res>
    implements $CategoryPromotionDTOCopyWith<$Res> {
  factory _$$CategoryPromotionDTOImplCopyWith(_$CategoryPromotionDTOImpl value,
          $Res Function(_$CategoryPromotionDTOImpl) then) =
      __$$CategoryPromotionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      int promotionId,
      String categoryPromotionImage,
      bool active});
}

/// @nodoc
class __$$CategoryPromotionDTOImplCopyWithImpl<$Res>
    extends _$CategoryPromotionDTOCopyWithImpl<$Res, _$CategoryPromotionDTOImpl>
    implements _$$CategoryPromotionDTOImplCopyWith<$Res> {
  __$$CategoryPromotionDTOImplCopyWithImpl(_$CategoryPromotionDTOImpl _value,
      $Res Function(_$CategoryPromotionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? promotionId = null,
    Object? categoryPromotionImage = null,
    Object? active = null,
  }) {
    return _then(_$CategoryPromotionDTOImpl(
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
@JsonSerializable()
class _$CategoryPromotionDTOImpl extends _CategoryPromotionDTO {
  const _$CategoryPromotionDTOImpl(
      {required this.categoryId,
      required this.promotionId,
      required this.categoryPromotionImage,
      required this.active})
      : super._();

  factory _$CategoryPromotionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryPromotionDTOImplFromJson(json);

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
    return 'CategoryPromotionDTO(categoryId: $categoryId, promotionId: $promotionId, categoryPromotionImage: $categoryPromotionImage, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPromotionDTOImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.categoryPromotionImage, categoryPromotionImage) ||
                other.categoryPromotionImage == categoryPromotionImage) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, promotionId, categoryPromotionImage, active);

  /// Create a copy of CategoryPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryPromotionDTOImplCopyWith<_$CategoryPromotionDTOImpl>
      get copyWith =>
          __$$CategoryPromotionDTOImplCopyWithImpl<_$CategoryPromotionDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryPromotionDTOImplToJson(
      this,
    );
  }
}

abstract class _CategoryPromotionDTO extends CategoryPromotionDTO {
  const factory _CategoryPromotionDTO(
      {required final int categoryId,
      required final int promotionId,
      required final String categoryPromotionImage,
      required final bool active}) = _$CategoryPromotionDTOImpl;
  const _CategoryPromotionDTO._() : super._();

  factory _CategoryPromotionDTO.fromJson(Map<String, dynamic> json) =
      _$CategoryPromotionDTOImpl.fromJson;

  @override
  int get categoryId;
  @override
  int get promotionId;
  @override
  String get categoryPromotionImage;
  @override
  bool get active;

  /// Create a copy of CategoryPromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryPromotionDTOImplCopyWith<_$CategoryPromotionDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
