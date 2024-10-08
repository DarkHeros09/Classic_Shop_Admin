import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/image/data/image_api.dart';
import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:classic_shop_admin/src/features/image/helpers/enums.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IImageRemoteService {
  Future<RemoteResponse<List<ImageKitDTO>>> fetchImageKits({
    required int adminId,
    required Uri requestUri,
    required String path,
    String? tag,
  });
  Future<RemoteResponse<ProductItemImageDTO>> createImages({
    required int adminId,
    required String productImage1,
    required String productImage2,
    required String productImage3,
  });
}

class ImageRemoteService implements IImageRemoteService {
  const ImageRemoteService(
    this._imageApi,
    this._imageAdminApi,
    this._headersCache,
  );

  final ImageApi _imageApi;
  final ImageAdminApi _imageAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<ProductItemImageDTO>> createImages({
    required int adminId,
    required String productImage1,
    required String productImage2,
    required String productImage3,
  }) async {
    try {
      final response = await _imageAdminApi.createProductImages(
        adminId: adminId.toString(),
        data: {
          'product_image_1': productImage1,
          'product_image_2': productImage2,
          'product_image_3': productImage3,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final imageDTO = ProductItemImageDTO.fromJson(body);

      return RemoteResponse.withNewData(imageDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  @override
  Future<RemoteResponse<List<ImageKitDTO>>> fetchImageKits({
    required int adminId,
    required Uri requestUri,
    required String path,
    String? tag,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _imageAdminApi.listProductImagesKit(
        ifNoneMatch: previousHeaders?.etag ?? '',
        adminId: adminId.toString(),
        path: path,
        tag: tag ?? '',
      );
      debugPrint('IIMMGG $response');
      debugPrint('IIMMGG ${response.statusCode}');

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
          convertedBody.map(ImageKitDTO.fromJson).toList(),
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

  Future<RemoteResponse<List<ProductItemImageDTO>>> fetchImages({
    required ImagesFunction imagesFunction,
    required Uri requestUri,
    int? lastImageId,
    String? query,
    int? pageSize,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;
      switch (imagesFunction) {
        case ImagesFunction.getImages:
          response = await _imageApi.getImagesV2(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          );

        case ImagesFunction.getImagesNextPage:
          response = await _imageApi.getImagesNextPage(
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastImageId: lastImageId ?? 0,
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
        final convertedBody =
            response.body!.map(ProductItemImageDTO.fromJson).toList();
        return RemoteResponse.withNewData(
          convertedBody,
          nextAvailable: headers.nextAvailable ?? true,
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

  Map<String, dynamic> _createBodyRequest({
    String? productImage1,
    String? productImage2,
    String? productImage3,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (productImage1 != null) {
      bodyRequest['product_image_1'] = productImage1;
    }
    if (productImage2 != null) {
      bodyRequest['product_image_2'] = productImage2;
    }
    if (productImage3 != null) {
      bodyRequest['product_image_3'] = productImage3;
    }
    return bodyRequest;
  }

  Future<RemoteResponse<ProductItemImageDTO>> updateProductItemImage({
    required int adminId,
    required int productItemImageId,
    String? productImage1,
    String? productImage2,
    String? productImage3,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        productImage1: productImage1,
        productImage2: productImage2,
        productImage3: productImage3,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _imageAdminApi.updateProductImage(
        adminId: adminId.toString(),
        id: productItemImageId.toString(),
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

      final productImageDTO = ProductItemImageDTO.fromJson(body);

      return RemoteResponse.withNewData(productImageDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
