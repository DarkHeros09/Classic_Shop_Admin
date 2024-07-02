// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode) api,
    required TResult Function(Exception? exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? errorCode)? api,
    TResult? Function(Exception? exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode)? api,
    TResult Function(Exception? exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Api value)? api,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardFailureCopyWith<$Res> {
  factory $DashboardFailureCopyWith(
          DashboardFailure value, $Res Function(DashboardFailure) then) =
      _$DashboardFailureCopyWithImpl<$Res, DashboardFailure>;
}

/// @nodoc
class _$DashboardFailureCopyWithImpl<$Res, $Val extends DashboardFailure>
    implements $DashboardFailureCopyWith<$Res> {
  _$DashboardFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ApiImplCopyWith<$Res> {
  factory _$$ApiImplCopyWith(_$ApiImpl value, $Res Function(_$ApiImpl) then) =
      __$$ApiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? errorCode});
}

/// @nodoc
class __$$ApiImplCopyWithImpl<$Res>
    extends _$DashboardFailureCopyWithImpl<$Res, _$ApiImpl>
    implements _$$ApiImplCopyWith<$Res> {
  __$$ApiImplCopyWithImpl(_$ApiImpl _value, $Res Function(_$ApiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = freezed,
  }) {
    return _then(_$ApiImpl(
      freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ApiImpl extends _Api {
  const _$ApiImpl(this.errorCode) : super._();

  @override
  final int? errorCode;

  @override
  String toString() {
    return 'DashboardFailure.api(errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiImplCopyWith<_$ApiImpl> get copyWith =>
      __$$ApiImplCopyWithImpl<_$ApiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode) api,
    required TResult Function(Exception? exception) error,
  }) {
    return api(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? errorCode)? api,
    TResult? Function(Exception? exception)? error,
  }) {
    return api?.call(errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode)? api,
    TResult Function(Exception? exception)? error,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_Error value) error,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Api value)? api,
    TResult? Function(_Error value)? error,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class _Api extends DashboardFailure {
  const factory _Api(final int? errorCode) = _$ApiImpl;
  const _Api._() : super._();

  int? get errorCode;
  @JsonKey(ignore: true)
  _$$ApiImplCopyWith<_$ApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception? exception});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DashboardFailureCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$ErrorImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl(this.exception) : super._();

  @override
  final Exception? exception;

  @override
  String toString() {
    return 'DashboardFailure.error(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? errorCode) api,
    required TResult Function(Exception? exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? errorCode)? api,
    TResult? Function(Exception? exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? errorCode)? api,
    TResult Function(Exception? exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Api value) api,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Api value)? api,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Api value)? api,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends DashboardFailure {
  const factory _Error(final Exception? exception) = _$ErrorImpl;
  const _Error._() : super._();

  Exception? get exception;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
