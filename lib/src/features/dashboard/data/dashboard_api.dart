import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'dashboard_api.chopper.dart';

const normalheaders = {'Content-Type': 'application/json'};

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class DashboardApi extends ChopperService {
  static DashboardApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$DashboardApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$DashboardApi(client);
  }

  @Get(
    path: '/admins/{adminId}/dashboard',
    headers: normalheaders,
  )
  Future<Response<Map<String, dynamic>>> getDashboardInfo({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path('adminId') required String adminId,
  });
}
