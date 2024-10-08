// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_order_items_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ShopOrderItemsAdminApi extends ShopOrderItemsAdminApi {
  _$ShopOrderItemsAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ShopOrderItemsAdminApi;

  @override
  Future<Response<List<Map<String, dynamic>>>> listShopOrderItems({
    required String ifNoneMatch,
    required String adminId,
    required String orderId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/shop-order-items/${orderId}');
    final Map<String, String> $headers = {
      'If-None-Match': ifNoneMatch,
    };
    final $body = data;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> deleteShopOrderItem({
    required String adminId,
    required String id,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/shop-order-items/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
