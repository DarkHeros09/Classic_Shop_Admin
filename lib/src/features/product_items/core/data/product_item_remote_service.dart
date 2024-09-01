import 'dart:developer';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_api.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class ProductItemRemoteService {
  ProductItemRemoteService(
    this._productApi,
    this._productAdminApi,
    this._headersCache,
  );

  final ProductItemApi _productApi;
  final ProductItemAdminApi _productAdminApi;
  final ResponseHeadersCache _headersCache;

  Future<RemoteResponse<List<ProductItemDTO>>> fetchProducts({
    required ProductItemsFunction productItemsFunction,
    required Uri requestUri,
    int? productId,
    int? categoryId,
    int? brandId,
    int? sizeId,
    int? colorId,
    int? lastItemId,
    int? lastProductId,
    String? query,
    int? pageSize,
    bool? isNew,
    bool? isPromoted,
    bool? orderByLowPrice,
    bool? orderByHighPrice,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    debugPrint(_productApi.client.baseUrl.authority); //!
    debugPrint(requestUri.toString()); //!
    debugPrint('ETag :'); //!
    debugPrint(previousHeaders?.etag); //!
    try {
      late final Response<List<Map<String, dynamic>>> response;
      switch (productItemsFunction) {
        case ProductItemsFunction.getProducts:
          response = await _productApi.getProducts(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );
          debugPrint('response: ');
          debugPrint(response.toString());

        case ProductItemsFunction.getProductsNextPage:
          response = await _productApi.getProductsNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastItemId: lastItemId ?? 0,
            lastProductId: lastProductId ?? 0,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );
          debugPrint('response Next: ');
          debugPrint(response.toString());

        case ProductItemsFunction.searchProducts:
          response = await _productApi.searchProducts(
            query: query ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.searchProductsNextPage:
          response = await _productApi.searchProductsNextPage(
            query: query ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastItemId: lastItemId ?? 0,
            lastProductId: lastProductId ?? 0,
          );

        case ProductItemsFunction.getProductsWithPromotions:
          response = await _productApi.getProductsWithPromotions(
            ifNoneMatch: previousHeaders?.etag ?? '',
            productId: productId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.getProductsWithPromotionsNextPage:
          response = await _productApi.getProductsWithPromotionsNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            lastItemId: lastItemId ?? 0,
            lastProductId: lastProductId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.getProductsWithBrandPromotions:
          response = await _productApi.getProductsWithBrandPromotions(
            ifNoneMatch: previousHeaders?.etag ?? '',
            brandId: brandId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.getProductsWithBrandPromotionsNextPage:
          response = await _productApi.getProductsWithBrandPromotionsNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            brandId: brandId ?? 0,
            lastItemId: lastItemId ?? 0,
            lastProductId: lastProductId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.getProductsWithCategoryPromotions:
          response = await _productApi.getProductsWithCategoryPromotions(
            ifNoneMatch: previousHeaders?.etag ?? '',
            categoryId: categoryId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ProductItemsFunction.getProductsWithCategoryPromotionsNextPage:
          response =
              await _productApi.getProductsWithCategoryPromotionsNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            categoryId: categoryId ?? 0,
            lastItemId: lastItemId ?? 0,
            lastProductId: lastProductId ?? 0,
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );
      }
      debugPrint('Body: ${response.body}'); //!
      debugPrint('Headers:');
      debugPrint(response.base.request?.headers.toString()); //!

      if (response.statusCode == 304) {
        debugPrint('ZXZX304');
        return RemoteResponse.notModified(
          nextAvailable: previousHeaders?.nextAvailable ?? false,
        );
      }

      if (response.statusCode == 204) {
        debugPrint('ZXZX204');
        return const RemoteResponse.noContent();
      }

      if (response.statusCode == 200) {
        debugPrint('ZXZX200');
        debugPrint('ZXZXresponse is ${response.statusCode}');
        if (response.body!.isEmpty) {
          debugPrint('ZXZX204');
          return const RemoteResponse.noContent();
        }
        final headers = ResponseHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);
        // response as Response<List<Map<String, dynamic>>>;
        final convertedBody =
            response.body!.map(ProductItemDTO.fromJson).toList();
        log('HEADDDD${headers.nextAvailable}');
        return RemoteResponse.withNewData(
          convertedBody,
          nextAvailable: headers.nextAvailable ?? true,
        );
      } else {
        debugPrint('ZXZXERR');
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      debugPrint('ZXZXNOCONN');
      return const RemoteResponse.noConnection();
    }
  }

  Future<RemoteResponse<ProductItemDTO>> createProductItem({
    required int adminId,
    required int productId,
    required int sizeId,
    required int imageId,
    required int colorId,
    required int productSku,
    required int qtyInStock,
    required String price,
    required bool active,
  }) async {
    try {
      final response = await _productAdminApi.createProductItem(
        adminId: adminId.toString(),
        data: {
          'product_id': productId,
          'size_id': sizeId,
          'image_id': imageId,
          'color_id': colorId,
          'product_sku': productSku,
          'qty_in_stock': qtyInStock,
          'price': price,
          'active': active,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final colorDTO = ProductItemDTO.fromJson(body);

      return RemoteResponse.withNewData(colorDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    required int productId,
    int? productSku,
    int? qtyInStock,
    String? price,
    bool? active,
  }) {
    final bodyRequest = <String, dynamic>{
      'product_id': productId,
    };
    if (productSku != null) {
      bodyRequest['product_sku'] = productSku.toString();
    }
    if (qtyInStock != null) {
      bodyRequest['qty_in_stock'] = qtyInStock.toString();
    }
    if (price != null) {
      bodyRequest['price'] = price;
    }
    if (active != null) {
      bodyRequest['active'] = active.toString();
    }
    return bodyRequest;
  }

  Future<RemoteResponse<ProductItemDTO>> updateProductItem({
    required int adminId,
    required int productItemId,
    required int productId,
    int? productSku,
    int? qtyInStock,
    String? price,
    bool? active,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        productId: productId,
        productSku: productSku,
        qtyInStock: qtyInStock,
        price: price,
        active: active,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _productAdminApi.updateProductItem(
        adminId: adminId.toString(),
        itemId: productItemId.toString(),
        data: bodyRequest,
      );

      debugPrint('JKL ${response.bodyString}');

      if (!response.isSuccessful) {
        final errorMessage = ApiErrorDto.fromJson(response.body ?? {});
        throw RestApiException(response.statusCode, errorMessage.error);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final productItemDTO = ProductItemDTO.fromJson(body);

      return RemoteResponse.withNewData(productItemDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
