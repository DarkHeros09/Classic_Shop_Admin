import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/promotion/data/promotion_repository.dart';
import 'package:classic_shop_admin/src/features/promotion/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_promotion_notifier.g.dart';

@riverpod
class AddPromotionNotifier extends _$AddPromotionNotifier {
  late final PromotionRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.watch(promotionRepositoryProvider);
  }

  Future<void> createPromotion({
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    state = const AsyncValue.loading();
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    state = await AsyncValue.guard(
      () => _repository.createPromotion(
        adminId: admin.id,
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
