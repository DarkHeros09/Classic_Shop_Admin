import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_api.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_local_service.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_remote_service.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
ShopOrderLocalService shopOrderLocalService(
  ShopOrderLocalServiceRef ref,
) {
  return ShopOrderLocalService(ref.watch(sembastProvider));
}

// @Riverpod(keepAlive: true)
// ShopOrderApi shopOrderApi(ShopOrderApiRef ref) {
//   return ShopOrderApi.create();
// }

@Riverpod(keepAlive: true)
ShopOrdersAdminApi shopOrdersAdminApi(ShopOrdersAdminApiRef ref) {
  return ShopOrdersAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ShopOrderRemoteService shopOrderRemoteService(
  ShopOrderRemoteServiceRef ref,
) {
  return ShopOrderRemoteService(
    // ref.watch(shopOrderApiProvider),
    ref.watch(shopOrdersAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ShopOrderRepository shopOrderRepository(ShopOrderRepositoryRef ref) {
  return ShopOrderRepository(
    ref.watch(shopOrderRemoteServiceProvider),
    ref.watch(shopOrderLocalServiceProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

// @Riverpod(keepAlive: true)
// SearchedShopOrdersRemoteService searchedShopOrdersRemoteService(
//   SearchedShopOrdersRemoteServiceRef ref,
// ) {
//   return SearchedShopOrdersRemoteService(
//     ref.watch(shopOrderApiProvider),
//     ref.watch(shopOrderAdminApiProvider),
//     ref.watch(responseHeaderCacheProvider),
//   );
// }

// @Riverpod(keepAlive: true)
// SearchedShopOrdersRepository searchedShopOrdersRepository(
//   SearchedShopOrdersRepositoryRef ref,
// ) {
//   return SearchedShopOrdersRepository(
//     ref.watch(searchedShopOrdersRemoteServiceProvider),
//   );
// }

// final shopOrderNotifierProvider =
//     NotifierProvider.autoDispose<ShopOrderNotifier, PaginatedShopOrderState>(
//   ShopOrderNotifier.new,
// );

// final searchedShopOrderNotifierProvider = NotifierProvider.autoDispose<
//     SearchedShopOrdersNotifier, PaginatedShopOrderState>(
//   SearchedShopOrdersNotifier.new,
// );
