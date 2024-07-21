import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/application/paginated_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_api.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/application/list_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_local_service.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_repository.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/application/searched_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/data/searched_products_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/data/searched_products_repository.dart';
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
ListProductsRemoteService listProductsRemoteService(
  ListProductsRemoteServiceRef ref,
) {
  return ListProductsRemoteService(
    ref.watch(productItemApiProvider),
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
SearchedProductsRemoteService searchedProductsRemoteService(
  SearchedProductsRemoteServiceRef ref,
) {
  return SearchedProductsRemoteService(
    ref.watch(productItemApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
SearchedProductsRepository searchedProductsRepository(
  SearchedProductsRepositoryRef ref,
) {
  return SearchedProductsRepository(
    ref.watch(searchedProductsRemoteServiceProvider),
  );
}

final listProductsNotifierProvider =
    NotifierProvider.autoDispose<ListProductsNotifier, PaginatedProductsState>(
  ListProductsNotifier.new,
);

final searchedProductsNotifierProvider = NotifierProvider.autoDispose<
    SearchedProductsNotifier, PaginatedProductsState>(
  SearchedProductsNotifier.new,
);
