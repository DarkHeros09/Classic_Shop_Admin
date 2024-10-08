import 'package:classic_shop_admin/src/features/order_status/application/order_status_notifier.dart';
import 'package:classic_shop_admin/src/features/order_status/domain/order_status.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/application/shop_order_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/application/shop_order_items_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ShopOrderItemsPage extends StatefulHookConsumerWidget {
  const ShopOrderItemsPage({
    required this.shopOrder,
    super.key,
  });

  final ShopOrder shopOrder;

  @override
  ConsumerState<ShopOrderItemsPage> createState() => _ShopOrderItemsPageState();
}

class _ShopOrderItemsPageState extends ConsumerState<ShopOrderItemsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(shopOrderItemsNotifierProvider.notifier).getShopOrderItems(
              userId: widget.shopOrder.userId,
              orderId: widget.shopOrder.id,
              trackNumber: widget.shopOrder.trackNumber,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final state = ref.watch(shopOrderItemsNotifierProvider);
    final itemCount = ref.watch(
      shopOrderItemsNotifierProvider.select(
        (value) => value.maybeMap(
          loadSuccess: (value) => value.shopOrderItems.entity.length,
          orElse: () => 0,
        ),
      ),
    );
    final readOnly = useState(true);
    final enabled = useState(false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Order Summary'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                readOnly.value = !readOnly.value;
                enabled.value = !enabled.value;
              },
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedEdit02,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: state.map(
          initial: (value) => const SizedBox.shrink(),
          loadInProgress: (value) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
                OrderSummary(
                  theme: theme,
                  shopOrder: widget.shopOrder,
                  readOnly: readOnly,
                  enabled: enabled,
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 8)),
                SuperSliverList.separated(
                  itemCount: itemCount,
                  itemBuilder: (context, index) => ShadCard(
                    trailing: IconButton(
                      onPressed: enabled.value
                          ? () async => ref
                              .read(shopOrderItemsNotifierProvider.notifier)
                              .deleteShopOrderItem(
                                _.shopOrderItems.entity[index].id,
                              )
                          : null,
                      icon: const Icon(Icons.delete),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_.shopOrderItems.entity[index].productName),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                    description: Row(
                      children: [
                        ExtendedImage.network(
                          height: 150,
                          width: 150,
                          _.shopOrderItems.entity[index].productImage,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color: ${_.shopOrderItems.entity[index].productColor}',
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Size: ${_.shopOrderItems.entity[index].productSize}',
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Price: ${_.shopOrderItems.entity[index].price}',
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Quantity: ${_.shopOrderItems.entity[index].quantity}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              ],
            ),
          ),
          loadFailure: (value) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

// final orderStatus = {
//   for (final status in ShopOrderStatus.values)
//     status.index: switch (status) {
//       ShopOrderStatus.processing => 'تحت الإجراء',
//       ShopOrderStatus.cancelled => 'ملغي',
//       ShopOrderStatus.delivered => 'تم التسليم',
//     },
// };

class OrderSummary extends StatefulHookConsumerWidget {
  const OrderSummary({
    required this.theme,
    required this.shopOrder,
    required this.readOnly,
    required this.enabled,
    super.key,
  });

  final ShadThemeData theme;
  final ShopOrder shopOrder;
  final ValueNotifier<bool> readOnly;
  final ValueNotifier<bool> enabled;

  @override
  ConsumerState<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends ConsumerState<OrderSummary> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderStatusNotifierProvider.notifier).getOrderStatuss();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(shopOrderNotifierProvider.select(
    //   (value) => value.shopOrders.entity.firstWhere(
    //     (element) => element.id == shopOrder.id,
    //   ),
    // ));
    final itemCount = ref.watch(
      shopOrderItemsNotifierProvider.select(
        (value) => value.shopOrderItems.entity.length,
      ),
    );
    final orderStatus = ref.watch(
      orderStatusNotifierProvider.select(
        (value) => value.maybeMap(
          loadSuccess: (value) => value.orderStatus.entity,
          orElse: () => <OrderStatus>[],
        ),
      ),
    );
    debugPrint('asqw $orderStatus');
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Username:',
                style: widget.theme.textTheme.h4,
              ),
              Text(
                widget.shopOrder.username ?? '',
                style: widget.theme.textTheme.h4,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Items:',
                style: widget.theme.textTheme.h4,
              ),
              Text(
                itemCount.toString(),
                style: widget.theme.textTheme.h4,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status:',
                style: widget.theme.textTheme.h4,
              ),
              ShadSelect<String>(
                initialValue: widget.shopOrder.status,
                enabled: widget.enabled.value,
                placeholder: const Text('Select a status'),
                onChanged: (value) {
                  final selectedId = orderStatus
                      .where(
                        (e) => e.status == value,
                      )
                      .first
                      .id;
                  debugPrint('selecredId $selectedId');

                  ref.read(shopOrderNotifierProvider.notifier).updateShopOrder(
                        id: widget.shopOrder.id,
                        orderStatusId: selectedId,
                        status: value,
                      );
                },
                options: [
                  Text(
                    'OrderStatus',
                    style: widget.theme.textTheme.muted.copyWith(
                      fontWeight: FontWeight.w600,
                      color: widget.theme.colorScheme.popoverForeground,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  ...orderStatus.map(
                    (e) => ShadOption(
                      value: e.status,
                      child: Text(e.status),
                    ),
                  ),
                ],
                selectedOptionBuilder: (context, value) {
                  return Text(value);
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
