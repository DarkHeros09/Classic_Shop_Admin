import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/features/auth/data/auth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:http/io_client.dart';

part 'shop_order_items_api.chopper.dart';

@ChopperApi(baseUrl: 'http://${Env.httpAddress}/admin/v1')
abstract class ShopOrderItemsAdminApi extends ChopperService {
  static ShopOrderItemsAdminApi create(Ref ref) {
    final client = ChopperClient(
      client: IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 10),
      ),
      services: [_$ShopOrderItemsAdminApi()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthInterceptor(ref: ref),
      ],
      authenticator: AuthInterceptor(ref: ref),
    );

    return _$ShopOrderItemsAdminApi(client);
  }

  @Get(
    path: '/admins/{adminId}/shop-order-items/{orderId}',
  )
  Future<Response<List<Map<String, dynamic>>>> listShopOrderItems({
    @Header('If-None-Match') required String ifNoneMatch,
    @Path() required String adminId,
    @Path() required String orderId,
    @Body() required Map<String, dynamic> data,
  });

  @Delete(
    path: '/admins/{adminId}/shop-order-items/{id}',
  )
  Future<Response<Map<String, dynamic>>> deleteShopOrderItem({
    @Path() required String adminId,
    @Path() required String id,
  });
}
