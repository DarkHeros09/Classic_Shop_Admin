import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'product_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ProductAdminApi extends ChopperService {
  static ProductAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ProductAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ProductAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/products',
  )
  Future<Response<Map<String, dynamic>>> createProduct({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });
}
