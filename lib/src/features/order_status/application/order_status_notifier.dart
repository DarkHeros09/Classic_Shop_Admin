import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/auth/shared/providers.dart';
import 'package:classic_shop_admin/src/features/order_status/data/order_status_repository.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status_failure.dart';
import 'package:classic_shop_admin/src/features/order_status/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_status_notifier.freezed.dart';
part 'order_status_notifier.g.dart';

@freezed
class OrderStatusState with _$OrderStatusState {
  const OrderStatusState._();
  const factory OrderStatusState.initial(
    Fresh<List<OrderStatus>> orderStatus,
  ) = _Initial;
  const factory OrderStatusState.loadInProgress(
    Fresh<List<OrderStatus>> orderStatus,
  ) = _LoadInProgress;
  const factory OrderStatusState.loadSuccess(
    Fresh<List<OrderStatus>> orderStatus,
  ) = _LoadSuccess;
  const factory OrderStatusState.loadFailure(
    Fresh<List<OrderStatus>> orderStatus,
    OrderStatusFailure failure,
  ) = _LoadFailure;
}

@riverpod
class OrderStatusNotifier extends _$OrderStatusNotifier {
  late final OrderStatusRepository _repository;
  @override
  OrderStatusState build() {
    _repository = ref.watch(orderStatusRepositoryProvider);
    return OrderStatusState.initial(Fresh.yes([]));
    // getOrderStatuss();
    // return state;
  }

  Future<void> getOrderStatuss() async {
    // state = OrderStatusState.loadFailure(
    //   state.categories,
    //   const OrderStatusFailure.api(404),
    // );
    state = OrderStatusState.loadInProgress(state.orderStatus);
    final admin = await ref.read(userStorageProvider).read();
    if (admin == null) {
      return;
    }
    final failureOrCategories =
        await _repository.fetchOrderStatus(adminId: admin.id);
    state = failureOrCategories.fold(
      (l) => OrderStatusState.loadFailure(state.orderStatus, l),
      OrderStatusState.loadSuccess,
    );
  }
}
