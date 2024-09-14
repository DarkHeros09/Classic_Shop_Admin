// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SizeDTO _$SizeDTOFromJson(Map<String, dynamic> json) {
  return _SizeDTO.fromJson(json);
}

/// @nodoc
mixin _$SizeDTO {
  int get id => throw _privateConstructorUsedError;
  String get sizeValue => throw _privateConstructorUsedError;

  /// Serializes this SizeDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SizeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeDTOCopyWith<SizeDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeDTOCopyWith<$Res> {
  factory $SizeDTOCopyWith(SizeDTO value, $Res Function(SizeDTO) then) =
      _$SizeDTOCopyWithImpl<$Res, SizeDTO>;
  @useResult
  $Res call({int id, String sizeValue});
}

/// @nodoc
class _$SizeDTOCopyWithImpl<$Res, $Val extends SizeDTO>
    implements $SizeDTOCopyWith<$Res> {
  _$SizeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sizeValue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sizeValue: null == sizeValue
          ? _value.sizeValue
          : sizeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SizeDTOImplCopyWith<$Res> implements $SizeDTOCopyWith<$Res> {
  factory _$$SizeDTOImplCopyWith(
          _$SizeDTOImpl value, $Res Function(_$SizeDTOImpl) then) =
      __$$SizeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String sizeValue});
}

/// @nodoc
class __$$SizeDTOImplCopyWithImpl<$Res>
    extends _$SizeDTOCopyWithImpl<$Res, _$SizeDTOImpl>
    implements _$$SizeDTOImplCopyWith<$Res> {
  __$$SizeDTOImplCopyWithImpl(
      _$SizeDTOImpl _value, $Res Function(_$SizeDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sizeValue = null,
  }) {
    return _then(_$SizeDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sizeValue: null == sizeValue
          ? _value.sizeValue
          : sizeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SizeDTOImpl extends _SizeDTO {
  const _$SizeDTOImpl({required this.id, required this.sizeValue}) : super._();

  factory _$SizeDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SizeDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String sizeValue;

  @override
  String toString() {
    return 'SizeDTO(id: $id, sizeValue: $sizeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sizeValue, sizeValue) ||
                other.sizeValue == sizeValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sizeValue);

  /// Create a copy of SizeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeDTOImplCopyWith<_$SizeDTOImpl> get copyWith =>
      __$$SizeDTOImplCopyWithImpl<_$SizeDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SizeDTOImplToJson(
      this,
    );
  }
}

abstract class _SizeDTO extends SizeDTO {
  const factory _SizeDTO(
      {required final int id, required final String sizeValue}) = _$SizeDTOImpl;
  const _SizeDTO._() : super._();

  factory _SizeDTO.fromJson(Map<String, dynamic> json) = _$SizeDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get sizeValue;

  /// Create a copy of SizeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeDTOImplCopyWith<_$SizeDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
