import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_api.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IProductPromotionRemoteService {
  Future<RemoteResponse<List<ProductPromotionDTO?>>> fetchProductPromotions({
    required int adminId,
    required Uri requestUri,
  });
  Future<RemoteResponse<ProductPromotionDTO>> createProductPromotion({
    required int adminId,
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  });
  Future<RemoteResponse<ProductPromotionDTO>> updateProductPromotion({
    required int adminId,
    required int promotionId,
    required int productId,
    String? productPromotionImage,
    bool? active,
  });
}

class ProductPromotionRemoteService implements IProductPromotionRemoteService {
  ProductPromotionRemoteService(
    // this._productPromotionApi,
    this._productPromotionAdminApi,
    this._headersCache,
  );

  // final ProductPromotionApi _productPromotionApi;
  final ProductPromotionAdminApi _productPromotionAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<ProductPromotionDTO>>> fetchProductPromotions({
    required int adminId,
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _productPromotionAdminApi.getProductPromotions(
        adminId: adminId.toString(),
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
        return RemoteResponse.withNewData(
          convertedBody?.map(ProductPromotionDTO.fromJson).toList() ?? [],
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
  Future<RemoteResponse<ProductPromotionDTO>> createProductPromotion({
    required int adminId,
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  }) async {
    try {
      final response = await _productPromotionAdminApi.createProductPromotion(
        adminId: adminId.toString(),
        data: {
          'product_id': productId,
          'promotion_id': promotionId,
          'product_promotion_image': productPromotionImage,
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

      final productProductPromotionDTO = ProductPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(
        productProductPromotionDTO,
        nextAvailable: false,
      );
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    String? productPromotionImage,
    bool? active,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (productPromotionImage != null) {
      bodyRequest['product_promotion_image'] = productPromotionImage;
    }
    if (active != null) {
      bodyRequest['active'] = active;
    }

    return bodyRequest;
  }

  @override
  Future<RemoteResponse<ProductPromotionDTO>> updateProductPromotion({
    required int adminId,
    required int promotionId,
    required int productId,
    String? productPromotionImage,
    bool? active,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        productPromotionImage: productPromotionImage,
        active: active,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _productPromotionAdminApi.updateProductPromotion(
        adminId: adminId.toString(),
        promotionId: promotionId.toString(),
        productId: productId.toString(),
        data: bodyRequest,
      );

      debugPrint('JKL ${response.bodyString}');

      if (!response.isSuccessful) {
        final errorMessage = ApiErrorDTO.fromJson(response.body ?? {});
        throw RestApiException(response.statusCode, errorMessage.error);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final promotionDTO = ProductPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(promotionDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
