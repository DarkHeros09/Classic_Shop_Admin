import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_extension.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_local_service.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_remote_service.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status_failure.dart';
import 'package:dartz/dartz.dart';

class OrderStatusRepository {
  OrderStatusRepository(
    this._localService,
    this._remoteService,
  );

  final OrderStatusLocalService _localService;
  final OrderStatusRemoteService _remoteService;

  Future<Either<OrderStatusFailure, Fresh<List<OrderStatus>>>>
      fetchOrderStatus({
    required int adminId,
  }) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/admin/v1/admins/$adminId/order-status',
      );
      final orderStatus = await _remoteService.listOrderStatus(
        requestUri: requestUri,
        adminId: adminId,
      );

      return right(
        await orderStatus.when(
          noConnection: (nextAvailable) async => Fresh.no(
            await _localService.listOrderStatus().then((_) => _.toDomain()),
          ),
          noContent: () async {
            await _localService.deleteAllOrderStatus();
            return Fresh.no([], isNextPageAvailable: false);
          },
          notModified: (_) async {
            // await _localService.deleteAllOrderStatus();
            return Fresh.yes(
              await _localService.listOrderStatus().then((_) => _.toDomain()),
            );
          },
          withNewData: (data, _) async {
            await _localService.deleteAllOrderStatus();
            await _localService.setOrderStatus(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(OrderStatusFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<OrderStatusFailure, Unit>> createOrderStatus({
    required int adminId,
    required String status,
  }) async {
    try {
      final orderStatus = await _remoteService.createOrderStatus(
        adminId: adminId,
        status: status,
      );

      return await orderStatus.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const OrderStatusFailure.server('Could not create order status'),
        ),
      );
    } on RestApiException catch (e) {
      return left(OrderStatusFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const OrderStatusFailure.server('Could not create order status'),
      );
    }
  }

  Future<Either<OrderStatusFailure, Unit>> updateOrderStatus({
    required int adminId,
    required int orderStatusId,
    String? status,
  }) async {
    try {
      final orderStatus = await _remoteService.updateOrderStatus(
        adminId: adminId,
        orderStatusId: orderStatusId,
        status: status,
      );

      return await orderStatus.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () => left(
          const OrderStatusFailure.server('Could not create orderStatus'),
        ),
      );
    } on RestApiException catch (e) {
      return left(OrderStatusFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(
        const OrderStatusFailure.server('Could not create orderStatus'),
      );
    }
  }
}
