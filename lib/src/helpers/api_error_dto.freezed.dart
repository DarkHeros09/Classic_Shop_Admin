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

ApiErrorDTO _$ApiErrorDTOFromJson(Map<String, dynamic> json) {
  return _ApiErrorDTO.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorDTO {
  String get error => throw _privateConstructorUsedError;

  /// Serializes this ApiErrorDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiErrorDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorDTOCopyWith<ApiErrorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorDTOCopyWith<$Res> {
  factory $ApiErrorDTOCopyWith(
          ApiErrorDTO value, $Res Function(ApiErrorDTO) then) =
      _$ApiErrorDTOCopyWithImpl<$Res, ApiErrorDTO>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ApiErrorDTOCopyWithImpl<$Res, $Val extends ApiErrorDTO>
    implements $ApiErrorDTOCopyWith<$Res> {
  _$ApiErrorDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiErrorDTO
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
abstract class _$$ApiErrorDTOImplCopyWith<$Res>
    implements $ApiErrorDTOCopyWith<$Res> {
  factory _$$ApiErrorDTOImplCopyWith(
          _$ApiErrorDTOImpl value, $Res Function(_$ApiErrorDTOImpl) then) =
      __$$ApiErrorDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ApiErrorDTOImplCopyWithImpl<$Res>
    extends _$ApiErrorDTOCopyWithImpl<$Res, _$ApiErrorDTOImpl>
    implements _$$ApiErrorDTOImplCopyWith<$Res> {
  __$$ApiErrorDTOImplCopyWithImpl(
      _$ApiErrorDTOImpl _value, $Res Function(_$ApiErrorDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiErrorDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ApiErrorDTOImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorDTOImpl extends _ApiErrorDTO {
  const _$ApiErrorDTOImpl({required this.error}) : super._();

  factory _$ApiErrorDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorDTOImplFromJson(json);

  @override
  final String error;

  @override
  String toString() {
    return 'ApiErrorDTO(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorDTOImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ApiErrorDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorDTOImplCopyWith<_$ApiErrorDTOImpl> get copyWith =>
      __$$ApiErrorDTOImplCopyWithImpl<_$ApiErrorDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorDTOImplToJson(
      this,
    );
  }
}

abstract class _ApiErrorDTO extends ApiErrorDTO {
  const factory _ApiErrorDTO({required final String error}) = _$ApiErrorDTOImpl;
  const _ApiErrorDTO._() : super._();

  factory _ApiErrorDTO.fromJson(Map<String, dynamic> json) =
      _$ApiErrorDTOImpl.fromJson;

  @override
  String get error;

  /// Create a copy of ApiErrorDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorDTOImplCopyWith<_$ApiErrorDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
