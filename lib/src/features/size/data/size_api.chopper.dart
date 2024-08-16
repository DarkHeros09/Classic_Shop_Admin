// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SizeApi extends SizeApi {
  _$SizeApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SizeApi;

  @override
  Future<Response<List<Map<String, dynamic>>>> getSizes(
      {required String ifNoneMatch}) {
    final Uri $url = Uri.parse('http://192.168.1.105:8080/api/v1/sizes');
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
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SizeAdminApi extends SizeAdminApi {
  _$SizeAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SizeAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createSize({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url =
        Uri.parse('http://192.168.1.105:8080/admin/v1/admins/${adminId}/sizes');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
