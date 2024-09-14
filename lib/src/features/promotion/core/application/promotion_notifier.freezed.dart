// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PromotionState {
  Fresh<List<Promotion>> get promotions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Promotion>> promotions) initial,
    required TResult Function(Fresh<List<Promotion>> promotions) loadInProgress,
    required TResult Function(Fresh<List<Promotion>> promotions) loadSuccess,
    required TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Promotion>> promotions)? initial,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult? Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Promotion>> promotions)? initial,
    TResult Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
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

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionStateCopyWith<PromotionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionStateCopyWith<$Res> {
  factory $PromotionStateCopyWith(
          PromotionState value, $Res Function(PromotionState) then) =
      _$PromotionStateCopyWithImpl<$Res, PromotionState>;
  @useResult
  $Res call({Fresh<List<Promotion>> promotions});

  $FreshCopyWith<List<Promotion>, $Res> get promotions;
}

/// @nodoc
class _$PromotionStateCopyWithImpl<$Res, $Val extends PromotionState>
    implements $PromotionStateCopyWith<$Res> {
  _$PromotionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_value.copyWith(
      promotions: null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Promotion>>,
    ) as $Val);
  }

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<Promotion>, $Res> get promotions {
    return $FreshCopyWith<List<Promotion>, $Res>(_value.promotions, (value) {
      return _then(_value.copyWith(promotions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PromotionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Promotion>> promotions});

  @override
  $FreshCopyWith<List<Promotion>, $Res> get promotions;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PromotionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_$InitialImpl(
      null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Promotion>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.promotions) : super._();

  @override
  final Fresh<List<Promotion>> promotions;

  @override
  String toString() {
    return 'PromotionState.initial(promotions: $promotions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.promotions, promotions) ||
                other.promotions == promotions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promotions);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Promotion>> promotions) initial,
    required TResult Function(Fresh<List<Promotion>> promotions) loadInProgress,
    required TResult Function(Fresh<List<Promotion>> promotions) loadSuccess,
    required TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)
        loadFailure,
  }) {
    return initial(promotions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Promotion>> promotions)? initial,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult? Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
  }) {
    return initial?.call(promotions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Promotion>> promotions)? initial,
    TResult Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(promotions);
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

abstract class _Initial extends PromotionState {
  const factory _Initial(final Fresh<List<Promotion>> promotions) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<List<Promotion>> get promotions;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $PromotionStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Promotion>> promotions});

  @override
  $FreshCopyWith<List<Promotion>, $Res> get promotions;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$PromotionStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Promotion>>,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.promotions) : super._();

  @override
  final Fresh<List<Promotion>> promotions;

  @override
  String toString() {
    return 'PromotionState.loadInProgress(promotions: $promotions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.promotions, promotions) ||
                other.promotions == promotions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promotions);

  /// Create a copy of PromotionState
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
    required TResult Function(Fresh<List<Promotion>> promotions) initial,
    required TResult Function(Fresh<List<Promotion>> promotions) loadInProgress,
    required TResult Function(Fresh<List<Promotion>> promotions) loadSuccess,
    required TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)
        loadFailure,
  }) {
    return loadInProgress(promotions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Promotion>> promotions)? initial,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult? Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(promotions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Promotion>> promotions)? initial,
    TResult Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(promotions);
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

abstract class _LoadInProgress extends PromotionState {
  const factory _LoadInProgress(final Fresh<List<Promotion>> promotions) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<Promotion>> get promotions;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $PromotionStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Promotion>> promotions});

  @override
  $FreshCopyWith<List<Promotion>, $Res> get promotions;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$PromotionStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Promotion>>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.promotions) : super._();

  @override
  final Fresh<List<Promotion>> promotions;

  @override
  String toString() {
    return 'PromotionState.loadSuccess(promotions: $promotions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.promotions, promotions) ||
                other.promotions == promotions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promotions);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Promotion>> promotions) initial,
    required TResult Function(Fresh<List<Promotion>> promotions) loadInProgress,
    required TResult Function(Fresh<List<Promotion>> promotions) loadSuccess,
    required TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)
        loadFailure,
  }) {
    return loadSuccess(promotions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Promotion>> promotions)? initial,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult? Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(promotions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Promotion>> promotions)? initial,
    TResult Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(promotions);
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

abstract class _LoadSuccess extends PromotionState {
  const factory _LoadSuccess(final Fresh<List<Promotion>> promotions) =
      _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<Promotion>> get promotions;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $PromotionStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<Promotion>> promotions, PromotionFailure failure});

  @override
  $FreshCopyWith<List<Promotion>, $Res> get promotions;
  $PromotionFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$PromotionStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotions = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == promotions
          ? _value.promotions
          : promotions // ignore: cast_nullable_to_non_nullable
              as Fresh<List<Promotion>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as PromotionFailure,
    ));
  }

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionFailureCopyWith<$Res> get failure {
    return $PromotionFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.promotions, this.failure) : super._();

  @override
  final Fresh<List<Promotion>> promotions;
  @override
  final PromotionFailure failure;

  @override
  String toString() {
    return 'PromotionState.loadFailure(promotions: $promotions, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.promotions, promotions) ||
                other.promotions == promotions) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promotions, failure);

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<Promotion>> promotions) initial,
    required TResult Function(Fresh<List<Promotion>> promotions) loadInProgress,
    required TResult Function(Fresh<List<Promotion>> promotions) loadSuccess,
    required TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)
        loadFailure,
  }) {
    return loadFailure(promotions, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<Promotion>> promotions)? initial,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult? Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult? Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(promotions, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<Promotion>> promotions)? initial,
    TResult Function(Fresh<List<Promotion>> promotions)? loadInProgress,
    TResult Function(Fresh<List<Promotion>> promotions)? loadSuccess,
    TResult Function(
            Fresh<List<Promotion>> promotions, PromotionFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(promotions, failure);
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

abstract class _LoadFailure extends PromotionState {
  const factory _LoadFailure(final Fresh<List<Promotion>> promotions,
      final PromotionFailure failure) = _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<Promotion>> get promotions;
  PromotionFailure get failure;

  /// Create a copy of PromotionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
