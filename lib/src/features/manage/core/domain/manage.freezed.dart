// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Manage {
  int get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  int get brandId => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;

  /// Create a copy of Manage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageCopyWith<Manage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageCopyWith<$Res> {
  factory $ManageCopyWith(Manage value, $Res Function(Manage) then) =
      _$ManageCopyWithImpl<$Res, Manage>;
  @useResult
  $Res call(
      {int categoryId, String categoryName, int brandId, String brandName});
}

/// @nodoc
class _$ManageCopyWithImpl<$Res, $Val extends Manage>
    implements $ManageCopyWith<$Res> {
  _$ManageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Manage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? brandId = null,
    Object? brandName = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManageImplCopyWith<$Res> implements $ManageCopyWith<$Res> {
  factory _$$ManageImplCopyWith(
          _$ManageImpl value, $Res Function(_$ManageImpl) then) =
      __$$ManageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId, String categoryName, int brandId, String brandName});
}

/// @nodoc
class __$$ManageImplCopyWithImpl<$Res>
    extends _$ManageCopyWithImpl<$Res, _$ManageImpl>
    implements _$$ManageImplCopyWith<$Res> {
  __$$ManageImplCopyWithImpl(
      _$ManageImpl _value, $Res Function(_$ManageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Manage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? brandId = null,
    Object? brandName = null,
  }) {
    return _then(_$ManageImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      brandId: null == brandId
          ? _value.brandId
          : brandId // ignore: cast_nullable_to_non_nullable
              as int,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ManageImpl extends _Manage {
  const _$ManageImpl(
      {required this.categoryId,
      required this.categoryName,
      required this.brandId,
      required this.brandName})
      : super._();

  @override
  final int categoryId;
  @override
  final String categoryName;
  @override
  final int brandId;
  @override
  final String brandName;

  @override
  String toString() {
    return 'Manage(categoryId: $categoryId, categoryName: $categoryName, brandId: $brandId, brandName: $brandName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, categoryName, brandId, brandName);

  /// Create a copy of Manage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageImplCopyWith<_$ManageImpl> get copyWith =>
      __$$ManageImplCopyWithImpl<_$ManageImpl>(this, _$identity);
}

abstract class _Manage extends Manage {
  const factory _Manage(
      {required final int categoryId,
      required final String categoryName,
      required final int brandId,
      required final String brandName}) = _$ManageImpl;
  const _Manage._() : super._();

  @override
  int get categoryId;
  @override
  String get categoryName;
  @override
  int get brandId;
  @override
  String get brandName;

  /// Create a copy of Manage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageImplCopyWith<_$ManageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
