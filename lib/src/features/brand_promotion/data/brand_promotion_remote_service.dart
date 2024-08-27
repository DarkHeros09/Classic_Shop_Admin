import 'dart:io';

import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_api.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/data/brand_promotion_dto.dart';

abstract class IBrandPromotionRemoteService {
  // Future<RemoteResponse<List<BrandPromotionDTO?>>> fetchCategories({
  //   required Uri requestUri,
  // });
  Future<RemoteResponse<BrandPromotionDTO>> createBrandPromotion({
    required int adminId,
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  });
}

class BrandPromotionRemoteService implements IBrandPromotionRemoteService {
  BrandPromotionRemoteService(
    // this._categoryApi,
    this._categoryAdminApi,
    // this._headersCache,
  );

  // final BrandPromotionApi _categoryApi;
  final BrandPromotionAdminApi _categoryAdminApi;
  // final ResponseHeadersCache _headersCache;

  // @override
  // Future<RemoteResponse<List<BrandPromotionDTO>>> fetchCategories({
  //   required Uri requestUri,
  // }) async {
  //   final previousHeaders = await _headersCache.getHeaders(requestUri);
  //   try {
  //     late final Response<List<Map<String, dynamic>>> response;

  //     response = await _categoryApi.getCategories(
  //       ifNoneMatch: previousHeaders?.etag ?? '',
  //     );

  //     if (response.statusCode == 304) {
  //       return const RemoteResponse.notModified(
  //         nextAvailable: false,
  //       );
  //     }

  //     if (response.isSuccessful) {
  //       final headers = ResponseHeaders.parse(response);
  //       await _headersCache.saveHeaders(requestUri, headers);
  //       final convertedBody = response.body;
  //       return RemoteResponse.withNewData(
  //         convertedBody?.map(BrandPromotionDTO.fromJson).toList() ?? [],
  //         nextAvailable: false,
  //       );
  //     } else {
  //       throw RestApiException(response.statusCode);
  //     }
  //   } on SocketException {
  //     return const RemoteResponse.noConnection();
  //   }
  // }

  @override
  Future<RemoteResponse<BrandPromotionDTO>> createBrandPromotion({
    required int adminId,
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) async {
    try {
      final response = await _categoryAdminApi.createBrandPromotion(
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

      final categoryDTO = BrandPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(categoryDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
