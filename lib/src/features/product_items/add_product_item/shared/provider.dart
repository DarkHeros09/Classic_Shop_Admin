import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/data/add_product_item_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/data/add_product_item_repository.dart';
import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
AddProductItemRemoteService addProductItemRemoteService(
  AddProductItemRemoteServiceRef ref,
) {
  return AddProductItemRemoteService(
    ref.watch(productItemApiProvider),
    ref.watch(productItemAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}

@Riverpod(keepAlive: true)
AddProductItemRepository addProductItemRepository(
  AddProductItemRepositoryRef ref,
) {
  return AddProductItemRepository(
    // ref.watch(addProductItemLocalServiceProvider),
    ref.watch(addProductItemRemoteServiceProvider),
  );
}
