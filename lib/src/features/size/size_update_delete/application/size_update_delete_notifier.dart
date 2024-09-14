import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/size/core/data/size_repository.dart';
import 'package:classic_shop_admin/src/features/size/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size_update_delete_notifier.g.dart';

@riverpod
class SizeUpdateDeleteNotifier extends _$SizeUpdateDeleteNotifier {
  late final SizeRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(sizeRepositoryProvider);
  }

  Future<void> updateSize({
    required int productSizeId,
    required String size,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateSize(
        adminId: admin.id,
        productSizeId: productSizeId,
        size: size,
      ),
    );
  }
}
