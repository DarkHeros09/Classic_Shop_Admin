// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthApi extends AuthApi {
  _$AuthApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthApi;

  @override
  Future<Response<Map<String, dynamic>>> signIn(
      {required Map<String, dynamic> data}) {
    final Uri $url = Uri.parse('http://192.168.1.104:8080/api/v1/admins/login');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> renewAccessToken(
      {required Map<String, dynamic> data}) {
    final Uri $url = Uri.parse(
        'http://192.168.1.104:8080/api/v1/auth/access-token-for-admin');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> renewRefreshToken(
      {required Map<String, dynamic> data}) {
    final Uri $url = Uri.parse(
        'http://192.168.1.104:8080/api/v1/auth/refresh-token-for-admin');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthApi2 extends AuthApi2 {
  _$AuthApi2([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthApi2;

  @override
  Future<Response<void>> signOut({
    required String accessToken,
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.104:8080/admin/v1/admins/${adminId}/logout');
    final Map<String, String> $headers = {
      'Authorization': accessToken,
      'Content-Type': 'application/json',
    };
    final $body = data;
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<void, void>($request);
  }
}
