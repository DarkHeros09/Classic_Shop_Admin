import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_api.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class ICategoryPromotionRemoteService {
  Future<RemoteResponse<List<CategoryPromotionDTO?>>> fetchCategoryPromotions({
    required int adminId,
    required Uri requestUri,
  });
  Future<RemoteResponse<CategoryPromotionDTO>> createCategoryPromotion({
    required int adminId,
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  });
  Future<RemoteResponse<CategoryPromotionDTO>> updateCategoryPromotion({
    required int adminId,
    required int promotionId,
    required int categoryId,
    String? categoryPromotionImage,
    bool? active,
  });
}

class CategoryPromotionRemoteService
    implements ICategoryPromotionRemoteService {
  CategoryPromotionRemoteService(
    // this._categoryApi,
    this._categoryPromotionAdminApi,
    this._headersCache,
  );

  // final CategoryPromotionApi _categoryApi;
  final CategoryPromotionAdminApi _categoryPromotionAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<CategoryPromotionDTO>>> fetchCategoryPromotions({
    required int adminId,
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _categoryPromotionAdminApi.getCategoryPromotions(
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
          convertedBody?.map(CategoryPromotionDTO.fromJson).toList() ?? [],
          nextAvailable: false,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return RemoteResponse.noConnection(
        nextAvailable: previousHeaders?.nextAvailable ?? false,
      );
    }
  }

  @override
  Future<RemoteResponse<CategoryPromotionDTO>> createCategoryPromotion({
    required int adminId,
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  }) async {
    try {
      final response = await _categoryPromotionAdminApi.createCategoryPromotion(
        adminId: adminId.toString(),
        data: {
          'category_id': categoryId,
          'promotion_id': promotionId,
          'category_promotion_image': categoryPromotionImage,
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

      final categoryDTO = CategoryPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(categoryDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    String? categoryPromotionImage,
    bool? active,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (categoryPromotionImage != null) {
      bodyRequest['category_promotion_image'] = categoryPromotionImage;
    }
    if (active != null) {
      bodyRequest['active'] = active;
    }

    return bodyRequest;
  }

  @override
  Future<RemoteResponse<CategoryPromotionDTO>> updateCategoryPromotion({
    required int adminId,
    required int promotionId,
    required int categoryId,
    String? categoryPromotionImage,
    bool? active,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        categoryPromotionImage: categoryPromotionImage,
        active: active,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _categoryPromotionAdminApi.updateCategoryPromotion(
        adminId: adminId.toString(),
        promotionId: promotionId.toString(),
        categoryId: categoryId.toString(),
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

      final promotionDTO = CategoryPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(promotionDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
