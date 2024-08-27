import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/promotion/data/promotion_api.dart';
import 'package:classic_shop_admin/src/features/promotion/data/promotion_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IPromotionRemoteService {
  Future<RemoteResponse<List<PromotionDTO?>>> fetchPromotions({
    required Uri requestUri,
  });
  Future<RemoteResponse<PromotionDTO>> createPromotion({
    required int adminId,
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  });
}

class PromotionRemoteService implements IPromotionRemoteService {
  PromotionRemoteService(
    this._promotionApi,
    this._promotionAdminApi,
    this._headersCache,
  );

  final PromotionApi _promotionApi;
  final PromotionAdminApi _promotionAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<PromotionDTO>>> fetchPromotions({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      debugPrint('PROOO CALLED');
      response = await _promotionApi.getPromotions(
        ifNoneMatch: previousHeaders?.etag ?? '',
      );

      debugPrint('PROOO $response');

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
          convertedBody?.map(PromotionDTO.fromJson).toList() ?? [],
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
  Future<RemoteResponse<PromotionDTO>> createPromotion({
    required int adminId,
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      debugPrint('KKKK');
      debugPrint(startDate.toIso8601String());
      final response = await _promotionAdminApi.createPromotion(
        adminId: adminId.toString(),
        data: {
          'name': name,
          'description': description,
          'discount_rate': discountRate,
          'active': active,
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final promotionDTO = PromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(promotionDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
