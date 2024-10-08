// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OrderStatusAdminApi extends OrderStatusAdminApi {
  _$OrderStatusAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrderStatusAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createOrderStatus({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/order-status');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> listOrderStatus({
    required String ifNoneMatch,
    required String adminId,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/order-status');
    final Map<String, String> $headers = {
      'If-None-Match': ifNoneMatch,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> updateOrderStatus({
    required String adminId,
    required String id,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/order-status/${id}');
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
