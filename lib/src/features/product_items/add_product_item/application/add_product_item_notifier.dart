import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/data/add_product_item_repository.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_product_item_notifier.g.dart';

@riverpod
class AddProductItemNotifier extends _$AddProductItemNotifier {
  late final AddProductItemRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(addProductItemRepositoryProvider);
  }

  Future<void> createProductItem({
    required int productId,
    required int sizeId,
    required int imageId,
    required int colorId,
    required int productSku,
    required int qtyInStock,
    required String price,
    required bool active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createProductItem(
        adminId: admin.id,
        productId: productId,
        sizeId: sizeId,
        imageId: imageId,
        colorId: colorId,
        productSku: productSku,
        qtyInStock: qtyInStock,
        price: price,
        active: active,
      ),
    );
  }
}
