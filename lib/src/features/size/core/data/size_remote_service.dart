import 'dart:io';
import 'dart:isolate';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_api.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';

abstract class ISizeRemoteService {
  Future<RemoteResponse<List<SizeDTO>>> fetchSizes({
    required Uri requestUri,
  });

  Future<RemoteResponse<SizeDTO>> createSize({
    required int adminId,
    required String sizeValue,
  });
}

class SizeRemoteService implements ISizeRemoteService {
  SizeRemoteService(
    this._sizeApi,
    this._sizeAdminApi,
    this._headersCache,
  );

  final SizeApi _sizeApi;
  final SizeAdminApi _sizeAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<SizeDTO>>> fetchSizes({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _sizeApi.getSizes(
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

        final sizeDtos = await Isolate.run(
          () => convertedBody.map(SizeDTO.fromJson).toList(),
        );
        return RemoteResponse.withNewData(
          sizeDtos,
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
  Future<RemoteResponse<SizeDTO>> createSize({
    required int adminId,
    required String sizeValue,
  }) async {
    try {
      final response = await _sizeAdminApi.createSize(
        adminId: adminId.toString(),
        data: {
          'size_value': sizeValue,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final sizeDTO = SizeDTO.fromJson(body);

      return RemoteResponse.withNewData(sizeDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Future<RemoteResponse<SizeDTO>> updateSize({
    required int adminId,
    required int productSizeId,
    required String size,
  }) async {
    try {
      final response = await _sizeAdminApi.updateSize(
        adminId: adminId.toString(),
        id: productSizeId.toString(),
        data: {
          'size': size,
        },
      );

      if (!response.isSuccessful) {
        final errorMessage = ApiErrorDTO.fromJson(response.body ?? {});
        throw RestApiException(response.statusCode, errorMessage.error);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final sizeDTO = SizeDTO.fromJson(body);

      return RemoteResponse.withNewData(sizeDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
