// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SizeState {
  Fresh<List<Size>> get sizes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Size>> sizes) initial,
    required TResult Function(Fresh<List<Size>> sizes) loadInProgress,
    required TResult Function(Fresh<List<Size>> sizes) loadSuccess,
    required TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Size>> sizes)? initial,
    TResult? Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult? Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult? Function(Fresh<List<Size>> sizes, SizeFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Size>> sizes)? initial,
    TResult Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeStateCopyWith<SizeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeStateCopyWith<$Res> {
  factory $SizeStateCopyWith(SizeState value, $Res Function(SizeState) then) =
      _$SizeStateCopyWithImpl<$Res, SizeState>;
  @useResult
  $Res call({Fresh<List<Size>> sizes});

  $FreshCopyWith<List<Size>, $Res> get sizes;
}

/// @nodoc
class _$SizeStateCopyWithImpl<$Res, $Val extends SizeState>
    implements $SizeStateCopyWith<$Res> {
  _$SizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizes = null,
  }) {
    return _then(_value.copyWith(
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Size>>,
    ) as $Val);
  }

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<Size>, $Res> get sizes {
    return $FreshCopyWith<List<Size>, $Res>(_value.sizes, (value) {
      return _then(_value.copyWith(sizes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SizeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Size>> sizes});

  @override
  $FreshCopyWith<List<Size>, $Res> get sizes;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SizeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizes = null,
  }) {
    return _then(_$InitialImpl(
      null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Size>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.sizes) : super._();

  @override
  final Fresh<List<Size>> sizes;

  @override
  String toString() {
    return 'SizeState.initial(sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.sizes, sizes) || other.sizes == sizes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sizes);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Size>> sizes) initial,
    required TResult Function(Fresh<List<Size>> sizes) loadInProgress,
    required TResult Function(Fresh<List<Size>> sizes) loadSuccess,
    required TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)
        loadFailure,
  }) {
    return initial(sizes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Size>> sizes)? initial,
    TResult? Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult? Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult? Function(Fresh<List<Size>> sizes, SizeFailure failure)?
        loadFailure,
  }) {
    return initial?.call(sizes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Size>> sizes)? initial,
    TResult Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(sizes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends SizeState {
  const factory _Initial(final Fresh<List<Size>> sizes) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<List<Size>> get sizes;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $SizeStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Size>> sizes});

  @override
  $FreshCopyWith<List<Size>, $Res> get sizes;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$SizeStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizes = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Size>>,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.sizes) : super._();

  @override
  final Fresh<List<Size>> sizes;

  @override
  String toString() {
    return 'SizeState.loadInProgress(sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.sizes, sizes) || other.sizes == sizes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sizes);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      __$$LoadInProgressImplCopyWithImpl<_$LoadInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Size>> sizes) initial,
    required TResult Function(Fresh<List<Size>> sizes) loadInProgress,
    required TResult Function(Fresh<List<Size>> sizes) loadSuccess,
    required TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)
        loadFailure,
  }) {
    return loadInProgress(sizes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Size>> sizes)? initial,
    TResult? Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult? Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult? Function(Fresh<List<Size>> sizes, SizeFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(sizes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Size>> sizes)? initial,
    TResult Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(sizes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends SizeState {
  const factory _LoadInProgress(final Fresh<List<Size>> sizes) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<Size>> get sizes;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $SizeStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Size>> sizes});

  @override
  $FreshCopyWith<List<Size>, $Res> get sizes;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$SizeStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizes = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Size>>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.sizes) : super._();

  @override
  final Fresh<List<Size>> sizes;

  @override
  String toString() {
    return 'SizeState.loadSuccess(sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.sizes, sizes) || other.sizes == sizes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sizes);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Size>> sizes) initial,
    required TResult Function(Fresh<List<Size>> sizes) loadInProgress,
    required TResult Function(Fresh<List<Size>> sizes) loadSuccess,
    required TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)
        loadFailure,
  }) {
    return loadSuccess(sizes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Size>> sizes)? initial,
    TResult? Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult? Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult? Function(Fresh<List<Size>> sizes, SizeFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(sizes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Size>> sizes)? initial,
    TResult Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(sizes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends SizeState {
  const factory _LoadSuccess(final Fresh<List<Size>> sizes) = _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<Size>> get sizes;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $SizeStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Size>> sizes, SizeFailure failure});

  @override
  $FreshCopyWith<List<Size>, $Res> get sizes;
  $SizeFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$SizeStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizes = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Size>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as SizeFailure,
    ));
  }

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SizeFailureCopyWith<$Res> get failure {
    return $SizeFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.sizes, this.failure) : super._();

  @override
  final Fresh<List<Size>> sizes;
  @override
  final SizeFailure failure;

  @override
  String toString() {
    return 'SizeState.loadFailure(sizes: $sizes, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.sizes, sizes) || other.sizes == sizes) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sizes, failure);

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Size>> sizes) initial,
    required TResult Function(Fresh<List<Size>> sizes) loadInProgress,
    required TResult Function(Fresh<List<Size>> sizes) loadSuccess,
    required TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)
        loadFailure,
  }) {
    return loadFailure(sizes, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Size>> sizes)? initial,
    TResult? Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult? Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult? Function(Fresh<List<Size>> sizes, SizeFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(sizes, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Size>> sizes)? initial,
    TResult Function(Fresh<List<Size>> sizes)? loadInProgress,
    TResult Function(Fresh<List<Size>> sizes)? loadSuccess,
    TResult Function(Fresh<List<Size>> sizes, SizeFailure failure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(sizes, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure extends SizeState {
  const factory _LoadFailure(
          final Fresh<List<Size>> sizes, final SizeFailure failure) =
      _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<Size>> get sizes;
  SizeFailure get failure;

  /// Create a copy of SizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
