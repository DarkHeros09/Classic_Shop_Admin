// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotionDTO _$PromotionDTOFromJson(Map<String, dynamic> json) {
  return _PromotionDTO.fromJson(json);
}

/// @nodoc
mixin _$PromotionDTO {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get discountRate => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Serializes this PromotionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionDTOCopyWith<PromotionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionDTOCopyWith<$Res> {
  factory $PromotionDTOCopyWith(
          PromotionDTO value, $Res Function(PromotionDTO) then) =
      _$PromotionDTOCopyWithImpl<$Res, PromotionDTO>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      int discountRate,
      bool active,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class _$PromotionDTOCopyWithImpl<$Res, $Val extends PromotionDTO>
    implements $PromotionDTOCopyWith<$Res> {
  _$PromotionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? discountRate = null,
    Object? active = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionDTOImplCopyWith<$Res>
    implements $PromotionDTOCopyWith<$Res> {
  factory _$$PromotionDTOImplCopyWith(
          _$PromotionDTOImpl value, $Res Function(_$PromotionDTOImpl) then) =
      __$$PromotionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      int discountRate,
      bool active,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class __$$PromotionDTOImplCopyWithImpl<$Res>
    extends _$PromotionDTOCopyWithImpl<$Res, _$PromotionDTOImpl>
    implements _$$PromotionDTOImplCopyWith<$Res> {
  __$$PromotionDTOImplCopyWithImpl(
      _$PromotionDTOImpl _value, $Res Function(_$PromotionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? discountRate = null,
    Object? active = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$PromotionDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discountRate: null == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionDTOImpl extends _PromotionDTO {
  const _$PromotionDTOImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.discountRate,
      required this.active,
      required this.startDate,
      required this.endDate})
      : super._();

  factory _$PromotionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int discountRate;
  @override
  final bool active;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'PromotionDTO(id: $id, name: $name, description: $description, discountRate: $discountRate, active: $active, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      discountRate, active, startDate, endDate);

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionDTOImplCopyWith<_$PromotionDTOImpl> get copyWith =>
      __$$PromotionDTOImplCopyWithImpl<_$PromotionDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionDTOImplToJson(
      this,
    );
  }
}

abstract class _PromotionDTO extends PromotionDTO {
  const factory _PromotionDTO(
      {required final int id,
      required final String name,
      required final String description,
      required final int discountRate,
      required final bool active,
      required final DateTime startDate,
      required final DateTime endDate}) = _$PromotionDTOImpl;
  const _PromotionDTO._() : super._();

  factory _PromotionDTO.fromJson(Map<String, dynamic> json) =
      _$PromotionDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get discountRate;
  @override
  bool get active;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of PromotionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionDTOImplCopyWith<_$PromotionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
