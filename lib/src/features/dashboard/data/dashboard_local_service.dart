import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IDashboardLocalService {
  Future<DashboardDTO> getDashboard(int adminId);

  Future<void> updateDashboard(DashboardDTO dto, int adminId);
}

class DashboardLocalService implements IDashboardLocalService {
  DashboardLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  // final _store = intMapStoreFactory.store('Dashboard');

  @override
  Future<DashboardDTO> getDashboard(int adminId) async {
    final store = intMapStoreFactory.store('$adminId:adminDashboard');
    final record = await store.record(adminId).get(_sembastDatabase.instance);
    debugPrint('DashboardsRecord: $record');

    if (record != null) {
      debugPrint('DashboardsLO: $record');
      return DashboardDTO.fromJson(record);
    }
    return const DashboardDTO(
      activeProducts: 0,
      totalProducts: 0,
      activeUsers: 0,
      totalUsers: 0,
      activeOrders: 0,
      totalOrders: 0,
      todayRevenue: '0',
      totalRevenue: 0,
    );
  }

  @override
  Future<void> updateDashboard(DashboardDTO dto, int adminId) async {
    final store = intMapStoreFactory.store('$adminId:adminDashboard');
    final saved = await store
        .record(adminId)
        .put(_sembastDatabase.instance, dto.toJson());

    debugPrint('DashboardsSAVED: $saved');
  }

  Future<void> deleteDashboard(int adminId) async {
    debugPrint('ZXZX DELETE CALLED');
    final store = intMapStoreFactory.store('$adminId:adminDashboard');
    await store.delete(
      _sembastDatabase.instance,
    );
  }
}
