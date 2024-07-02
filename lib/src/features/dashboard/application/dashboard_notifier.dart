import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_repository.dart';
import 'package:classic_shop_admin/src/features/dashboard/domain/dashboard.dart';
import 'package:classic_shop_admin/src/features/dashboard/domain/dashboard_failure.dart';
import 'package:classic_shop_admin/src/features/dashboard/shared/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_notifier.freezed.dart';
part 'dashboard_notifier.g.dart';

@freezed
class DashboardState with _$DashboardState {
  const DashboardState._();
  const factory DashboardState.initial(
    Fresh<Dashboard> dashboard,
  ) = _Initial;
  const factory DashboardState.loadInProgress(
    Fresh<Dashboard> dashboard,
  ) = _LoadInProgress;
  const factory DashboardState.loadSuccess(
    Fresh<Dashboard> dashboard, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory DashboardState.loadFailure(
    Fresh<Dashboard> dashboard,
    DashboardFailure failure,
  ) = _LoadFailure;
}

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  late final DashboardRepository _repository;
  @override
  DashboardState build() {
    _repository = ref.watch(dashboardRepositoryProvider);
    return state = DashboardState.initial(
      Fresh.no(
        const Dashboard(
          activeProducts: 0,
          totalProducts: 0,
          activeUsers: 0,
          totalUsers: 0,
          activeOrders: 0,
          totalOrders: 0,
          dailyRevenue: '0',
          totalRevenue: 0,
        ),
      ),
    );
  }

  Future<void> getDashboardInfo() async {
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrDashboard = await _repository.fetchDashboard(admin.id);
    state = failureOrDashboard.fold(
      (l) => DashboardState.loadFailure(state.dashboard, l),
      (r) => DashboardState.loadSuccess(r, isNextPageAvailable: false),
    );
  }
}
