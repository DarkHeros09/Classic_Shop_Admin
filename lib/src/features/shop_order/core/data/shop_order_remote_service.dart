import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_api.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_dto.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/helpers/enums.dart';
import 'package:classic_shop_admin/src/helpers/api_error_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IShopOrderRemoteService {
  Future<RemoteResponse<List<ShopOrderDTO>>> fetchShopOrders({
    required ShopOrdersFunction shopOrdersFunction,
    required Uri requestUri,
    required int adminId,
    int? pageSize,
    int? lastShopOrderId,
    String? orderStatus,
  });

  Future<RemoteResponse<ShopOrderDTO>> updateShopOrder({
    required int adminId,
    required int shopOrderId,
    int? shopOrderStatusId,
  });
}

class ShopOrderRemoteService implements IShopOrderRemoteService {
  ShopOrderRemoteService(
    // this._categoryApi,
    this._shopOrdersAdminApi,
    this._headersCache,
  );

  // final ShopOrderApi _categoryApi;
  final ShopOrdersAdminApi _shopOrdersAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<ShopOrderDTO>>> fetchShopOrders({
    required ShopOrdersFunction shopOrdersFunction,
    required Uri requestUri,
    required int adminId,
    int? pageSize,
    int? lastShopOrderId,
    String? orderStatus,
  }) async {
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      late final Response<List<Map<String, dynamic>>> response;
      switch (shopOrdersFunction) {
        case ShopOrdersFunction.getShopOrders:
          response = await _shopOrdersAdminApi.listShopOrders(
            adminId: adminId.toString(),
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            orderStatus: orderStatus,
          );

        case ShopOrdersFunction.getShopOrdersNextPage:
          response = await _shopOrdersAdminApi.listShopOrdersNextPage(
            adminId: adminId.toString(),
            ifNoneMatch: previousHeaders?.etag ?? '',
            pageSize: pageSize ?? PaginationConfig.itemsPerPage,
            lastShopOrderId: lastShopOrderId ?? 0,
            orderStatus: orderStatus,
          );

        // case ShopOrdersFunction.searchShopOrders:
        //   response = await _shopOrderApi.searchShopOrders(
        //     query: query ?? '',
        //     pageSize: pageSize ?? PaginationConfig.itemsPerPage,
        //   );

        // case ShopOrdersFunction.searchShopOrdersNextPage:
        //   response = await _shopOrderApi.searchShopOrdersNextPage(
        //     query: query ?? '',
        //     pageSize: pageSize ?? PaginationConfig.itemsPerPage,
        //     lastShopOrderId: lastShopOrderId ?? 0,
        //   );
      }

      if (response.statusCode == 304) {
        // _headersCache.deleteAllHeaders();
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
            response.body!.map(ShopOrderDTO.fromJson).toList();
        return RemoteResponse.withNewData(
          convertedBody,
          nextAvailable: headers.nextAvailable ?? true,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }

  Map<String, dynamic> _createBodyRequest({
    int? shopOrderStatusId,
  }) {
    late final bodyRequest = <String, dynamic>{};
    if (shopOrderStatusId != null) {
      bodyRequest['order_status_id'] = shopOrderStatusId;
    }

    return bodyRequest;
  }

  @override
  Future<RemoteResponse<ShopOrderDTO>> updateShopOrder({
    required int adminId,
    required int shopOrderId,
    int? shopOrderStatusId,
  }) async {
    try {
      final bodyRequest = _createBodyRequest(
        shopOrderStatusId: shopOrderStatusId,
      );
      debugPrint('JKL BODY $bodyRequest');
      final response = await _shopOrdersAdminApi.updateShopOrder(
        adminId: adminId.toString(),
        shopOrderId: shopOrderId.toString(),
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

      final shopOrderDTO = ShopOrderDTO.fromJson(body);

      return RemoteResponse.withNewData(shopOrderDTO, nextAvailable: false);
    } on SocketException {
      return const RemoteResponse.noConnection();
    }
  }
}
