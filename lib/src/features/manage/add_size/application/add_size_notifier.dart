import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/size/data/size_repository.dart';
import 'package:classic_shop_admin/src/features/size/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_size_notifier.g.dart';

@riverpod
class AddSizeNotifier extends _$AddSizeNotifier {
  late final SizeRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(sizeRepositoryProvider);
  }

  Future<void> createSize({
    required String sizeValue,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createSize(
        adminId: admin.id,
        sizeValue: sizeValue,
      ),
    );
  }
}
