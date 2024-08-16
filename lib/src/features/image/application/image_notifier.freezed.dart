// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductImageState {
  Fresh<List<ProductImage>> get images => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductImage>> images) initial,
    required TResult Function(Fresh<List<ProductImage>> images) loadInProgress,
    required TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductImage>> images, ImageFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductImage>> images)? initial,
    TResult? Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult? Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductImage>> images)? initial,
    TResult Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
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

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageStateCopyWith<ProductImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageStateCopyWith<$Res> {
  factory $ProductImageStateCopyWith(
          ProductImageState value, $Res Function(ProductImageState) then) =
      _$ProductImageStateCopyWithImpl<$Res, ProductImageState>;
  @useResult
  $Res call({Fresh<List<ProductImage>> images});

  $FreshCopyWith<List<ProductImage>, $Res> get images;
}

/// @nodoc
class _$ProductImageStateCopyWithImpl<$Res, $Val extends ProductImageState>
    implements $ProductImageStateCopyWith<$Res> {
  _$ProductImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductImage>>,
    ) as $Val);
  }

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<ProductImage>, $Res> get images {
    return $FreshCopyWith<List<ProductImage>, $Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProductImageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductImage>> images});

  @override
  $FreshCopyWith<List<ProductImage>, $Res> get images;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductImageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$InitialImpl(
      null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductImage>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.images) : super._();

  @override
  final Fresh<List<ProductImage>> images;

  @override
  String toString() {
    return 'ProductImageState.initial(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.images, images) || other.images == images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, images);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductImage>> images) initial,
    required TResult Function(Fresh<List<ProductImage>> images) loadInProgress,
    required TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductImage>> images, ImageFailure failure)
        loadFailure,
  }) {
    return initial(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductImage>> images)? initial,
    TResult? Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult? Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
  }) {
    return initial?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductImage>> images)? initial,
    TResult Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(images);
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

abstract class _Initial extends ProductImageState {
  const factory _Initial(final Fresh<List<ProductImage>> images) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<List<ProductImage>> get images;

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $ProductImageStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductImage>> images});

  @override
  $FreshCopyWith<List<ProductImage>, $Res> get images;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$ProductImageStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductImage>>,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.images) : super._();

  @override
  final Fresh<List<ProductImage>> images;

  @override
  String toString() {
    return 'ProductImageState.loadInProgress(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.images, images) || other.images == images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, images);

  /// Create a copy of ProductImageState
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
    required TResult Function(Fresh<List<ProductImage>> images) initial,
    required TResult Function(Fresh<List<ProductImage>> images) loadInProgress,
    required TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductImage>> images, ImageFailure failure)
        loadFailure,
  }) {
    return loadInProgress(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductImage>> images)? initial,
    TResult? Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult? Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductImage>> images)? initial,
    TResult Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(images);
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

abstract class _LoadInProgress extends ProductImageState {
  const factory _LoadInProgress(final Fresh<List<ProductImage>> images) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<ProductImage>> get images;

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $ProductImageStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductImage>> images, bool isNextPageAvailable});

  @override
  $FreshCopyWith<List<ProductImage>, $Res> get images;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$ProductImageStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductImage>>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.images, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<List<ProductImage>> images;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'ProductImageState.loadSuccess(images: $images, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, images, isNextPageAvailable);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductImage>> images) initial,
    required TResult Function(Fresh<List<ProductImage>> images) loadInProgress,
    required TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductImage>> images, ImageFailure failure)
        loadFailure,
  }) {
    return loadSuccess(images, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductImage>> images)? initial,
    TResult? Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult? Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(images, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductImage>> images)? initial,
    TResult Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(images, isNextPageAvailable);
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

abstract class _LoadSuccess extends ProductImageState {
  const factory _LoadSuccess(final Fresh<List<ProductImage>> images,
      {required final bool isNextPageAvailable}) = _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<ProductImage>> get images;
  bool get isNextPageAvailable;

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $ProductImageStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductImage>> images, ImageFailure failure});

  @override
  $FreshCopyWith<List<ProductImage>, $Res> get images;
  $ImageFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$ProductImageStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductImage>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ImageFailure,
    ));
  }

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageFailureCopyWith<$Res> get failure {
    return $ImageFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.images, this.failure) : super._();

  @override
  final Fresh<List<ProductImage>> images;
  @override
  final ImageFailure failure;

  @override
  String toString() {
    return 'ProductImageState.loadFailure(images: $images, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, images, failure);

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductImage>> images) initial,
    required TResult Function(Fresh<List<ProductImage>> images) loadInProgress,
    required TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductImage>> images, ImageFailure failure)
        loadFailure,
  }) {
    return loadFailure(images, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductImage>> images)? initial,
    TResult? Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult? Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(images, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductImage>> images)? initial,
    TResult Function(Fresh<List<ProductImage>> images)? loadInProgress,
    TResult Function(
            Fresh<List<ProductImage>> images, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(Fresh<List<ProductImage>> images, ImageFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(images, failure);
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

abstract class _LoadFailure extends ProductImageState {
  const factory _LoadFailure(
          final Fresh<List<ProductImage>> images, final ImageFailure failure) =
      _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<ProductImage>> get images;
  ImageFailure get failure;

  /// Create a copy of ProductImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
