// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ProductApi extends ProductApi {
  _$ProductApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ProductApi;

  @override
  Future<Response<List<Map<String, dynamic>>>> getProducts(
      {required String ifNoneMatch}) {
    final Uri $url = Uri.parse('http://192.168.1.105:8080/api/v1/products');
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
  Future<Response<List<Map<String, dynamic>>>> getProductsV2({
    required String ifNoneMatch,
    required int pageSize,
  }) {
    final Uri $url = Uri.parse('http://192.168.1.105:8080/api/v1/products-v2');
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
  Future<Response<List<Map<String, dynamic>>>> getProductsNextPage({
    required String ifNoneMatch,
    required int lastProductId,
    required int pageSize,
  }) {
    final Uri $url =
        Uri.parse('http://192.168.1.105:8080/api/v1/products-next-page');
    final Map<String, dynamic> $params = <String, dynamic>{
      'product_cursor': lastProductId,
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

  @override
  Future<Response<List<Map<String, dynamic>>>> searchProducts({
    required String query,
    required int pageSize,
  }) {
    final Uri $url =
        Uri.parse('http://192.168.1.105:8080/api/v1/search-products');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'limit': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> searchProductsNextPage({
    required String query,
    required int lastProductId,
    required int pageSize,
  }) {
    final Uri $url =
        Uri.parse('http://192.168.1.105:8080/api/v1/search-products-next-page');
    final Map<String, dynamic> $params = <String, dynamic>{
      'query': query,
      'product_cursor': lastProductId,
      'limit': pageSize,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ProductAdminApi extends ProductAdminApi {
  _$ProductAdminApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ProductAdminApi;

  @override
  Future<Response<Map<String, dynamic>>> createProduct({
    required String adminId,
    required Map<String, dynamic> data,
  }) {
    final Uri $url = Uri.parse(
        'http://192.168.1.105:8080/admin/v1/admins/${adminId}/products');
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
