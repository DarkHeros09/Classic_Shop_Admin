import 'dart:io';

import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_api.dart';
import 'package:classic_shop_admin/src/features/category_promotion/data/category_promotion_dto.dart';

abstract class ICategoryPromotionRemoteService {
  // Future<RemoteResponse<List<CategoryPromotionDTO?>>> fetchCategories({
  //   required Uri requestUri,
  // });
  Future<RemoteResponse<CategoryPromotionDTO>> createCategoryPromotion({
    required int adminId,
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  });
}

class CategoryPromotionRemoteService
    implements ICategoryPromotionRemoteService {
  CategoryPromotionRemoteService(
    // this._categoryApi,
    this._categoryAdminApi,
    // this._headersCache,
  );

  // final CategoryPromotionApi _categoryApi;
  final CategoryPromotionAdminApi _categoryAdminApi;
  // final ResponseHeadersCache _headersCache;

  // @override
  // Future<RemoteResponse<List<CategoryPromotionDTO>>> fetchCategories({
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
  //         convertedBody?.map(CategoryPromotionDTO.fromJson).toList() ?? [],
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
  Future<RemoteResponse<CategoryPromotionDTO>> createCategoryPromotion({
    required int adminId,
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  }) async {
    try {
      final response = await _categoryAdminApi.createCategoryPromotion(
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
}
