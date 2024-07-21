import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/dashboard/application/dashboard_products_notifier.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_api.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_local_service.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_remote_service.dart';
import 'package:classic_shop_admin/src/features/dashboard/data/dashboard_repository.dart';
import 'package:classic_shop_admin/src/features/product_items/core/application/paginated_products_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
int productCardIndex(ProductCardIndexRef ref) => throw UnimplementedError();

final dashboardProductsNotifierProvider = NotifierProvider.autoDispose<
    DashboardProductsNotifier, PaginatedProductsState>(
  DashboardProductsNotifier.new,
);

@riverpod
DashboardApi dashboardApi(DashboardApiRef ref) {
  return DashboardApi.create(ref);
}

@riverpod
DashboardRemoteService dashboardRemoteService(DashboardRemoteServiceRef ref) {
  return DashboardRemoteService(
    ref.watch(dashboardApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@riverpod
DashboardLocalService dashboardLocalService(DashboardLocalServiceRef ref) {
  return DashboardLocalService(ref.watch(sembastProvider));
}

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepository(
    ref.watch(dashboardLocalServiceProvider),
    ref.watch(dashboardRemoteServiceProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}
