import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:classic_shop_admin/src/features/image/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_image_notifier.g.dart';

@riverpod
class AddImageNotifier extends _$AddImageNotifier {
  late final ImageRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(imageRepositoryProvider);
  }

  Future<void> createImage({
    required String productImage1,
    required String productImage2,
    required String productImage3,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createImages(
        adminId: admin.id,
        productImage1: productImage1,
        productImage2: productImage2,
        productImage3: productImage3,
      ),
    );
  }
}
