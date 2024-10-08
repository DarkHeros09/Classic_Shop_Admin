import 'package:classic_shop_admin/src/features/shop_order_items/core/application/shop_order_items_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/presentation/widgets/shop_order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ShopOrderItemsOrderNumberAndDate extends ConsumerWidget {
  const ShopOrderItemsOrderNumberAndDate({
    required this.orderNumber,
    super.key,
  });

  final int orderNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context);
    final index = ref.watch(shopOrderItemsCardIndexProvider);
    final shopOrderItems = ref.watch(
      shopOrderItemsNotifierProvider.select(
        (value) => value.mapOrNull(
          loadSuccess: (value) => value.shopOrderItems.entity,
        ),
      ),
    );

    debugPrint('ASDF $shopOrderItems');
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            shopOrderItems != null && shopOrderItems.isNotEmpty && index != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'رقم الطلب: $orderNumber',
                        style: appTheme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(
                          shopOrderItems[index].createdAt.toUtc(),
                        ),
                        style: appTheme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xff858080),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
