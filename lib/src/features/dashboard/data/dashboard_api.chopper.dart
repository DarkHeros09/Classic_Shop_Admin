// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DashboardApi extends DashboardApi {
  _$DashboardApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DashboardApi;

  @override
  Future<Response<Map<String, dynamic>>> getDashboardInfo({
    required String ifNoneMatch,
    required String adminId,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/dashboard');
    final Map<String, String> $headers = {
      'If-None-Match': ifNoneMatch,
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
