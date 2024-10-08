import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_api.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_dto.dart';

abstract class IDashboardRemoteService {
  Future<RemoteResponse<DashboardDTO>> fetchDashboard({
    required int adminId,
    required Uri requestUri,
  });
}

class DashboardRemoteService implements IDashboardRemoteService {
  DashboardRemoteService(
    this._dashboardApi,
    this._headersCache,
  );

  final DashboardApi _dashboardApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<DashboardDTO>> fetchDashboard({
    required int adminId,
    required Uri requestUri,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<Map<String, dynamic>> response;

      response = await _dashboardApi.getDashboardInfo(
        ifNoneMatch: previousHeaders?.etag ?? '',
        adminId: adminId.toString(),
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
          DashboardDTO.fromJson(convertedBody),
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
}
