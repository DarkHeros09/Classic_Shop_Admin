import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_api.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IBrandPromotionRemoteService {
  Future<RemoteResponse<List<BrandPromotionDTO?>>> fetchBrandPromotions({
    required int adminId,
    required Uri requestUri,
  });
  Future<RemoteResponse<BrandPromotionDTO>> createBrandPromotion({
    required int adminId,
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  });
  Future<RemoteResponse<BrandPromotionDTO>> updateBrandPromotion({
    required int adminId,
    required int promotionId,
    required int brandId,
    String? brandPromotionImage,
    bool? active,
  });
}

class BrandPromotionRemoteService implements IBrandPromotionRemoteService {
  BrandPromotionRemoteService(
    // this._brandApi,
    this._brandPromotionAdminApi,
    this._headersCache,
  );

  // final BrandPromotionApi _brandApi;
  final BrandPromotionAdminApi _brandPromotionAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<BrandPromotionDTO>>> fetchBrandPromotions({
    required int adminId,
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _brandPromotionAdminApi.getBrandPromotions(
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
          convertedBody?.map(BrandPromotionDTO.fromJson).toList() ?? [],
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
  Future<RemoteResponse<BrandPromotionDTO>> createBrandPromotion({
    required int adminId,
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) async {
    try {
      final response = await _brandPromotionAdminApi.createBrandPromotion(
        adminId: adminId.toString(),
        data: {
          'brand_id': brandId,
          'promotion_id': promotionId,
          'brand_promotion_image': brandPromotionImage,
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

      final brandDTO = BrandPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(brandDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    String? brandPromotionImage,
    bool? active,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (brandPromotionImage != null) {
      bodyRequest['brand_promotion_image'] = brandPromotionImage;
    }
    if (active != null) {
      bodyRequest['active'] = active;
    }

    return bodyRequest;
  }

  @override
  Future<RemoteResponse<BrandPromotionDTO>> updateBrandPromotion({
    required int adminId,
    required int promotionId,
    required int brandId,
    String? brandPromotionImage,
    bool? active,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        brandPromotionImage: brandPromotionImage,
        active: active,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _brandPromotionAdminApi.updateBrandPromotion(
        adminId: adminId.toString(),
        promotionId: promotionId.toString(),
        brandId: brandId.toString(),
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

      final promotionDTO = BrandPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(promotionDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
