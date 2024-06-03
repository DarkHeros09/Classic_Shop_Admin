import 'package:classic_shop_admin/src/core/data/user_storage/secure_user_storage.dart';
import 'package:classic_shop_admin/src/core/domain/user.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_api.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_remote_service.dart';
import 'package:classic_shop_admin/src/features/auth/data/token_storage/secure_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
}

@Riverpod(keepAlive: true)
SecureCredentialsStorage credentialsStorage(CredentialsStorageRef ref) {
  return SecureCredentialsStorage(ref.watch(flutterSecureStorageProvider));
}

@Riverpod(keepAlive: true)
SecureUserStorage userStorage(UserStorageRef ref) {
  return SecureUserStorage(ref.watch(flutterSecureStorageProvider));
}

@Riverpod(keepAlive: true)
AuthApi authApi(AuthApiRef ref) {
  return AuthApi.create();
}

@Riverpod(keepAlive: true)
AuthApi2 authApi2(AuthApi2Ref ref) {
  return AuthApi2.create(ref);
}

@Riverpod(keepAlive: true)
AuthRemoteService authRemoteService(AuthRemoteServiceRef ref) {
  return AuthRemoteService(
    ref.watch(credentialsStorageProvider),
    ref.watch(userStorageProvider),
    ref.watch(authApiProvider),
    ref.watch(authApi2Provider),
  );
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final authNotifier = ref.watch(authNotifierProvider.notifier);
  return authNotifier.authStateChanges();
}
