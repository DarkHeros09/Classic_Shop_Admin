import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required final int id,
    required final String username,
    required final String email,
    required final int typeId,
    final String? password,
  }) = _User;
  const User._();
}
