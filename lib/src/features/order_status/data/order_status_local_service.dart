import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IOrderStatusLocalService {
  Future<List<OrderStatusDTO>> listOrderStatus();

  Future<void> setOrderStatus(List<OrderStatusDTO> shopOrderItemsDTOs);

  Future<void> updateOrderStatus(OrderStatusDTO dto);

  Future<void> deleteOrderStatus(int id);

  Future<void> deleteAllOrderStatus();
}

class OrderStatusLocalService implements IOrderStatusLocalService {
  OrderStatusLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('order_status');

  @override
  Future<List<OrderStatusDTO>> listOrderStatus() async {
    final records = await _store.find(
      _sembastDatabase.instance,
      // finder: Finder(
      //   filter: Filter.or([
      //     Filter.equals('id', id),
      //   ]),
      // ),
    );
    debugPrint('PPOP stat $records');
    return records.map((e) => OrderStatusDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setOrderStatus(List<OrderStatusDTO> dtos) async {
    final d = await _store.records(dtos.map((e) => e.id)).put(
          _sembastDatabase.instance,
          dtos.map((e) => e.toJson()).toList(),
        );

    debugPrint('aszx $d');
  }

  @override
  Future<void> updateOrderStatus(OrderStatusDTO dto) async {
    await _store.record(dto.id).update(_sembastDatabase.instance, dto.toJson());
  }

  // @override
  // Future<void> deleteOrderStatusItem(int productItemId) async {
  //   await _store.record(productItemId).delete(_sembastDatabase.instance);
  // }

  @override
  Future<void> deleteAllOrderStatus() async {
    await _store.drop(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteOrderStatus(int id) async {
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
