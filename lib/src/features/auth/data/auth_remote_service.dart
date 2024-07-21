import 'dart:io';

import 'package:classic_shop_admin/src/core/data/user_storage/user_storage.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_api.dart';
import 'package:classic_shop_admin/src/features/auth/data/credentials_dto.dart';
import 'package:classic_shop_admin/src/features/auth/data/token_storage/token_storage.dart';
import 'package:classic_shop_admin/src/features/auth/domain/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AuthRemoteService {
  AuthRemoteService(
    this._credentialsStorage,
    this._userStorage,
    this._api,
    this._api2,
  );

  final CredentialsStorage _credentialsStorage;
  final UserStorage _userStorage;
  final AuthApi _api;
  final AuthApi2 _api2;

  Future<CredentialsDTO?> getSignedInCredentials() async {
    try {
      final storedtoken = await _credentialsStorage.read();
      debugPrint('stored1: $storedtoken');

      if (storedtoken != null && storedtoken.canRefresh) {
        if (storedtoken.isExpired) {
          debugPrint('TRRRUUUUEEEEE');
          final failureOrCredentials = await renewAccessToken(storedtoken);
          return failureOrCredentials.fold(
            (l) async => null,
            (r) => r,
          );
        }
        return storedtoken;
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() => getSignedInCredentials().then((token) {
        // debugPrint('refresh: ${token?.refreshToken}');
        // debugPrint('access: ${token?.accessToken}');
        // debugPrint('BOOL: ${token?.refreshToken != null}');
        return token?.refreshToken != null;
      });

  Future<Either<AuthFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.signIn(
        data: {
          'email': email,
          'password': password,
        },
      );

      if (!response.isSuccessful) {
        final error = response.error;
        final statusCode = response.statusCode;
        return left(AuthFailure.server('$statusCode: $error'));
      }

      final body = response.body;

      if (body == null) {
        return left(const AuthFailure.server('body should not be null'));
      }

      final credentials = CredentialsDTO.fromJson(body);

      final user = credentials.admin;

      if (user == null) {
        return left(
          const AuthFailure.server('token or user should not be null'),
        );
      }
      // debugPrint('SAVING CREDENTIALS: ');
      // debugPrint(credentials.toString());
      await _credentialsStorage.save(credentials);
      // debugPrint('SAVING USER: ');
      // debugPrint(user.toString());
      debugPrint('PASSWORD: $password');
      debugPrint('READING THE SAVED CREDENTIALS: ');
      if (credentials.admin != null) {
        await _userStorage.save(credentials.admin!);
      }
      final savedUser = await _userStorage.read();
      debugPrint(savedUser.toString());
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on PlatformException {
      return left(const AuthFailure.storage());
    } on SocketException {
      return left(const AuthFailure.server());
    }
  }

  Future<Either<AuthFailure, CredentialsDTO>> renewRefreshToken() async {
    try {
      final storedtoken = await _credentialsStorage.read();
      debugPrint('stored1: $storedtoken');

      final response = await _api.renewRefreshToken(
        data: {
          'refresh_token': storedtoken?.refreshToken,
        },
      );

      debugPrint('stored1: ${response.statusCode}');
      debugPrint('stored1: ${response.body}');
      if (!response.isSuccessful) {
        final error = response.error;
        final statusCode = response.statusCode;
        return left(AuthFailure.server('$statusCode: $error'));
      }

      final body = response.body;

      if (body == null) {
        return left(const AuthFailure.server('body should not be null'));
      }

      final credentials = CredentialsDTO.fromJson(body);
      // final token = credentials.token;
      final refreshToken = credentials.refreshToken;

      if (refreshToken == null) {
        return left(
          const AuthFailure.server('token or user should not be null'),
        );
      }
      debugPrint('PARESED REFRESH TOKEN');
      debugPrint(credentials.toString());
      await _credentialsStorage.save(credentials);
      return right(credentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on PlatformException {
      return left(const AuthFailure.storage());
    } on SocketException {
      return left(const AuthFailure.server());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      final credentials = await _credentialsStorage.read();
      final user = await _userStorage.read();

      if (user != null) {
        try {
          await _api2.signOut(
            accessToken: 'Bearer ${credentials?.accessToken}',
            adminId: user.id.toString(),
            data: {
              'user_session_id': credentials?.adminSessionId,
              'refresh_token': credentials?.refreshToken,
            },
          );
        } on SocketException {
          debugPrint('Token not revoked');
        } finally {
          // await _credentialsStorage.clear();
          // await _userStorage.clear();
          await clearCredentialsStorage();
        }
      }
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> clearCredentialsStorage() async {
    try {
      await _credentialsStorage.clear();
      await _userStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

// previously refresh
  Future<Either<AuthFailure, CredentialsDTO>> renewAccessToken(
    CredentialsDTO credentialsDTO,
  ) async {
    try {
      final response = await _api.renewAccessToken(
        data: {'refresh_token': credentialsDTO.refreshToken},
      );

      if (!response.isSuccessful) {
        final error = response.error;
        final statusCode = response.statusCode;
        return left(AuthFailure.server('$statusCode: $error'));
      }

      final body = response.body;

      if (body == null) {
        return left(const AuthFailure.server('body should not be null'));
      }

      final newCredentials = CredentialsDTO.fromJson(body);
      debugPrint('PARESED ACCESS TOKEN');
      debugPrint(newCredentials.toString());
      final modifiedCredentials = newCredentials.copyWith(
        refreshToken: credentialsDTO.refreshToken,
        refreshExpiration: credentialsDTO.refreshExpiration,
      );

      debugPrint('PARESED MODIFIED ACCESS TOKEN');
      debugPrint(modifiedCredentials.toString());

      await _credentialsStorage.save(modifiedCredentials);
      return right(modifiedCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on PlatformException {
      return left(const AuthFailure.storage());
    } on SocketException {
      return left(const AuthFailure.server());
    }
  }
}
