import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_repository.dart';
import 'package:classic_shop_admin/src/features/color/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_update_delete_notifier.g.dart';

@riverpod
class ColorUpdateDeleteNotifier extends _$ColorUpdateDeleteNotifier {
  late final ColorRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(colorRepositoryProvider);
  }

  Future<void> updateColor({
    required int productColorId,
    required String color,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateColor(
        adminId: admin.id,
        productColorId: productColorId,
        color: color,
      ),
    );
  }
}
