import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_repository.dart';
import 'package:classic_shop_admin/src/features/product/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_update_delete_notifier.g.dart';

@riverpod
class ProductUpdateDeleteNotifier extends _$ProductUpdateDeleteNotifier {
  late final ProductRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(productRepositoryProvider);
  }

  Future<void> updateProduct({
    required int productId,
    int? categoryId,
    int? brandId,
    String? name,
    String? description,
    bool? active,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateProduct(
        adminId: admin.id,
        productId: productId,
        categoryId: categoryId,
        brandId: brandId,
        name: name,
        description: description,
        active: active,
      ),
    );
  }
}
