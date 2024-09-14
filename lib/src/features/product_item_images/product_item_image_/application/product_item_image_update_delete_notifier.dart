import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/data/image_repository.dart';
import 'package:classic_shop_admin/src/features/image/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_item_image_update_delete_notifier.g.dart';

@riverpod
class ProductItemImageUpdateDeleteNotifier
    extends _$ProductItemImageUpdateDeleteNotifier {
  late final ImageRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(imageRepositoryProvider);
  }

  Future<void> updateProductImage({
    required int productImageId,
    String? productImage1,
    String? productImage2,
    String? productImage3,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateProductImage(
        adminId: admin.id,
        productItemImageId: productImageId,
        productImage1: productImage1,
        productImage2: productImage2,
        productImage3: productImage3,
      ),
    );
  }
}
