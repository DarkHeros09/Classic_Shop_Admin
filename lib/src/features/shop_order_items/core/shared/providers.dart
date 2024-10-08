import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_api.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_local_service.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_remote_service.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/data/shop_order_items_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
ShopOrderItemsLocalService shopOrderItemsLocalService(
  ShopOrderItemsLocalServiceRef ref,
) {
  return ShopOrderItemsLocalService(ref.watch(sembastProvider));
}

// @Riverpod(keepAlive: true)
// ShopOrderItemsApi shopOrderItemsApi(ShopOrderItemsApiRef ref) {
//   return ShopOrderItemsApi.create();
// }

@Riverpod(keepAlive: true)
ShopOrderItemsAdminApi shopOrderItemsAdminApi(ShopOrderItemsAdminApiRef ref) {
  return ShopOrderItemsAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ShopOrderItemsRemoteService shopOrderItemsRemoteService(
  ShopOrderItemsRemoteServiceRef ref,
) {
  return ShopOrderItemsRemoteService(
    // ref.watch(shopOrderItemsApiProvider),
    ref.watch(shopOrderItemsAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ShopOrderItemsRepository shopOrderItemsRepository(
  ShopOrderItemsRepositoryRef ref,
) {
  return ShopOrderItemsRepository(
    ref.watch(shopOrderItemsLocalServiceProvider),
    ref.watch(shopOrderItemsRemoteServiceProvider),
  );
}
