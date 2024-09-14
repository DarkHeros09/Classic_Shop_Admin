import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/color/core/data/color_repository.dart';
import 'package:classic_shop_admin/src/features/color/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_color_notifier.g.dart';

@riverpod
class AddColorNotifier extends _$AddColorNotifier {
  late final ColorRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(colorRepositoryProvider);
  }

  Future<void> createColor({
    required String colorValue,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createColor(
        adminId: admin.id,
        colorValue: colorValue,
      ),
    );
  }
}
