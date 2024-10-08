import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_repository.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order_failure.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/helpers/enums.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/shared/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_order_notifier.freezed.dart';
part 'shop_order_notifier.g.dart';

@freezed
class ShopOrderState with _$ShopOrderState {
  const ShopOrderState._();
  const factory ShopOrderState.initial(
    Fresh<List<ShopOrder>> shopOrders,
  ) = _Initial;
  const factory ShopOrderState.loadInProgress(
    Fresh<List<ShopOrder>> shopOrders,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory ShopOrderState.loadSuccess(
    Fresh<List<ShopOrder>> shopOrders, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory ShopOrderState.loadFailure(
    Fresh<List<ShopOrder>> shopOrders,
    ShopOrderFailure failure,
  ) = _LoadFailure;
}

@Riverpod(dependencies: [])
class ShopOrderNotifier extends _$ShopOrderNotifier {
  late final ShopOrderRepository _repository;
  @override
  ShopOrderState build() {
    _repository = ref.watch(shopOrderRepositoryProvider);
    return ShopOrderState.initial(Fresh.yes([]));
  }

  int _page = 1;
  int _lastShopOrderId = 0;

  Future<void> getShopOrdersPage({ShopOrderStatus? orderStatus}) async {
    state = ShopOrderState.loadInProgress(
      Fresh.yes([]),
      PaginationConfig.itemsPerPage,
    );
    _page = 1;
    _lastShopOrderId = 0;
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      state = ShopOrderState.loadFailure(
        state.shopOrders,
        const ShopOrderFailure.server('unauthurized'),
      );
      return;
    }
    final failureOrShopOrders = await _repository.getShopOrders(
      adminId: admin.id,
      _page,
      orderStatus: orderStatus,
      pageSize: PaginationConfig.itemsPerPage,
    );
    state = failureOrShopOrders.fold(
      (l) => ShopOrderState.loadFailure(state.shopOrders, l),
      (r) {
        _page++;
        _lastShopOrderId = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ShopOrderState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.shopOrders.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }

  Future<void> getShopOrdersNextPage({ShopOrderStatus? orderStatus}) async {
    state = ShopOrderState.loadInProgress(
      state.shopOrders,
      PaginationConfig.itemsPerPage,
    );
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      state = ShopOrderState.loadFailure(
        state.shopOrders,
        const ShopOrderFailure.server('unauthurized'),
      );
      return;
    }
    final failureOrShopOrders = await _repository.getShopOrdersNextPage(
      _lastShopOrderId,
      _page,
      adminId: admin.id,
      orderStatus: orderStatus,
      pageSize: PaginationConfig.itemsPerPage,
    );
    state = failureOrShopOrders.fold(
      (l) => ShopOrderState.loadFailure(state.shopOrders, l),
      (r) {
        _page++;
        _lastShopOrderId = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ShopOrderState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.shopOrders.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }

  Future<void> updateShopOrder({
    required int id,
    required int orderStatusId,
    required String status,
  }) async {
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      state = ShopOrderState.loadFailure(
        state.shopOrders,
        const ShopOrderFailure.server('unauthurized'),
      );
      return;
    }

    final failureOrUpdated = await _repository.updateShopOrder(
      adminId: admin.id,
      shopOrderId: id,
      shopOrderStatusId: orderStatusId,
    );

    state = failureOrUpdated.fold(
      (l) => ShopOrderState.loadFailure(
        state.shopOrders,
        const ShopOrderFailure.server('update failed'),
      ),
      (r) => ShopOrderState.loadSuccess(
        Fresh.yes(
          state.shopOrders.entity.map(
            (e) {
              if (e.id == id) {
                debugPrint('condition met');
                return e.copyWith(orderStatusId: orderStatusId);
              }
              return e;
            },
          ).toList(),
        ),
        isNextPageAvailable: false,
      ),
    );

    // state = ShopOrderState.loadSuccess(
    //   Fresh.yes(
    //     state.shopOrders.entity.map(
    //       (e) {
    //         if (e.id == id) {
    //           debugPrint('condition met');
    //           final d =
    //               e.copyWith(status: status, orderStatusId: orderStatusId);
    //           debugPrint('condition met $d');
    //           return d;
    //         }
    //         return e;
    //       },
    //     ).toList(),
    //   ),
    //   isNextPageAvailable: false,
    // );
  }
}
