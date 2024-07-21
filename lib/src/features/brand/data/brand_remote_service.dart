import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_api.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_dto.dart';

abstract class IBrandRemoteService {
  Future<RemoteResponse<List<BrandDTO>>> fetchBrands({
    required Uri requestUri,
  });

  Future<RemoteResponse<BrandDTO>> createBrand({
    required int adminId,
    required String brandName,
    required String brandImage,
  });
}

class BrandRemoteService implements IBrandRemoteService {
  BrandRemoteService(
    this._brandApi,
    this._brandAdminApi,
    this._headersCache,
  );

  final BrandApi _brandApi;
  final BrandAdminApi _brandAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<BrandDTO>>> fetchBrands({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _brandApi.getBrands(
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
        if (convertedBody == null || convertedBody.isEmpty) {
          return const RemoteResponse.noContent();
        }
        return RemoteResponse.withNewData(
          convertedBody.map(BrandDTO.fromJson).toList(),
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
  Future<RemoteResponse<BrandDTO>> createBrand({
    required int adminId,
    required String brandName,
    required String brandImage,
  }) async {
    try {
      final response = await _brandAdminApi.createBrand(
        adminId: adminId.toString(),
        data: {
          'brand_name': brandName,
          'brand_image': brandImage,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final brandDTO = BrandDTO.fromJson(body);

      return RemoteResponse.withNewData(brandDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
