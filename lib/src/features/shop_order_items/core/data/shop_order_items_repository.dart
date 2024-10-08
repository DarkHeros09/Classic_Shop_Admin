import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_extension.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_local_service.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_remote_service.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/domain/shop_order_items.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/domain/shop_order_items_failure.dart';
import 'package:dartz/dartz.dart';

class ShopOrderItemsRepository {
  ShopOrderItemsRepository(
    this._localService,
    this._remoteService,
  );

  final ShopOrderItemsLocalService _localService;
  final ShopOrderItemsRemoteService _remoteService;

  Future<Either<ShopOrderItemsFailure, Fresh<List<ShopOrderItems>>>>
      fetchShopOrderItems({
    required int adminId,
    required int userId,
    required int orderId,
    required String trackNumber,
  }) async {
    try {
      final shopOrderItems = await _remoteService.fetchShopOrderItems(
        adminId: adminId,
        userId: userId,
        orderId: orderId,
      );

      return right(
        await shopOrderItems.when(
          noConnection: (nextAvailable) async => Fresh.no(
            await _localService
                .fetchShopOrderItems(userId, orderId, trackNumber)
                .then((_) => _.toDomain()),
          ),
          notModified: (_) async {
            return Fresh.yes(
              await _localService
                  .fetchShopOrderItems(userId, orderId, trackNumber)
                  .then(
                    (localData) => localData.toDomain(),
                  ),
            );
          },
          noContent: () async {
            return Fresh.no([], isNextPageAvailable: false);
          },
          withNewData: (data, _) async {
            await _localService.setShopOrderItems(data);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(ShopOrderItemsFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<ShopOrderItemsFailure, Unit>> deleteShopOrderItem({
    required int adminId,
    required int id,
  }) async {
    final response = await _remoteService.deleteShopOrderItems(
      adminId: adminId,
      id: id,
    );

    return response.maybeMap(
      noConnection: (_) => left(const ShopOrderItemsFailure.api(null)),
      orElse: () {
        _localService.deleteShopOrderItem(id);
        return right(unit);
      },
    );
  }
}
