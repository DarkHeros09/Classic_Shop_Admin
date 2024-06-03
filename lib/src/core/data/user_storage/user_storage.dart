import 'package:classic_shop_admin/src/core/data/user_dto.dart';

abstract class UserStorage {
  Future<UserDTO?> read();

  Future<void> save(UserDTO credentials);

  Future<void> clear();
}
