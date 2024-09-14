import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_repository.dart';
import 'package:classic_shop_admin/src/features/category/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_category_notifier.g.dart';

@riverpod
class AddCategoryNotifier extends _$AddCategoryNotifier {
  late final CategoryRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(categoryRepositoryProvider);
  }

  Future<void> createCategory({
    required int? parentCategoryId,
    required String categoryName,
    required String categoryImage,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createCategory(
        adminId: admin.id,
        parentCategoryId: parentCategoryId,
        categoryName: categoryName,
        categoryImage: categoryImage,
      ),
    );
  }
}
