import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/image/data/image_api.dart';
import 'package:classic_shop_admin/src/features/image/data/image_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IImageRemoteService {
  Future<RemoteResponse<List<ImageKitDTO>>> fetchImages({
    required int adminId,
    required Uri requestUri,
  });
  Future<RemoteResponse<ImageDTO>> createImages({
    required int adminId,
    required String productImage1,
    required String productImage2,
    required String productImage3,
  });
}

class ImageRemoteService implements IImageRemoteService {
  const ImageRemoteService(
    this._imageApi,
    this._headersCache,
  );

  final ImageApi _imageApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<ImageDTO>> createImages({
    required int adminId,
    required String productImage1,
    required String productImage2,
    required String productImage3,
  }) async {
    try {
      final response = await _imageApi.createProductImages(
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

      final imageDTO = ImageDTO.fromJson(body);

      return RemoteResponse.withNewData(imageDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  @override
  Future<RemoteResponse<List<ImageKitDTO>>> fetchImages({
    required int adminId,
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _imageApi.listProductImagesKit(
        ifNoneMatch: previousHeaders?.etag ?? '',
        adminId: adminId.toString(),
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
      return const RemoteResponse.noConnection();
    }
  }
}
