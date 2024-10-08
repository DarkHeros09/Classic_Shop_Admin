import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_api.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_dto.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IOrderStatusRemoteService {
  Future<RemoteResponse<List<OrderStatusDTO>>> listOrderStatus({
    required Uri requestUri,
    required int adminId,
  });

  Future<RemoteResponse<OrderStatusDTO>> createOrderStatus({
    required int adminId,
    required String status,
  });

  Future<RemoteResponse<OrderStatusDTO>> updateOrderStatus({
    required int adminId,
    required int orderStatusId,
    String? status,
  });
}

class OrderStatusRemoteService implements IOrderStatusRemoteService {
  OrderStatusRemoteService(
    // this._orderStatusApi,
    this._orderStatusAdminApi,
    this._headersCache,
  );

  // final OrderStatusApi _orderStatusApi;
  final OrderStatusAdminApi _orderStatusAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<OrderStatusDTO>>> listOrderStatus({
    required Uri requestUri,
    required int adminId,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;

      response = await _orderStatusAdminApi.listOrderStatus(
        ifNoneMatch: previousHeaders?.etag ?? '',
        adminId: adminId.toString(),
      );

      if (response.statusCode == 304) {
        // await _headersCache.deleteAllHeaders();
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
          convertedBody.map(OrderStatusDTO.fromJson).toList(),
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
  Future<RemoteResponse<OrderStatusDTO>> createOrderStatus({
    required int adminId,
    required String status,
  }) async {
    try {
      final response = await _orderStatusAdminApi.createOrderStatus(
        adminId: adminId.toString(),
        data: {
          'status': status,
        },
      );

      if (!response.isSuccessful) {
        throw RestApiException(response.statusCode);
      }

      final body = response.body;

      if (body == null) {
        throw const RestApiException();
      }

      final orderStatusDTO = OrderStatusDTO.fromJson(body);

      return RemoteResponse.withNewData(orderStatusDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    String? status,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (status != null) {
      bodyRequest['status'] = status;
    }

    return bodyRequest;
  }

  @override
  Future<RemoteResponse<OrderStatusDTO>> updateOrderStatus({
    required int adminId,
    required int orderStatusId,
    String? status,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        status: status,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _orderStatusAdminApi.updateOrderStatus(
        adminId: adminId.toString(),
        id: orderStatusId.toString(),
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

      final orderStatusDTO = OrderStatusDTO.fromJson(body);

      return RemoteResponse.withNewData(orderStatusDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
