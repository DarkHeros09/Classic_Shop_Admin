import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_repository.dart';
import 'package:classic_shop_admin/src/features/promotion/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promotion_update_delete_notifier.g.dart';

@riverpod
class PromotionUpdateDeleteNotifier extends _$PromotionUpdateDeleteNotifier {
  late final PromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(promotionRepositoryProvider);
  }

  Future<void> updatePromotion({
    required int promotionId,
    String? name,
    String? description,
    int? discountRate,
    bool? active,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.updatePromotion(
        adminId: admin.id,
        promotionId: promotionId,
        name: name,
        description: description,
        discountRate: discountRate,
        active: active,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }
}
