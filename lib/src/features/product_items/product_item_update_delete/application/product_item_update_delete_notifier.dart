import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/data/product_item_update_delete_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_item_update_delete_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProductItemUpdateDeleteNotifier
    extends _$ProductItemUpdateDeleteNotifier {
  late final ProductItemUpdateDeleteRemoteService _remoteService;
  @override
  FutureOr<void> build() {
    _remoteService = ref.watch(productItemUpdateDeleteRemoteServiceProvider);
  }

  Future<void> updateProductItem({
    required int productItemId,
    required int productId,
    int? productSku,
    int? qtyInStock,
    String? price,
    bool? active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _remoteService.updateProductItem(
        adminId: admin.id,
        productItemId: productItemId,
        productId: productId,
        productSku: productSku,
        qtyInStock: qtyInStock,
        price: price,
        active: active,
      ),
    );
  }
}
