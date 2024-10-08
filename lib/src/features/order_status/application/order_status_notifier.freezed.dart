// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderStatusState {
  Fresh<List<OrderStatus>> get orderStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) initial,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus)
        loadInProgress,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) loadSuccess,
    required TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult? Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
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

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStatusStateCopyWith<OrderStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusStateCopyWith<$Res> {
  factory $OrderStatusStateCopyWith(
          OrderStatusState value, $Res Function(OrderStatusState) then) =
      _$OrderStatusStateCopyWithImpl<$Res, OrderStatusState>;
  @useResult
  $Res call({Fresh<List<OrderStatus>> orderStatus});

  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus;
}

/// @nodoc
class _$OrderStatusStateCopyWithImpl<$Res, $Val extends OrderStatusState>
    implements $OrderStatusStateCopyWith<$Res> {
  _$OrderStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
  }) {
    return _then(_value.copyWith(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as Fresh<List<OrderStatus>>,
    ) as $Val);
  }

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus {
    return $FreshCopyWith<List<OrderStatus>, $Res>(_value.orderStatus, (value) {
      return _then(_value.copyWith(orderStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $OrderStatusStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<OrderStatus>> orderStatus});

  @override
  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
  }) {
    return _then(_$InitialImpl(
      null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as Fresh<List<OrderStatus>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.orderStatus) : super._();

  @override
  final Fresh<List<OrderStatus>> orderStatus;

  @override
  String toString() {
    return 'OrderStatusState.initial(orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderStatus);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) initial,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus)
        loadInProgress,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) loadSuccess,
    required TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)
        loadFailure,
  }) {
    return initial(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult? Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
  }) {
    return initial?.call(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(orderStatus);
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

abstract class _Initial extends OrderStatusState {
  const factory _Initial(final Fresh<List<OrderStatus>> orderStatus) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<List<OrderStatus>> get orderStatus;

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $OrderStatusStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<OrderStatus>> orderStatus});

  @override
  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as Fresh<List<OrderStatus>>,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.orderStatus) : super._();

  @override
  final Fresh<List<OrderStatus>> orderStatus;

  @override
  String toString() {
    return 'OrderStatusState.loadInProgress(orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderStatus);

  /// Create a copy of OrderStatusState
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
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) initial,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus)
        loadInProgress,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) loadSuccess,
    required TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)
        loadFailure,
  }) {
    return loadInProgress(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult? Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(orderStatus);
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

abstract class _LoadInProgress extends OrderStatusState {
  const factory _LoadInProgress(final Fresh<List<OrderStatus>> orderStatus) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<OrderStatus>> get orderStatus;

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $OrderStatusStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<OrderStatus>> orderStatus});

  @override
  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as Fresh<List<OrderStatus>>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.orderStatus) : super._();

  @override
  final Fresh<List<OrderStatus>> orderStatus;

  @override
  String toString() {
    return 'OrderStatusState.loadSuccess(orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderStatus);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) initial,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus)
        loadInProgress,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) loadSuccess,
    required TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)
        loadFailure,
  }) {
    return loadSuccess(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult? Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(orderStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(orderStatus);
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

abstract class _LoadSuccess extends OrderStatusState {
  const factory _LoadSuccess(final Fresh<List<OrderStatus>> orderStatus) =
      _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<OrderStatus>> get orderStatus;

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $OrderStatusStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure});

  @override
  $FreshCopyWith<List<OrderStatus>, $Res> get orderStatus;
  $OrderStatusFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$OrderStatusStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as Fresh<List<OrderStatus>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as OrderStatusFailure,
    ));
  }

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderStatusFailureCopyWith<$Res> get failure {
    return $OrderStatusFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.orderStatus, this.failure) : super._();

  @override
  final Fresh<List<OrderStatus>> orderStatus;
  @override
  final OrderStatusFailure failure;

  @override
  String toString() {
    return 'OrderStatusState.loadFailure(orderStatus: $orderStatus, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderStatus, failure);

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) initial,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus)
        loadInProgress,
    required TResult Function(Fresh<List<OrderStatus>> orderStatus) loadSuccess,
    required TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)
        loadFailure,
  }) {
    return loadFailure(orderStatus, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult? Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult? Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(orderStatus, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? initial,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadInProgress,
    TResult Function(Fresh<List<OrderStatus>> orderStatus)? loadSuccess,
    TResult Function(
            Fresh<List<OrderStatus>> orderStatus, OrderStatusFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(orderStatus, failure);
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

abstract class _LoadFailure extends OrderStatusState {
  const factory _LoadFailure(final Fresh<List<OrderStatus>> orderStatus,
      final OrderStatusFailure failure) = _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<OrderStatus>> get orderStatus;
  OrderStatusFailure get failure;

  /// Create a copy of OrderStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
