import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'auth_api.chopper.dart';

const normalheaders = {'Content-Type': 'application/json'};

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class AuthApi extends ChopperService {
  static AuthApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$AuthApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$AuthApi(client);
  }

  @Post(
    path: '/admins/login',
    headers: normalheaders,
  )
  Future<Response<Map<String, dynamic>>> signIn({
    @Body() required Map<String, dynamic> data,
  });

  @Post(
    path: '/auth/access-token-for-admin',
    headers: normalheaders,
  )
  Future<Response<Map<String, dynamic>>> renewAccessToken({
    @Body() required Map<String, dynamic> data,
  });

  @Post(
    path: '/auth/refresh-token-for-admin',
    headers: normalheaders,
  )
  Future<Response<Map<String, dynamic>>> renewRefreshToken({
    @Body() required Map<String, dynamic> data,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class AuthApi2 extends ChopperService {
  static AuthApi2 create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$AuthApi2()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$AuthApi2(client);
  }

  @Delete(
    path: '/admins/{id}/logout',
    headers: normalheaders,
  )
  Future<Response<void>> signOut({
    @Header('Authorization') required String accessToken,
    @Path('id') required String adminId,
    @Body() required Map<String, dynamic> data,
  });
}
