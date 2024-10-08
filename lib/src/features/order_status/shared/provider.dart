import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_api.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_local_service.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_remote_service.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
OrderStatusLocalService orderStatusLocalService(
  OrderStatusLocalServiceRef ref,
) {
  return OrderStatusLocalService(
    ref.watch(sembastProvider),
  );
}

// @Riverpod(keepAlive: true)
// OrderStatusApi orderStatusApi(OrderStatusApiRef ref) {
//   return OrderStatusApi.create();
// }

@Riverpod(keepAlive: true)
OrderStatusAdminApi orderStatusAdminApi(OrderStatusAdminApiRef ref) {
  return OrderStatusAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
OrderStatusRemoteService orderStatusRemoteService(
  OrderStatusRemoteServiceRef ref,
) {
  return OrderStatusRemoteService(
    // ref.watch(orderStatusApiProvider),
    ref.watch(orderStatusAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
OrderStatusRepository orderStatusRepository(OrderStatusRepositoryRef ref) {
  return OrderStatusRepository(
    ref.watch(orderStatusLocalServiceProvider),
    ref.watch(orderStatusRemoteServiceProvider),
  );
}
