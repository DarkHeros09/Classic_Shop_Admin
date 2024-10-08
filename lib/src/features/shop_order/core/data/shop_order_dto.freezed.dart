// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopOrderDTO _$ShopOrderDTOFromJson(Map<String, dynamic> json) {
  return _ShopOrderDTO.fromJson(json);
}

/// @nodoc
mixin _$ShopOrderDTO {
  int get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get itemCount => throw _privateConstructorUsedError;
  String get trackNumber => throw _privateConstructorUsedError;
  int get orderNumber => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  int get paymentTypeId => throw _privateConstructorUsedError;
  int get shippingAddressId => throw _privateConstructorUsedError;
  String get orderTotal => throw _privateConstructorUsedError;
  int get shippingMethodId => throw _privateConstructorUsedError;
  int? get orderStatusId => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Serializes this ShopOrderDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopOrderDTOCopyWith<ShopOrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopOrderDTOCopyWith<$Res> {
  factory $ShopOrderDTOCopyWith(
          ShopOrderDTO value, $Res Function(ShopOrderDTO) then) =
      _$ShopOrderDTOCopyWithImpl<$Res, ShopOrderDTO>;
  @useResult
  $Res call(
      {int id,
      String? status,
      int? itemCount,
      String trackNumber,
      int orderNumber,
      int userId,
      String? username,
      int paymentTypeId,
      int shippingAddressId,
      String orderTotal,
      int shippingMethodId,
      int? orderStatusId,
      int totalCount,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime completedAt});
}

/// @nodoc
class _$ShopOrderDTOCopyWithImpl<$Res, $Val extends ShopOrderDTO>
    implements $ShopOrderDTOCopyWith<$Res> {
  _$ShopOrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? itemCount = freezed,
    Object? trackNumber = null,
    Object? orderNumber = null,
    Object? userId = null,
    Object? username = freezed,
    Object? paymentTypeId = null,
    Object? shippingAddressId = null,
    Object? orderTotal = null,
    Object? shippingMethodId = null,
    Object? orderStatusId = freezed,
    Object? totalCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTypeId: null == paymentTypeId
          ? _value.paymentTypeId
          : paymentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddressId: null == shippingAddressId
          ? _value.shippingAddressId
          : shippingAddressId // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethodId: null == shippingMethodId
          ? _value.shippingMethodId
          : shippingMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatusId: freezed == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopOrderDTOImplCopyWith<$Res>
    implements $ShopOrderDTOCopyWith<$Res> {
  factory _$$ShopOrderDTOImplCopyWith(
          _$ShopOrderDTOImpl value, $Res Function(_$ShopOrderDTOImpl) then) =
      __$$ShopOrderDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? status,
      int? itemCount,
      String trackNumber,
      int orderNumber,
      int userId,
      String? username,
      int paymentTypeId,
      int shippingAddressId,
      String orderTotal,
      int shippingMethodId,
      int? orderStatusId,
      int totalCount,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime completedAt});
}

/// @nodoc
class __$$ShopOrderDTOImplCopyWithImpl<$Res>
    extends _$ShopOrderDTOCopyWithImpl<$Res, _$ShopOrderDTOImpl>
    implements _$$ShopOrderDTOImplCopyWith<$Res> {
  __$$ShopOrderDTOImplCopyWithImpl(
      _$ShopOrderDTOImpl _value, $Res Function(_$ShopOrderDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShopOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? itemCount = freezed,
    Object? trackNumber = null,
    Object? orderNumber = null,
    Object? userId = null,
    Object? username = freezed,
    Object? paymentTypeId = null,
    Object? shippingAddressId = null,
    Object? orderTotal = null,
    Object? shippingMethodId = null,
    Object? orderStatusId = freezed,
    Object? totalCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = null,
  }) {
    return _then(_$ShopOrderDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCount: freezed == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTypeId: null == paymentTypeId
          ? _value.paymentTypeId
          : paymentTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      shippingAddressId: null == shippingAddressId
          ? _value.shippingAddressId
          : shippingAddressId // ignore: cast_nullable_to_non_nullable
              as int,
      orderTotal: null == orderTotal
          ? _value.orderTotal
          : orderTotal // ignore: cast_nullable_to_non_nullable
              as String,
      shippingMethodId: null == shippingMethodId
          ? _value.shippingMethodId
          : shippingMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatusId: freezed == orderStatusId
          ? _value.orderStatusId
          : orderStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopOrderDTOImpl extends _ShopOrderDTO {
  const _$ShopOrderDTOImpl(
      {required this.id,
      required this.status,
      required this.itemCount,
      required this.trackNumber,
      required this.orderNumber,
      required this.userId,
      required this.username,
      required this.paymentTypeId,
      required this.shippingAddressId,
      required this.orderTotal,
      required this.shippingMethodId,
      required this.orderStatusId,
      required this.totalCount,
      required this.createdAt,
      required this.updatedAt,
      required this.completedAt})
      : super._();

  factory _$ShopOrderDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopOrderDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String? status;
  @override
  final int? itemCount;
  @override
  final String trackNumber;
  @override
  final int orderNumber;
  @override
  final int userId;
  @override
  final String? username;
  @override
  final int paymentTypeId;
  @override
  final int shippingAddressId;
  @override
  final String orderTotal;
  @override
  final int shippingMethodId;
  @override
  final int? orderStatusId;
  @override
  final int totalCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime completedAt;

  @override
  String toString() {
    return 'ShopOrderDTO(id: $id, status: $status, itemCount: $itemCount, trackNumber: $trackNumber, orderNumber: $orderNumber, userId: $userId, username: $username, paymentTypeId: $paymentTypeId, shippingAddressId: $shippingAddressId, orderTotal: $orderTotal, shippingMethodId: $shippingMethodId, orderStatusId: $orderStatusId, totalCount: $totalCount, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopOrderDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.paymentTypeId, paymentTypeId) ||
                other.paymentTypeId == paymentTypeId) &&
            (identical(other.shippingAddressId, shippingAddressId) ||
                other.shippingAddressId == shippingAddressId) &&
            (identical(other.orderTotal, orderTotal) ||
                other.orderTotal == orderTotal) &&
            (identical(other.shippingMethodId, shippingMethodId) ||
                other.shippingMethodId == shippingMethodId) &&
            (identical(other.orderStatusId, orderStatusId) ||
                other.orderStatusId == orderStatusId) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      itemCount,
      trackNumber,
      orderNumber,
      userId,
      username,
      paymentTypeId,
      shippingAddressId,
      orderTotal,
      shippingMethodId,
      orderStatusId,
      totalCount,
      createdAt,
      updatedAt,
      completedAt);

  /// Create a copy of ShopOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopOrderDTOImplCopyWith<_$ShopOrderDTOImpl> get copyWith =>
      __$$ShopOrderDTOImplCopyWithImpl<_$ShopOrderDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopOrderDTOImplToJson(
      this,
    );
  }
}

abstract class _ShopOrderDTO extends ShopOrderDTO {
  const factory _ShopOrderDTO(
      {required final int id,
      required final String? status,
      required final int? itemCount,
      required final String trackNumber,
      required final int orderNumber,
      required final int userId,
      required final String? username,
      required final int paymentTypeId,
      required final int shippingAddressId,
      required final String orderTotal,
      required final int shippingMethodId,
      required final int? orderStatusId,
      required final int totalCount,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final DateTime completedAt}) = _$ShopOrderDTOImpl;
  const _ShopOrderDTO._() : super._();

  factory _ShopOrderDTO.fromJson(Map<String, dynamic> json) =
      _$ShopOrderDTOImpl.fromJson;

  @override
  int get id;
  @override
  String? get status;
  @override
  int? get itemCount;
  @override
  String get trackNumber;
  @override
  int get orderNumber;
  @override
  int get userId;
  @override
  String? get username;
  @override
  int get paymentTypeId;
  @override
  int get shippingAddressId;
  @override
  String get orderTotal;
  @override
  int get shippingMethodId;
  @override
  int? get orderStatusId;
  @override
  int get totalCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime get completedAt;

  /// Create a copy of ShopOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopOrderDTOImplCopyWith<_$ShopOrderDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
