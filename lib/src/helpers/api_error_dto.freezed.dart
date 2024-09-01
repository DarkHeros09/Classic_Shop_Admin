// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiErrorDto _$ApiErrorDtoFromJson(Map<String, dynamic> json) {
  return _ApiErrorDto.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorDto {
  String get error => throw _privateConstructorUsedError;

  /// Serializes this ApiErrorDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorDtoCopyWith<ApiErrorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorDtoCopyWith<$Res> {
  factory $ApiErrorDtoCopyWith(
          ApiErrorDto value, $Res Function(ApiErrorDto) then) =
      _$ApiErrorDtoCopyWithImpl<$Res, ApiErrorDto>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ApiErrorDtoCopyWithImpl<$Res, $Val extends ApiErrorDto>
    implements $ApiErrorDtoCopyWith<$Res> {
  _$ApiErrorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorDtoImplCopyWith<$Res>
    implements $ApiErrorDtoCopyWith<$Res> {
  factory _$$ApiErrorDtoImplCopyWith(
          _$ApiErrorDtoImpl value, $Res Function(_$ApiErrorDtoImpl) then) =
      __$$ApiErrorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ApiErrorDtoImplCopyWithImpl<$Res>
    extends _$ApiErrorDtoCopyWithImpl<$Res, _$ApiErrorDtoImpl>
    implements _$$ApiErrorDtoImplCopyWith<$Res> {
  __$$ApiErrorDtoImplCopyWithImpl(
      _$ApiErrorDtoImpl _value, $Res Function(_$ApiErrorDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ApiErrorDtoImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorDtoImpl extends _ApiErrorDto {
  const _$ApiErrorDtoImpl({required this.error}) : super._();

  factory _$ApiErrorDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorDtoImplFromJson(json);

  @override
  final String error;

  @override
  String toString() {
    return 'ApiErrorDto(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorDtoImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorDtoImplCopyWith<_$ApiErrorDtoImpl> get copyWith =>
      __$$ApiErrorDtoImplCopyWithImpl<_$ApiErrorDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorDtoImplToJson(
      this,
    );
  }
}

abstract class _ApiErrorDto extends ApiErrorDto {
  const factory _ApiErrorDto({required final String error}) = _$ApiErrorDtoImpl;
  const _ApiErrorDto._() : super._();

  factory _ApiErrorDto.fromJson(Map<String, dynamic> json) =
      _$ApiErrorDtoImpl.fromJson;

  @override
  String get error;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorDtoImplCopyWith<_$ApiErrorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
