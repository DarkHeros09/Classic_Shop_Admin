import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_repository.dart';
import 'package:classic_shop_admin/src/features/category/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_update_delete_notifier.g.dart';

@riverpod
class CategoryUpdateDeleteNotifier extends _$CategoryUpdateDeleteNotifier {
  late final CategoryRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(categoryRepositoryProvider);
  }

  Future<void> updateCategory({
    required int categoryId,
    String? categoryName,
    String? categoryImage,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateCategory(
        adminId: admin.id,
        categoryId: categoryId,
        categoryName: categoryName,
        categoryImage: categoryImage,
      ),
    );
  }
}
