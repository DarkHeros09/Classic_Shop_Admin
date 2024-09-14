import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_repository.dart';
import 'package:classic_shop_admin/src/features/product/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_product_notifier.g.dart';

@riverpod
class AddProductNotifier extends _$AddProductNotifier {
  late final ProductRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(productRepositoryProvider);
  }

  Future<void> createProduct({
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool isActive,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createProduct(
        adminId: admin.id,
        name: name,
        description: description,
        categoryId: categoryId,
        brandId: brandId,
        isActive: isActive,
      ),
    );
  }
}
