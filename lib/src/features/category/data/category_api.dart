import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'category_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/api/v1')
abstract class CategoryApi extends ChopperService {
  static CategoryApi create() {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$CategoryApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$CategoryApi(client);
  }

  @Get(
    path: '/categories',
  )
  Future<Response<List<Map<String, dynamic>>>> getCategories({
    @Header('If-None-Match') required String ifNoneMatch,
  });
}

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class CategoryAdminApi extends ChopperService {
  static CategoryAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$CategoryAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$CategoryAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/categories',
  )
  Future<Response<Map<String, dynamic>>> createCategory({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });
}
