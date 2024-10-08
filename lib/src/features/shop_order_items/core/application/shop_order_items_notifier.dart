import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_repository.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/domain/shop_order_items.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/domain/shop_order_items_failure.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/shared/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_order_items_notifier.freezed.dart';
part 'shop_order_items_notifier.g.dart';

@freezed
class ShopOrderItemsState with _$ShopOrderItemsState {
  const ShopOrderItemsState._();
  const factory ShopOrderItemsState.initial(
    Fresh<List<ShopOrderItems>> shopOrderItems,
  ) = _Initial;
  const factory ShopOrderItemsState.loadInProgress(
    Fresh<List<ShopOrderItems>> shopOrderItems,
  ) = _LoadInProgress;
  const factory ShopOrderItemsState.loadSuccess(
    Fresh<List<ShopOrderItems>> shopOrderItems,
  ) = _LoadSuccess;
  const factory ShopOrderItemsState.loadFailure(
    Fresh<List<ShopOrderItems>> shopOrderItems,
    ShopOrderItemsFailure failure,
  ) = _LoadFailure;
}

@riverpod
class ShopOrderItemsNotifier extends _$ShopOrderItemsNotifier {
  late final ShopOrderItemsRepository _repository;
  @override
  ShopOrderItemsState build() {
    _repository = ref.watch(shopOrderItemsRepositoryProvider);
    return ShopOrderItemsState.initial(Fresh.yes([]));
  }

  Future<void> getShopOrderItems({
    required int userId,
    required int orderId,
    required String trackNumber,
  }) async {
    // state = ShopOrderItemsState.loadFailure(
    //   state.categories,
    //   const ShopOrderItemsFailure.api(404),
    // );

    state = ShopOrderItemsState.loadInProgress(state.shopOrderItems);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrShopOrderItems = await _repository.fetchShopOrderItems(
      adminId: admin.id,
      userId: userId,
      orderId: orderId,
      trackNumber: trackNumber,
    );
    state = failureOrShopOrderItems.fold(
      (l) => ShopOrderItemsState.loadFailure(state.shopOrderItems, l),
      ShopOrderItemsState.loadSuccess,
    );
  }

  Future<void> deleteShopOrderItem(int id) async {
    state = ShopOrderItemsState.loadInProgress(state.shopOrderItems);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrShopOrderItems =
        await _repository.deleteShopOrderItem(adminId: admin.id, id: id);

    state = failureOrShopOrderItems.fold(
      (l) => ShopOrderItemsState.loadFailure(state.shopOrderItems, l),
      (r) {
        final entity = state.shopOrderItems.entity
          ..removeWhere(
            (element) => element.id == id,
          );
        return ShopOrderItemsState.loadSuccess(Fresh.yes(entity));
      },
    );
  }
}
