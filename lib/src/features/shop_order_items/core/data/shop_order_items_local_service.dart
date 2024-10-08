import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IShopOrderItemsLocalService {
  Future<List<ShopOrderItemsDTO>> fetchShopOrderItems(
    int userId,
    int orderId,
    String trackNumber,
  );

  Future<void> setShopOrderItems(List<ShopOrderItemsDTO> shopOrderItemsDTOs);

  Future<void> updateShopOrderItems(ShopOrderItemsDTO dto);

  Future<void> deleteShopOrderItem(int id);

  Future<void> deleteAllShopOrderItems();
}

class ShopOrderItemsLocalService implements IShopOrderItemsLocalService {
  ShopOrderItemsLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('shop_order_items');

  @override
  Future<List<ShopOrderItemsDTO>> fetchShopOrderItems(
    int userId,
    int orderId,
    String trackNumber,
  ) async {
    final records = await _store.find(
      _sembastDatabase.instance,
      finder: Finder(
        filter: Filter.or([
          Filter.equals('user_id', orderId),
          Filter.equals('order_id', orderId),
          Filter.equals('track_number', trackNumber),
        ]),
      ),
    );
    debugPrint('PPOP rec $records');
    return records.map((e) => ShopOrderItemsDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setShopOrderItems(List<ShopOrderItemsDTO> dtos) {
    return _store.records(dtos.map((e) => e.id)).put(
          _sembastDatabase.instance,
          dtos.map((e) => e.toJson()).toList(),
        );
  }

  @override
  Future<void> updateShopOrderItems(ShopOrderItemsDTO dto) async {
    await _store
        .record(dto.orderId)
        .update(_sembastDatabase.instance, dto.toJson());
  }

  // @override
  // Future<void> deleteShopOrderItemsItem(int productItemId) async {
  //   await _store.record(productItemId).delete(_sembastDatabase.instance);
  // }

  @override
  Future<void> deleteAllShopOrderItems() async {
    await _store.drop(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteShopOrderItem(int id) async {
    await _store.delete(
      _sembastDatabase.instance,
      finder: Finder(
        filter: Filter.or([
          Filter.equals('id', id),
        ]),
      ),
    );
  }
}
