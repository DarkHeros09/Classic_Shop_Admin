import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/brand/data/brand_repository.dart';
import 'package:classic_shop_admin/src/features/brand/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_brand_notifier.g.dart';

@riverpod
class AddBrandNotifier extends _$AddBrandNotifier {
  late final BrandRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(brandRepositoryProvider);
  }

  Future<void> createBrand({
    required String brandName,
    required String brandImage,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createBrand(
        adminId: admin.id,
        brandName: brandName,
        brandImage: brandImage,
      ),
    );
  }
}
