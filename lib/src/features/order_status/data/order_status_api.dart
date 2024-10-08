import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/io_client.dart';

part 'order_status_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class OrderStatusAdminApi extends ChopperService {
  static OrderStatusAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$OrderStatusAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$OrderStatusAdminApi(client);
  }

  @Post(
    path: '/admins/{adminId}/order-status',
  )
  Future<Response<Map<String, dynamic>>> createOrderStatus({
    @Path() required String adminId,
    @Body() required Map<String, dynamic> data,
  });

  @Get(
    path: '/admins/{adminId}/order-status',
  )
  Future<Response<List<Map<String, dynamic>>>> listOrderStatus({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path() required String adminId,
  });

  @Put(
    path: '/admins/{adminId}/order-status/{id}',
  )
  Future<Response<Map<String, dynamic>>> updateOrderStatus({
    @Path() required String adminId,
    @Path() required String id,
    @Body() required Map<String, dynamic> data,
  });
}
