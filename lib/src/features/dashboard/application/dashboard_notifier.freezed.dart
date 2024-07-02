// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  Fresh<Dashboard> get dashboard => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Dashboard> dashboard) initial,
    required TResult Function(Fresh<Dashboard> dashboard) loadInProgress,
    required TResult Function(
            Fresh<Dashboard> dashboard, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<Dashboard> dashboard, DashboardFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Dashboard> dashboard)? initial,
    TResult? Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult? Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Dashboard> dashboard)? initial,
    TResult Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
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

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({Fresh<Dashboard> dashboard});

  $FreshCopyWith<Dashboard, $Res> get dashboard;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboard = null,
  }) {
    return _then(_value.copyWith(
      dashboard: null == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Fresh<Dashboard>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<Dashboard, $Res> get dashboard {
    return $FreshCopyWith<Dashboard, $Res>(_value.dashboard, (value) {
      return _then(_value.copyWith(dashboard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Dashboard> dashboard});

  @override
  $FreshCopyWith<Dashboard, $Res> get dashboard;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboard = null,
  }) {
    return _then(_$InitialImpl(
      null == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Fresh<Dashboard>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.dashboard) : super._();

  @override
  final Fresh<Dashboard> dashboard;

  @override
  String toString() {
    return 'DashboardState.initial(dashboard: $dashboard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Dashboard> dashboard) initial,
    required TResult Function(Fresh<Dashboard> dashboard) loadInProgress,
    required TResult Function(
            Fresh<Dashboard> dashboard, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<Dashboard> dashboard, DashboardFailure failure)
        loadFailure,
  }) {
    return initial(dashboard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Dashboard> dashboard)? initial,
    TResult? Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult? Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
  }) {
    return initial?.call(dashboard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Dashboard> dashboard)? initial,
    TResult Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(dashboard);
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

abstract class _Initial extends DashboardState {
  const factory _Initial(final Fresh<Dashboard> dashboard) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<Dashboard> get dashboard;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Dashboard> dashboard});

  @override
  $FreshCopyWith<Dashboard, $Res> get dashboard;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboard = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Fresh<Dashboard>,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.dashboard) : super._();

  @override
  final Fresh<Dashboard> dashboard;

  @override
  String toString() {
    return 'DashboardState.loadInProgress(dashboard: $dashboard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      __$$LoadInProgressImplCopyWithImpl<_$LoadInProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Dashboard> dashboard) initial,
    required TResult Function(Fresh<Dashboard> dashboard) loadInProgress,
    required TResult Function(
            Fresh<Dashboard> dashboard, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<Dashboard> dashboard, DashboardFailure failure)
        loadFailure,
  }) {
    return loadInProgress(dashboard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Dashboard> dashboard)? initial,
    TResult? Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult? Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(dashboard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Dashboard> dashboard)? initial,
    TResult Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(dashboard);
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

abstract class _LoadInProgress extends DashboardState {
  const factory _LoadInProgress(final Fresh<Dashboard> dashboard) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<Dashboard> get dashboard;
  @override
  @JsonKey(ignore: true)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Dashboard> dashboard, bool isNextPageAvailable});

  @override
  $FreshCopyWith<Dashboard, $Res> get dashboard;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboard = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Fresh<Dashboard>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.dashboard, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<Dashboard> dashboard;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'DashboardState.loadSuccess(dashboard: $dashboard, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboard, isNextPageAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Dashboard> dashboard) initial,
    required TResult Function(Fresh<Dashboard> dashboard) loadInProgress,
    required TResult Function(
            Fresh<Dashboard> dashboard, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<Dashboard> dashboard, DashboardFailure failure)
        loadFailure,
  }) {
    return loadSuccess(dashboard, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Dashboard> dashboard)? initial,
    TResult? Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult? Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(dashboard, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Dashboard> dashboard)? initial,
    TResult Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(dashboard, isNextPageAvailable);
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

abstract class _LoadSuccess extends DashboardState {
  const factory _LoadSuccess(final Fresh<Dashboard> dashboard,
      {required final bool isNextPageAvailable}) = _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<Dashboard> get dashboard;
  bool get isNextPageAvailable;
  @override
  @JsonKey(ignore: true)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<Dashboard> dashboard, DashboardFailure failure});

  @override
  $FreshCopyWith<Dashboard, $Res> get dashboard;
  $DashboardFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dashboard = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Fresh<Dashboard>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as DashboardFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardFailureCopyWith<$Res> get failure {
    return $DashboardFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.dashboard, this.failure) : super._();

  @override
  final Fresh<Dashboard> dashboard;
  @override
  final DashboardFailure failure;

  @override
  String toString() {
    return 'DashboardState.loadFailure(dashboard: $dashboard, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dashboard, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<Dashboard> dashboard) initial,
    required TResult Function(Fresh<Dashboard> dashboard) loadInProgress,
    required TResult Function(
            Fresh<Dashboard> dashboard, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<Dashboard> dashboard, DashboardFailure failure)
        loadFailure,
  }) {
    return loadFailure(dashboard, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<Dashboard> dashboard)? initial,
    TResult? Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult? Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(dashboard, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<Dashboard> dashboard)? initial,
    TResult Function(Fresh<Dashboard> dashboard)? loadInProgress,
    TResult Function(Fresh<Dashboard> dashboard, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<Dashboard> dashboard, DashboardFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(dashboard, failure);
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

abstract class _LoadFailure extends DashboardState {
  const factory _LoadFailure(
          final Fresh<Dashboard> dashboard, final DashboardFailure failure) =
      _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<Dashboard> get dashboard;
  DashboardFailure get failure;
  @override
  @JsonKey(ignore: true)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
