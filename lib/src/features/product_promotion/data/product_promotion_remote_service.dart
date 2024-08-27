import 'dart:io';

import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_api.dart';
import 'package:classic_shop_admin/src/features/product_promotion/data/product_promotion_dto.dart';

abstract class IProductPromotionRemoteService {
  // Future<RemoteResponse<List<ProductPromotionDTO?>>> fetchCategories({
  //   required Uri requestUri,
  // });
  Future<RemoteResponse<ProductPromotionDTO>> createProductPromotion({
    required int adminId,
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  });
}

class ProductPromotionRemoteService implements IProductPromotionRemoteService {
  ProductPromotionRemoteService(
    // this._productPromotionApi,
    this._productPromotionAdminApi,
    // this._headersCache,
  );

  // final ProductPromotionApi _productPromotionApi;
  final ProductPromotionAdminApi _productPromotionAdminApi;
  // final ResponseHeadersCache _headersCache;

  // @override
  // Future<RemoteResponse<List<ProductPromotionDTO>>> fetchCategories({
  //   required Uri requestUri,
  // }) async {
  //   final previousHeaders = await _headersCache.getHeaders(requestUri);
  //   try {
  //     late final Response<List<Map<String, dynamic>>> response;

  //     response = await _productPromotionApi.getCategories(
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
  //         convertedBody?.map(ProductPromotionDTO.fromJson).toList() ?? [],
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

      final productPromotionDTO = ProductPromotionDTO.fromJson(body);

      return RemoteResponse.withNewData(
        productPromotionDTO,
        nextAvailable: false,
      );
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
