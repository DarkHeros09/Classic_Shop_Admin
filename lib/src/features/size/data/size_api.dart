import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';

part 'size_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class SizeApi extends ChopperService {
  static SizeApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$SizeApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$SizeApi(client);
  }

  @Get(
    path: '/sizes',
  )
  Future<Response<List<Map<String, dynamic>>>> getSizes({
    @Header('If-None-Match') required String ifNoneMatch,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class SizeAdminApi extends ChopperService {
  static SizeAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$SizeAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$SizeAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/sizes',
  )
  Future<Response<Map<String, dynamic>>> createSize({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });
}
