import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_api.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IBrandRemoteService {
  Future<RemoteResponse<List<BrandDTO>>> fetchBrands({
    required Uri requestUri,
  });

  Future<RemoteResponse<BrandDTO>> createBrand({
    required int adminId,
    required String brandName,
    required String brandImage,
  });

  Future<RemoteResponse<BrandDTO>> fetchBrand({
    required Uri requestUri,
    required String brandId,
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
      return RemoteResponse.noConnection(
        nextAvailable: previousHeaders?.nextAvailable ?? false,
      );
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

  @override
  Future<RemoteResponse<BrandDTO>> fetchBrand({
    required Uri requestUri,
    required String brandId,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<Map<String, dynamic>> response;

      response = await _brandApi.getBrand(
        ifNoneMatch: previousHeaders?.etag ?? '',
        brandId: brandId,
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
          BrandDTO.fromJson(convertedBody ?? {}),
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

  Map<String, dynamic> _createBodyRequest({
    String? brandName,
    String? brandImage,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (brandName != null) {
      bodyRequest['brand_name'] = brandName;
    }
    if (brandImage != null) {
      bodyRequest['brand_image'] = brandImage;
    }

    return bodyRequest;
  }

  Future<RemoteResponse<BrandDTO>> updateBrand({
    required int adminId,
    required int brandId,
    String? brandName,
    String? brandImage,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        brandName: brandName,
        brandImage: brandImage,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _brandAdminApi.updateBrand(
        adminId: adminId.toString(),
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

      final brandDTO = BrandDTO.fromJson(body);

      return RemoteResponse.withNewData(brandDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
