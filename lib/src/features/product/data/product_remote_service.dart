import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/product/data/product_api.dart';
import 'package:classic_shop_admin/src/features/product/data/product_dto.dart';
import 'package:classic_shop_admin/src/features/product/helpers/enums.dart';

abstract class IProductRemoteService {
  Future<RemoteResponse<List<ProductDTO>>> listAllProducts({
    required Uri requestUri,
  });

  Future<RemoteResponse<ProductDTO>> createProduct({
    required int adminId,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool isActive,
  });
}

class ProductRemoteService implements IProductRemoteService {
  ProductRemoteService(
    this._productApi,
    this._productAdminApi,
    this._headersCache,
  );

  final ProductApi _productApi;
  final ProductAdminApi _productAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<ProductDTO>>> listAllProducts({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _productApi.getProducts(
        ifNoneMatch: previousHeaders?.etag ?? '',
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.notModified(
          nextAvailable: false,
        );
      }

      if (response.isSuccessful) {
        final headers = ResponseHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);
        final convertedBody = response.body;
        if (convertedBody == null || convertedBody.isEmpty) {
          return const RemoteResponse.noContent();
        }
        return RemoteResponse.withNewData(
          convertedBody.map(ProductDTO.fromJson).toList(),
          nextAvailable: false,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  @override
  Future<RemoteResponse<ProductDTO>> createProduct({
    required int adminId,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool isActive,
  }) async {
    try {
      final response = await _productAdminApi.createProduct(
        adminId: adminId.toString(),
        data: {
          'name': name,
          'category_id': categoryId,
          'brand_id': brandId,
          'description': description,
          'active': isActive,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final productDTO = ProductDTO.fromJson(body);

      return RemoteResponse.withNewData(productDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Future<RemoteResponse<List<ProductDTO>>> fetchProducts({
    required ProductsFunction productsFunction,
    required Uri requestUri,
    int? lastProductId,
    String? query,
    int? pageSize,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;
      switch (productsFunction) {
        case ProductsFunction.getProducts:
          response = await _productApi.getProductsV2(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductsFunction.getProductsNextPage:
          response = await _productApi.getProductsNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastProductId: lastProductId ?? 0,
          );

        case ProductsFunction.searchProducts:
          response = await _productApi.searchProducts(
            query: query ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductsFunction.searchProductsNextPage:
          response = await _productApi.searchProductsNextPage(
            query: query ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastProductId: lastProductId ?? 0,
          );
      }

      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          nextAvailable: previousHeaders?.nextAvailable ?? false,
        );
      }

      if (response.statusCode == 204) {
        return const RemoteResponse.noContent();
      }

      if (response.statusCode == 200) {
        if (response.body!.isEmpty) {
          return const RemoteResponse.noContent();
        }
        final headers = ResponseHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);
        // response as Response<List<Map<String, dynamic>>>;
        final convertedBody = response.body!.map(ProductDTO.fromJson).toList();
        return RemoteResponse.withNewData(
          convertedBody,
          nextAvailable: headers.nextAvailable ?? true,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
