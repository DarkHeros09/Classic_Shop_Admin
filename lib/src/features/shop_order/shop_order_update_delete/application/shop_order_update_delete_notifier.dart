import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/data/shop_order_repository.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_order_update_delete_notifier.g.dart';

@riverpod
class ShopOrderUpdateDeleteNotifier extends _$ShopOrderUpdateDeleteNotifier {
  late final ShopOrderRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(shopOrderRepositoryProvider);
  }

  Future<void> updateShopOrder({
    required int shopOrderId,
    int? shopOrderStatusId,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updateShopOrder(
        adminId: admin.id,
        shopOrderId: shopOrderId,
        shopOrderStatusId: shopOrderStatusId,
      ),
    );
  }
}
