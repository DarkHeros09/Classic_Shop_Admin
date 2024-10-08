import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_dto.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_extensions.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_local_service.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_remote_service.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order_failure.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/helpers/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ShopOrderRepository {
  ShopOrderRepository(
    this._remoteService,
    this._localService,
    this._headersCache,
  );

  final ShopOrderRemoteService _remoteService;
  final ShopOrderLocalService _localService;
  final ResponseHeadersCache _headersCache;

  Map<String, String> _createQueryParams({
    int? pageSize = PaginationConfig.itemsPerPage,
    ShopOrderStatus? orderStatus,
    int? lastShopOrderId,
  }) {
    final queryParams = {
      'limit': pageSize.toString(),
    };
    if (orderStatus != null) {
      queryParams['order_status'] = switch (orderStatus) {
        ShopOrderStatus.processing => 'تحت الإجراء',
        ShopOrderStatus.delivered => 'تم التسليم',
        ShopOrderStatus.cancelled => 'ملغي',
      };
    }
    if (lastShopOrderId != null) {
      queryParams['cursor'] = lastShopOrderId.toString();
    }
    return queryParams;
  }

  Future<Either<ShopOrderFailure, Fresh<List<ShopOrder>>>> getShopOrders(
    int page, {
    required int adminId,
    ShopOrderStatus? orderStatus,
    int? pageSize,
  }) async {
    try {
      final queryParams = _createQueryParams(orderStatus: orderStatus);
      final requestUri = Uri.http(
        Env.httpAddress,
        '/admin/v1/admins/$adminId/shop-orders-v2',
        queryParams,
      );
      final remotePageShopOrders = await _remoteService.fetchShopOrders(
        pageSize: pageSize,
        adminId: adminId,
        requestUri: requestUri,
        shopOrdersFunction: ShopOrdersFunction.getShopOrders,
        orderStatus: queryParams['order_status'],
      );
      return await _rightRemotePageShopOrders(
        remotePageShopOrders,
        page,
        requestUri,
      );
    } on RestApiException catch (e) {
      return left(ShopOrderFailure.api(e.errorCode));
    }
  }

  Future<Either<ShopOrderFailure, Fresh<List<ShopOrder>>>>
      getShopOrdersNextPage(
    int lastShopOrderId,
    int page, {
    required int adminId,
    ShopOrderStatus? orderStatus,
    int? pageSize,
  }) async {
    try {
      final queryParams = _createQueryParams(
        orderStatus: orderStatus,
        lastShopOrderId: lastShopOrderId,
      );
      final requestUri = Uri.http(
        Env.httpAddress,
        '/admin/v1/admins/$adminId/shop-orders-next-page',
        queryParams,
      );
      final remotePageShopOrders = await _remoteService.fetchShopOrders(
        pageSize: pageSize,
        adminId: adminId,
        requestUri: requestUri,
        shopOrdersFunction: ShopOrdersFunction.getShopOrdersNextPage,
        orderStatus: queryParams['order_status'],
        lastShopOrderId: lastShopOrderId,
      );
      return _rightRemotePageShopOrders(remotePageShopOrders, page, requestUri);
    } on RestApiException catch (e) {
      return left(ShopOrderFailure.api(e.errorCode));
    }
  }

  Future<Either<ShopOrderFailure, Fresh<List<ShopOrder>>>>
      _rightRemotePageShopOrders(
    RemoteResponse<List<ShopOrderDTO>> remotePageShopOrders,
    int page,
    Uri requestUri,
  ) async {
    return right(
      await remotePageShopOrders.when(
        noConnection: (nextAvailable) async {
          final localData = await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain());
          return Fresh.no(
            localData,
            isNextPageAvailable: nextAvailable,
          );
        },
        noContent: () async {
          await _localService.deleteAllProducts(requestUri.toString());
          return Fresh.no([], isNextPageAvailable: false);
        },
        notModified: (nextAvailable) async {
          // await _localService.deleteAllProducts(requestUri.toString());
          // await _headersCache.deleteAllHeaders();
          final localData = await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain());

          if (localData.isEmpty) {
            await _headersCache.deleteHeaders(requestUri);
          }
          debugPrint('nextPage1 $nextAvailable');
          return Fresh.yes(
            localData,
            isNextPageAvailable: nextAvailable,
          );
        },
        withNewData: (data, nextAvailable) async {
          await _localService.deletePage(page, requestUri.toString());
          await _localService.upsertPage(data, page, requestUri.toString());
          return Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: nextAvailable,
          );
        },
      ),
    );
  }

  Future<Either<ShopOrderFailure, Unit>> updateShopOrder({
    required int adminId,
    required int shopOrderId,
    int? shopOrderStatusId,
  }) async {
    try {
      final shopOrder = await _remoteService.updateShopOrder(
        adminId: adminId,
        shopOrderId: shopOrderId,
        shopOrderStatusId: shopOrderStatusId,
      );

      return await shopOrder.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ShopOrderFailure.server('Could not create shopOrder')),
      );
    } on RestApiException catch (e) {
      return left(ShopOrderFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ShopOrderFailure.server('Could not create shopOrder'));
    }
  }
}
