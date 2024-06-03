import 'package:classic_shop_admin/src/core/domain/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required final int id,
    required final String username,
    required final String email,
    required final int typeId,
    final String? password,
  }) = _UserDTO;
  const UserDTO._();

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User _) {
    return UserDTO(
      id: _.id,
      username: _.username,
      email: _.email,
      password: _.password,
      typeId: _.typeId,
    );
  }

  User toDomain() {
    return User(
      id: id,
      username: username,
      email: email,
      password: password,
      typeId: typeId,
    );
  }
}
