import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/application/paginated_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_api.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/application/list_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_local_service.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_repository.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_product_items/application/searched_product_items_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_product_items/data/searched_product_items_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_product_items/data/searched_product_items_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
ListProductsLocalService listProductsLocalService(
  ListProductsLocalServiceRef ref,
) {
  return ListProductsLocalService(ref.watch(sembastProvider));
}

@Riverpod(keepAlive: true)
ProductItemApi productItemApi(ProductItemApiRef ref) {
  return ProductItemApi.create();
}

@Riverpod(keepAlive: true)
ProductItemAdminApi productItemAdminApi(ProductItemAdminApiRef ref) {
  return ProductItemAdminApi.create(ref);
}

@Riverpod(keepAlive: true)
ListProductsRemoteService listProductsRemoteService(
  ListProductsRemoteServiceRef ref,
) {
  return ListProductsRemoteService(
    ref.watch(productItemApiProvider),
    ref.watch(productItemAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
ListProductsRepository listProductsRepository(ListProductsRepositoryRef ref) {
  return ListProductsRepository(
    ref.watch(listProductsRemoteServiceProvider),
    ref.watch(listProductsLocalServiceProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
SearchedProductItemsRemoteService searchedProductItemsRemoteService(
  SearchedProductItemsRemoteServiceRef ref,
) {
  return SearchedProductItemsRemoteService(
    ref.watch(productItemApiProvider),
    ref.watch(productItemAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
SearchedProductItemsRepository searchedProductItemsRepository(
  SearchedProductItemsRepositoryRef ref,
) {
  return SearchedProductItemsRepository(
    ref.watch(searchedProductItemsRemoteServiceProvider),
  );
}

final listProductsNotifierProvider =
    NotifierProvider.autoDispose<ListProductsNotifier, PaginatedProductsState>(
  ListProductsNotifier.new,
);

final searchedProductsNotifierProvider = NotifierProvider.autoDispose<
    SearchedProductItemsNotifier, PaginatedProductsState>(
  SearchedProductItemsNotifier.new,
);
