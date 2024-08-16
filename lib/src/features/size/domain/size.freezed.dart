// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Size {
  int get id => throw _privateConstructorUsedError;
  String get sizeValue => throw _privateConstructorUsedError;

  /// Create a copy of Size
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeCopyWith<Size> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeCopyWith<$Res> {
  factory $SizeCopyWith(Size value, $Res Function(Size) then) =
      _$SizeCopyWithImpl<$Res, Size>;
  @useResult
  $Res call({int id, String sizeValue});
}

/// @nodoc
class _$SizeCopyWithImpl<$Res, $Val extends Size>
    implements $SizeCopyWith<$Res> {
  _$SizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Size
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
abstract class _$$SizeImplCopyWith<$Res> implements $SizeCopyWith<$Res> {
  factory _$$SizeImplCopyWith(
          _$SizeImpl value, $Res Function(_$SizeImpl) then) =
      __$$SizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String sizeValue});
}

/// @nodoc
class __$$SizeImplCopyWithImpl<$Res>
    extends _$SizeCopyWithImpl<$Res, _$SizeImpl>
    implements _$$SizeImplCopyWith<$Res> {
  __$$SizeImplCopyWithImpl(_$SizeImpl _value, $Res Function(_$SizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Size
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sizeValue = null,
  }) {
    return _then(_$SizeImpl(
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

class _$SizeImpl implements _Size {
  const _$SizeImpl({required this.id, required this.sizeValue});

  @override
  final int id;
  @override
  final String sizeValue;

  @override
  String toString() {
    return 'Size(id: $id, sizeValue: $sizeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sizeValue, sizeValue) ||
                other.sizeValue == sizeValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, sizeValue);

  /// Create a copy of Size
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeImplCopyWith<_$SizeImpl> get copyWith =>
      __$$SizeImplCopyWithImpl<_$SizeImpl>(this, _$identity);
}

abstract class _Size implements Size {
  const factory _Size(
      {required final int id, required final String sizeValue}) = _$SizeImpl;

  @override
  int get id;
  @override
  String get sizeValue;

  /// Create a copy of Size
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeImplCopyWith<_$SizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}