import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_local_service.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_remote_service.dart';
import 'package:classic_shop_admin/src/features/dashboard/domain/dashboard.dart';
import 'package:classic_shop_admin/src/features/dashboard/domain/dashboard_failure.dart';
import 'package:dartz/dartz.dart';

class DashboardRepository {
  DashboardRepository(
    this._localService,
    this._remoteService,
    this._headersCache,
  );

  final DashboardLocalService _localService;
  final DashboardRemoteService _remoteService;
  final ResponseHeadersCache _headersCache;

  Future<Either<DashboardFailure, Fresh<Dashboard>>> fetchDashboard(
    int adminId,
  ) async {
    try {
      // final user = await _userStorage.read();

      // if (user != null) {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/usr/v1/users/$adminId/dashboard',
      );
      final dashboard = await _remoteService.fetchDashboard(
        adminId: adminId,
        requestUri: requestUri,
      );

      return right(
        await dashboard.when(
          noConnection: () async => Fresh.no(
            await _localService.getDashboard(adminId).then(
                  (_) => _.toDomain(),
                ),
          ),
          noContent: () async {
            await _localService.deleteDashboard(adminId);
            final localData = await _localService.getDashboard(adminId).then(
                  (_) => _.toDomain(),
                );
            return Fresh.no(
              localData,
              isNextPageAvailable: false,
            );
          },
          notModified: (_) async {
            final localData = await _localService
                .getDashboard(adminId)
                .then((_) => _.toDomain());
            if (localData ==
                const Dashboard(
                  activeProducts: 0,
                  totalProducts: 0,
                  activeUsers: 0,
                  totalUsers: 0,
                  activeOrders: 0,
                  totalOrders: 0,
                  dailyRevenue: '0',
                  totalRevenue: 0,
                )) {
              await _headersCache.deleteHeaders(requestUri);
            }
            return Fresh.yes(
              localData,
            );
          },
          withNewData: (data, _) async {
            await _localService.updateDashboard(data, adminId);
            return Fresh.yes(data.toDomain());
          },
        ),
      );
      // }
    } on RestApiException catch (e) {
      return left(DashboardFailure.api(e.errorCode));
    } on Exception catch (e) {
      return left(DashboardFailure.error(e));
    }
  }
}
