// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_order_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ShopOrdersAdminApi extends ShopOrdersAdminApi {
  _$ShopOrdersAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ShopOrdersAdminApi;

  @override
  Future<Response<List<Map<String, dynamic>>>> listShopOrders({
    required String ifNoneMatch,
    required String adminId,
    required int pageSize,
    String? orderStatus,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/shop-orders-v2');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': pageSize,
      'order_status': orderStatus,
    };
    final Map<String, String> $headers = {
      'If-None-Match': ifNoneMatch,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> listShopOrdersNextPage({
    required String ifNoneMatch,
    required String adminId,
    required int lastShopOrderId,
    required int pageSize,
    String? orderStatus,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/shop-orders-next-page');
    final Map<String, dynamic> $params = <String, dynamic>{
      'cursor': lastShopOrderId,
      'limit': pageSize,
      'order_status': orderStatus,
    };
    final Map<String, String> $headers = {
      'If-None-Match': ifNoneMatch,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> updateShopOrder({
    required String adminId,
    required String shopOrderId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/shop-orders/${shopOrderId}');
    final $body = data;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
