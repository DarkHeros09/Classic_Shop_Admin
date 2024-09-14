import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';

part 'color_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class ColorApi extends ChopperService {
  static ColorApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ColorApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$ColorApi(client);
  }

  @Get(
    path: '/colors',
  )
  Future<Response<List<Map<String, dynamic>>>> getColors({
    @Header('If-None-Match') required String ifNoneMatch,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ColorAdminApi extends ChopperService {
  static ColorAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ColorAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ColorAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/colors',
  )
  Future<Response<Map<String, dynamic>>> createColor({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Put(
    path: '/admins/{adminId}/colors/{id}',
  )
  Future<Response<Map<String, dynamic>>> updateColor({
    @Path() required String adminId,
    @Path() required String id,
    @Body() required Map<String, dynamic> data,
  });
}
