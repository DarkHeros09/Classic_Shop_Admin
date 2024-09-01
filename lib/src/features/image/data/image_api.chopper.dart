// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ImageApi extends ImageApi {
  _$ImageApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ImageApi;

  @override
  Future<Response<List<Map<String, dynamic>>>> getImagesV2({
    required String ifNoneMatch,
    required int pageSize,
  }) {
    final Uri $url = Uri.parse('http://192.168.1.105:8080/api/v1/images-v2');
    final Map<String, dynamic> $params = <String, dynamic>{'limit': pageSize};
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
  Future<Response<List<Map<String, dynamic>>>> getImagesNextPage({
    required String ifNoneMatch,
    required int lastImageId,
    required int pageSize,
  }) {
    final Uri $url =
        Uri.parse('http://192.168.1.105:8080/api/v1/images-next-page');
    final Map<String, dynamic> $params = <String, dynamic>{
      'product_cursor': lastImageId,
      'limit': pageSize,
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
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ImageAdminApi extends ImageAdminApi {
  _$ImageAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ImageAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createProductImages({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/product-images');
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
  Future<Response<List<Map<String, dynamic>>>> listProductImagesKit({
    required String ifNoneMatch,
    required String adminId,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/product-images/kit');
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
  Future<Response<Map<String, dynamic>>> updateProductImages({
    required String adminId,
    required String id,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/product-images/${id}');
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
