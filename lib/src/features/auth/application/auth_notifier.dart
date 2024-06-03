import 'dart:async';

import 'package:classic_shop_admin/src/core/data/user_storage/secure_user_storage.dart';
import 'package:classic_shop_admin/src/core/domain/user.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_remote_service.dart';
import 'package:classic_shop_admin/src/features/auth/domain/auth_failure.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/helpers/in_memory_store.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.freezed.dart';
part 'auth_notifier.g.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRemoteService _authRemoteService;
  late final SecureUserStorage _userStorage;
  final _authUser = InMemoryStore<User?>(null);

  // Stream<User?> authStateChanges() => Stream.value(user);
  // User? get currentUser => user;

  Stream<User?> authStateChanges() => _authUser.stream;
  User? get currentUser => _authUser.value;

  // User? user;

  void dispose() {
    _authUser.close();
  }

  @override
  AuthState build() {
    _authRemoteService = ref.watch(authRemoteServiceProvider);
    _userStorage = ref.watch(userStorageProvider);
    _userStorage.read().then((value) => _authUser.value = value?.toDomain());
    ref.onDispose(dispose);
    return state = const AuthState.initial();
  }

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authRemoteService.isSignedIn())
        ? (const AuthState.authenticated())
        : const AuthState.unauthenticated();
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AuthState.loading();
    final failureOrSuccess =
        await _authRemoteService.signIn(email: email, password: password);
    state = await failureOrSuccess.fold(
      AuthState.failure,
      (r) async {
        final userDTO = await _userStorage.read();
        _authUser.value = userDTO?.toDomain();
        return const AuthState.authenticated();
      },
    );
  }

  // Future<void> signOut() async {
  //   final failureOrSuccess = await _authRemoteService.signOut();
  //   state = failureOrSuccess.fold(
  //     AuthState.failure,
  //     (r) => const AuthState.unauthenticated(),
  //   );
  // }
  Future<void> signOut() async {
    debugPrint('signout Called');
    _authUser.value = null;
    debugPrint('USERIS ${_authUser.value}');
    await _userStorage.clear();
    final failureOrSuccess = await _authRemoteService.signOut();
    state = failureOrSuccess.fold(
      (l) => const AuthState.unauthenticated(),
      (r) => const AuthState.unauthenticated(),
    );
  }

  Future<void> forcedSignOut() async {
    _authUser.value = null;
    state = const AuthState.unauthenticated();
  }
}
