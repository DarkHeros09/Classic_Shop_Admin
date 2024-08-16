// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageKitDTO _$ImageKitDTOFromJson(Map<String, dynamic> json) {
  return _ImageKitDTO.fromJson(json);
}

/// @nodoc
mixin _$ImageKitDTO {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this ImageKitDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageKitDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageKitDTOCopyWith<ImageKitDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageKitDTOCopyWith<$Res> {
  factory $ImageKitDTOCopyWith(
          ImageKitDTO value, $Res Function(ImageKitDTO) then) =
      _$ImageKitDTOCopyWithImpl<$Res, ImageKitDTO>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ImageKitDTOCopyWithImpl<$Res, $Val extends ImageKitDTO>
    implements $ImageKitDTOCopyWith<$Res> {
  _$ImageKitDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageKitDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageKitDTOImplCopyWith<$Res>
    implements $ImageKitDTOCopyWith<$Res> {
  factory _$$ImageKitDTOImplCopyWith(
          _$ImageKitDTOImpl value, $Res Function(_$ImageKitDTOImpl) then) =
      __$$ImageKitDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ImageKitDTOImplCopyWithImpl<$Res>
    extends _$ImageKitDTOCopyWithImpl<$Res, _$ImageKitDTOImpl>
    implements _$$ImageKitDTOImplCopyWith<$Res> {
  __$$ImageKitDTOImplCopyWithImpl(
      _$ImageKitDTOImpl _value, $Res Function(_$ImageKitDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageKitDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$ImageKitDTOImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageKitDTOImpl extends _ImageKitDTO {
  const _$ImageKitDTOImpl({required this.url}) : super._();

  factory _$ImageKitDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageKitDTOImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'ImageKitDTO(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageKitDTOImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ImageKitDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageKitDTOImplCopyWith<_$ImageKitDTOImpl> get copyWith =>
      __$$ImageKitDTOImplCopyWithImpl<_$ImageKitDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageKitDTOImplToJson(
      this,
    );
  }
}

abstract class _ImageKitDTO extends ImageKitDTO {
  const factory _ImageKitDTO({required final String url}) = _$ImageKitDTOImpl;
  const _ImageKitDTO._() : super._();

  factory _ImageKitDTO.fromJson(Map<String, dynamic> json) =
      _$ImageKitDTOImpl.fromJson;

  @override
  String get url;

  /// Create a copy of ImageKitDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageKitDTOImplCopyWith<_$ImageKitDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductImageDTO _$ProductImageDTOFromJson(Map<String, dynamic> json) {
  return _ProductImageDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductImageDTO {
  int get id => throw _privateConstructorUsedError;
  String get productImage_1 => throw _privateConstructorUsedError;
  String get productImage_2 => throw _privateConstructorUsedError;
  String get productImage_3 => throw _privateConstructorUsedError;

  /// Serializes this ProductImageDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageDTOCopyWith<ProductImageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageDTOCopyWith<$Res> {
  factory $ProductImageDTOCopyWith(
          ProductImageDTO value, $Res Function(ProductImageDTO) then) =
      _$ProductImageDTOCopyWithImpl<$Res, ProductImageDTO>;
  @useResult
  $Res call(
      {int id,
      String productImage_1,
      String productImage_2,
      String productImage_3});
}

/// @nodoc
class _$ProductImageDTOCopyWithImpl<$Res, $Val extends ProductImageDTO>
    implements $ProductImageDTOCopyWith<$Res> {
  _$ProductImageDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productImage_1 = null,
    Object? productImage_2 = null,
    Object? productImage_3 = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productImage_1: null == productImage_1
          ? _value.productImage_1
          : productImage_1 // ignore: cast_nullable_to_non_nullable
              as String,
      productImage_2: null == productImage_2
          ? _value.productImage_2
          : productImage_2 // ignore: cast_nullable_to_non_nullable
              as String,
      productImage_3: null == productImage_3
          ? _value.productImage_3
          : productImage_3 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImageDTOImplCopyWith<$Res>
    implements $ProductImageDTOCopyWith<$Res> {
  factory _$$ProductImageDTOImplCopyWith(_$ProductImageDTOImpl value,
          $Res Function(_$ProductImageDTOImpl) then) =
      __$$ProductImageDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String productImage_1,
      String productImage_2,
      String productImage_3});
}

/// @nodoc
class __$$ProductImageDTOImplCopyWithImpl<$Res>
    extends _$ProductImageDTOCopyWithImpl<$Res, _$ProductImageDTOImpl>
    implements _$$ProductImageDTOImplCopyWith<$Res> {
  __$$ProductImageDTOImplCopyWithImpl(
      _$ProductImageDTOImpl _value, $Res Function(_$ProductImageDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productImage_1 = null,
    Object? productImage_2 = null,
    Object? productImage_3 = null,
  }) {
    return _then(_$ProductImageDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      productImage_1: null == productImage_1
          ? _value.productImage_1
          : productImage_1 // ignore: cast_nullable_to_non_nullable
              as String,
      productImage_2: null == productImage_2
          ? _value.productImage_2
          : productImage_2 // ignore: cast_nullable_to_non_nullable
              as String,
      productImage_3: null == productImage_3
          ? _value.productImage_3
          : productImage_3 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImageDTOImpl extends _ProductImageDTO {
  const _$ProductImageDTOImpl(
      {required this.id,
      required this.productImage_1,
      required this.productImage_2,
      required this.productImage_3})
      : super._();

  factory _$ProductImageDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImageDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String productImage_1;
  @override
  final String productImage_2;
  @override
  final String productImage_3;

  @override
  String toString() {
    return 'ProductImageDTO(id: $id, productImage_1: $productImage_1, productImage_2: $productImage_2, productImage_3: $productImage_3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productImage_1, productImage_1) ||
                other.productImage_1 == productImage_1) &&
            (identical(other.productImage_2, productImage_2) ||
                other.productImage_2 == productImage_2) &&
            (identical(other.productImage_3, productImage_3) ||
                other.productImage_3 == productImage_3));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, productImage_1, productImage_2, productImage_3);

  /// Create a copy of ProductImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageDTOImplCopyWith<_$ProductImageDTOImpl> get copyWith =>
      __$$ProductImageDTOImplCopyWithImpl<_$ProductImageDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImageDTOImplToJson(
      this,
    );
  }
}

abstract class _ProductImageDTO extends ProductImageDTO {
  const factory _ProductImageDTO(
      {required final int id,
      required final String productImage_1,
      required final String productImage_2,
      required final String productImage_3}) = _$ProductImageDTOImpl;
  const _ProductImageDTO._() : super._();

  factory _ProductImageDTO.fromJson(Map<String, dynamic> json) =
      _$ProductImageDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get productImage_1;
  @override
  String get productImage_2;
  @override
  String get productImage_3;

  /// Create a copy of ProductImageDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImageDTOImplCopyWith<_$ProductImageDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
