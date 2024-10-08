import 'dart:io';

import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_api.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_dto.dart';
import 'package:flutter/foundation.dart';

abstract class IShopOrderItemsRemoteService {
  Future<RemoteResponse<List<ShopOrderItemsDTO?>>> fetchShopOrderItems({
    required int adminId,
    required int userId,
    required int orderId,
  });
  Future<RemoteResponse<void>> deleteShopOrderItems({
    required int adminId,
    required int id,
  });
}

class ShopOrderItemsRemoteService implements IShopOrderItemsRemoteService {
  ShopOrderItemsRemoteService(
    this._shopOrderItemsAdminApi,
    this._headersCache,
  );

  final ShopOrderItemsAdminApi _shopOrderItemsAdminApi;
  final ResponseHeadersCache _headersCache;

  @override
  Future<RemoteResponse<List<ShopOrderItemsDTO>>> fetchShopOrderItems({
    required int adminId,
    required int userId,
    required int orderId,
  }) async {
    final requestUri = Uri.http(
      Env.httpAddress,
      '/admin/v1/admins/$userId/shop-order-items/$orderId',
    );
    final previousHeaders = await _headersCache.getHeaders(requestUri);
    try {
      final response = await _shopOrderItemsAdminApi.listShopOrderItems(
        ifNoneMatch: previousHeaders?.etag ?? '',
        adminId: adminId.toString(),
        orderId: orderId.toString(),
        data: {
          'user_id': userId,
        },
      );
      debugPrint('PPPOP ${response.statusCode}');

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
          convertedBody?.map(ShopOrderItemsDTO.fromJson).toList() ?? [],
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
  Future<RemoteResponse<void>> deleteShopOrderItems({
    required int adminId,
    required int id,
  }) async {
    try {
      final response = await _shopOrderItemsAdminApi.deleteShopOrderItem(
        adminId: adminId.toString(),
        id: id.toString(),
      );
      if (response.isSuccessful) {
        return const RemoteResponse.withNewData(null, nextAvailable: false);
      }

      return const RemoteResponse.noConnection();
    } catch (e) {
      return const RemoteResponse.noConnection();
    }
  }
}
