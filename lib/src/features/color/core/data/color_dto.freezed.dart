// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ColorDTO _$ColorDTOFromJson(Map<String, dynamic> json) {
  return _ColorDTO.fromJson(json);
}

/// @nodoc
mixin _$ColorDTO {
  int get id => throw _privateConstructorUsedError;
  String get colorValue => throw _privateConstructorUsedError;

  /// Serializes this ColorDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorDTOCopyWith<ColorDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorDTOCopyWith<$Res> {
  factory $ColorDTOCopyWith(ColorDTO value, $Res Function(ColorDTO) then) =
      _$ColorDTOCopyWithImpl<$Res, ColorDTO>;
  @useResult
  $Res call({int id, String colorValue});
}

/// @nodoc
class _$ColorDTOCopyWithImpl<$Res, $Val extends ColorDTO>
    implements $ColorDTOCopyWith<$Res> {
  _$ColorDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? colorValue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorDTOImplCopyWith<$Res>
    implements $ColorDTOCopyWith<$Res> {
  factory _$$ColorDTOImplCopyWith(
          _$ColorDTOImpl value, $Res Function(_$ColorDTOImpl) then) =
      __$$ColorDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String colorValue});
}

/// @nodoc
class __$$ColorDTOImplCopyWithImpl<$Res>
    extends _$ColorDTOCopyWithImpl<$Res, _$ColorDTOImpl>
    implements _$$ColorDTOImplCopyWith<$Res> {
  __$$ColorDTOImplCopyWithImpl(
      _$ColorDTOImpl _value, $Res Function(_$ColorDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? colorValue = null,
  }) {
    return _then(_$ColorDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorDTOImpl extends _ColorDTO {
  const _$ColorDTOImpl({required this.id, required this.colorValue})
      : super._();

  factory _$ColorDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String colorValue;

  @override
  String toString() {
    return 'ColorDTO(id: $id, colorValue: $colorValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, colorValue);

  /// Create a copy of ColorDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorDTOImplCopyWith<_$ColorDTOImpl> get copyWith =>
      __$$ColorDTOImplCopyWithImpl<_$ColorDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorDTOImplToJson(
      this,
    );
  }
}

abstract class _ColorDTO extends ColorDTO {
  const factory _ColorDTO(
      {required final int id,
      required final String colorValue}) = _$ColorDTOImpl;
  const _ColorDTO._() : super._();

  factory _ColorDTO.fromJson(Map<String, dynamic> json) =
      _$ColorDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get colorValue;

  /// Create a copy of ColorDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorDTOImplCopyWith<_$ColorDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
