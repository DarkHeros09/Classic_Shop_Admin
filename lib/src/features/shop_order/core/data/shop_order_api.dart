import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'shop_order_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ShopOrdersAdminApi extends ChopperService {
  static ShopOrdersAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ShopOrdersAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ShopOrdersAdminApi(client);
  }

  @Get(
    path: '/admins/{adminId}/shop-orders-v2',
  )
  Future<Response<List<Map<String, dynamic>>>> listShopOrders({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path('adminId') required String adminId,
    @Query('limit') required int pageSize,
    @Query('order_status') String? orderStatus,
  });

  @Get(
    path: '/admins/{adminId}/shop-orders-next-page',
  )
  Future<Response<List<Map<String, dynamic>>>> listShopOrdersNextPage({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path('adminId') required String adminId,
    @Query('cursor') required int lastShopOrderId,
    @Query('limit') required int pageSize,
    @Query('order_status') String? orderStatus,
  });

  @Put(
    path: '/admins/{adminId}/shop-orders/{shopOrderId}',
  )
  Future<Response<Map<String, dynamic>>> updateShopOrder({
    @Path() required String adminId,
    @Path() required String shopOrderId,
    @Body() required Map<String, dynamic> data,
  });
}