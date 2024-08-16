import 'dart:io';
import 'dart:isolate';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/color/data/color_api.dart';
import 'package:classic_shop_admin/src/features/color/data/color_dto.dart';

abstract class IColorRemoteService {
  Future<RemoteResponse<List<ColorDTO>>> fetchColors({
    required Uri requestUri,
  });

  Future<RemoteResponse<ColorDTO>> createColor({
    required int adminId,
    required String colorValue,
  });
}

class ColorRemoteService implements IColorRemoteService {
  ColorRemoteService(
    this._colorApi,
    this._colorAdminApi,
    this._headersCache,
  );

  final ColorApi _colorApi;
  final ColorAdminApi _colorAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<ColorDTO>>> fetchColors({
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _colorApi.getColors(
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
        final colorDtos = await Isolate.run(
          () => convertedBody.map(ColorDTO.fromJson).toList(),
        );
        return RemoteResponse.withNewData(
          colorDtos,
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
  Future<RemoteResponse<ColorDTO>> createColor({
    required int adminId,
    required String colorValue,
  }) async {
    try {
      final response = await _colorAdminApi.createColor(
        adminId: adminId.toString(),
        data: {
          'color_value': colorValue,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final colorDTO = ColorDTO.fromJson(body);

      return RemoteResponse.withNewData(colorDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}