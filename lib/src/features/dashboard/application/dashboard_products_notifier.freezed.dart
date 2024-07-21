// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_products_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardProductsState {
  Fresh<List<ProductItem>> get products => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductItem>> products) initial,
    required TResult Function(
            Fresh<List<ProductItem>> products, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductItem>> products)? initial,
    TResult? Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult? Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductItem>> products)? initial,
    TResult Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
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

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardProductsStateCopyWith<DashboardProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardProductsStateCopyWith<$Res> {
  factory $DashboardProductsStateCopyWith(DashboardProductsState value,
          $Res Function(DashboardProductsState) then) =
      _$DashboardProductsStateCopyWithImpl<$Res, DashboardProductsState>;
  @useResult
  $Res call({Fresh<List<ProductItem>> products});

  $FreshCopyWith<List<ProductItem>, $Res> get products;
}

/// @nodoc
class _$DashboardProductsStateCopyWithImpl<$Res,
        $Val extends DashboardProductsState>
    implements $DashboardProductsStateCopyWith<$Res> {
  _$DashboardProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductItem>>,
    ) as $Val);
  }

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<List<ProductItem>, $Res> get products {
    return $FreshCopyWith<List<ProductItem>, $Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DashboardProductsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductItem>> products});

  @override
  $FreshCopyWith<List<ProductItem>, $Res> get products;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DashboardProductsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$InitialImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductItem>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(this.products) : super._();

  @override
  final Fresh<List<ProductItem>> products;

  @override
  String toString() {
    return 'DashboardProductsState.initial(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductItem>> products) initial,
    required TResult Function(
            Fresh<List<ProductItem>> products, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)
        loadFailure,
  }) {
    return initial(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductItem>> products)? initial,
    TResult? Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult? Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
  }) {
    return initial?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductItem>> products)? initial,
    TResult Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products);
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

abstract class _Initial extends DashboardProductsState {
  const factory _Initial(final Fresh<List<ProductItem>> products) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  Fresh<List<ProductItem>> get products;

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res>
    implements $DashboardProductsStateCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductItem>> products, int itemsPerPage});

  @override
  $FreshCopyWith<List<ProductItem>, $Res> get products;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$DashboardProductsStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? itemsPerPage = null,
  }) {
    return _then(_$LoadInProgressImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductItem>>,
      null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadInProgressImpl extends _LoadInProgress {
  const _$LoadInProgressImpl(this.products, this.itemsPerPage) : super._();

  @override
  final Fresh<List<ProductItem>> products;
  @override
  final int itemsPerPage;

  @override
  String toString() {
    return 'DashboardProductsState.loadInProgress(products: $products, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadInProgressImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, itemsPerPage);

  /// Create a copy of DashboardProductsState
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
    required TResult Function(Fresh<List<ProductItem>> products) initial,
    required TResult Function(
            Fresh<List<ProductItem>> products, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)
        loadFailure,
  }) {
    return loadInProgress(products, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductItem>> products)? initial,
    TResult? Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult? Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
  }) {
    return loadInProgress?.call(products, itemsPerPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductItem>> products)? initial,
    TResult Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(products, itemsPerPage);
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

abstract class _LoadInProgress extends DashboardProductsState {
  const factory _LoadInProgress(
          final Fresh<List<ProductItem>> products, final int itemsPerPage) =
      _$LoadInProgressImpl;
  const _LoadInProgress._() : super._();

  @override
  Fresh<List<ProductItem>> get products;
  int get itemsPerPage;

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadInProgressImplCopyWith<_$LoadInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res>
    implements $DashboardProductsStateCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductItem>> products, bool isNextPageAvailable});

  @override
  $FreshCopyWith<List<ProductItem>, $Res> get products;
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$DashboardProductsStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? isNextPageAvailable = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductItem>>,
      isNextPageAvailable: null == isNextPageAvailable
          ? _value.isNextPageAvailable
          : isNextPageAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl extends _LoadSuccess {
  const _$LoadSuccessImpl(this.products, {required this.isNextPageAvailable})
      : super._();

  @override
  final Fresh<List<ProductItem>> products;
  @override
  final bool isNextPageAvailable;

  @override
  String toString() {
    return 'DashboardProductsState.loadSuccess(products: $products, isNextPageAvailable: $isNextPageAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.isNextPageAvailable, isNextPageAvailable) ||
                other.isNextPageAvailable == isNextPageAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, isNextPageAvailable);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductItem>> products) initial,
    required TResult Function(
            Fresh<List<ProductItem>> products, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)
        loadFailure,
  }) {
    return loadSuccess(products, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductItem>> products)? initial,
    TResult? Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult? Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
  }) {
    return loadSuccess?.call(products, isNextPageAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductItem>> products)? initial,
    TResult Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(products, isNextPageAvailable);
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

abstract class _LoadSuccess extends DashboardProductsState {
  const factory _LoadSuccess(final Fresh<List<ProductItem>> products,
      {required final bool isNextPageAvailable}) = _$LoadSuccessImpl;
  const _LoadSuccess._() : super._();

  @override
  Fresh<List<ProductItem>> get products;
  bool get isNextPageAvailable;

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res>
    implements $DashboardProductsStateCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Fresh<List<ProductItem>> products, ProductItemFailure failure});

  @override
  $FreshCopyWith<List<ProductItem>, $Res> get products;
  $ProductItemFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$DashboardProductsStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? failure = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Fresh<List<ProductItem>>,
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ProductItemFailure,
    ));
  }

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductItemFailureCopyWith<$Res> get failure {
    return $ProductItemFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$LoadFailureImpl extends _LoadFailure {
  const _$LoadFailureImpl(this.products, this.failure) : super._();

  @override
  final Fresh<List<ProductItem>> products;
  @override
  final ProductItemFailure failure;

  @override
  String toString() {
    return 'DashboardProductsState.loadFailure(products: $products, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, failure);

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Fresh<List<ProductItem>> products) initial,
    required TResult Function(
            Fresh<List<ProductItem>> products, int itemsPerPage)
        loadInProgress,
    required TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)
        loadSuccess,
    required TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)
        loadFailure,
  }) {
    return loadFailure(products, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Fresh<List<ProductItem>> products)? initial,
    TResult? Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult? Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult? Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
  }) {
    return loadFailure?.call(products, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Fresh<List<ProductItem>> products)? initial,
    TResult Function(Fresh<List<ProductItem>> products, int itemsPerPage)?
        loadInProgress,
    TResult Function(
            Fresh<List<ProductItem>> products, bool isNextPageAvailable)?
        loadSuccess,
    TResult Function(
            Fresh<List<ProductItem>> products, ProductItemFailure failure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(products, failure);
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

abstract class _LoadFailure extends DashboardProductsState {
  const factory _LoadFailure(final Fresh<List<ProductItem>> products,
      final ProductItemFailure failure) = _$LoadFailureImpl;
  const _LoadFailure._() : super._();

  @override
  Fresh<List<ProductItem>> get products;
  ProductItemFailure get failure;

  /// Create a copy of DashboardProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
