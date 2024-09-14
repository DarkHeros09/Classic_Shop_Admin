import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand/core/data/brand_repository.dart';
import 'package:classic_shop_admin/src/features/brand/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_update_delete_notifier.g.dart';

@riverpod
class BrandUpdateDeleteNotifier extends _$BrandUpdateDeleteNotifier {
  late final BrandRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(brandRepositoryProvider);
  }

  Future<void> updateBrand({
    required int brandId,
    String? brandName,
    String? brandImage,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateBrand(
        adminId: admin.id,
        brandId: brandId,
        brandName: brandName,
        brandImage: brandImage,
      ),
    );
  }
}
