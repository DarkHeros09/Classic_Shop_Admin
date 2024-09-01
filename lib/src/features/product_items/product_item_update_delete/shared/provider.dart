import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/data/product_item_update_delete_remote_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
ProductItemUpdateDeleteRemoteService productItemUpdateDeleteRemoteService(
  ProductItemUpdateDeleteRemoteServiceRef ref,
) {
  return ProductItemUpdateDeleteRemoteService(
    ref.watch(productItemApiProvider),
    ref.watch(productItemAdminApiProvider),
    ref.watch(responseHeaderCacheProvider),
  );
}
