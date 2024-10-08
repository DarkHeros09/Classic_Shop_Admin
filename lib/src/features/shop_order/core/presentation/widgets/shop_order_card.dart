import 'package:classic_shop_admin/src/features/shop_order/core/domain/shop_order.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OrderCard extends HookConsumerWidget {
  const OrderCard({
    required this.shopOrder,
    super.key,
  });

  final ShopOrder shopOrder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    return InkWell(
      borderRadius: theme.cardTheme.radius ?? theme.radius,
      onTap: () {
        context.goNamed(
          AppRoute.shopOrderItems.name,
          pathParameters: {
            'id': shopOrder.id.toString(),
          },
          extra: shopOrder,
        );
      },
      child: ShadCard(
        columnMainAxisSize: MainAxisSize.max,
        columnMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowMainAxisSize: MainAxisSize.max,
        rowMainAxisAlignment: MainAxisAlignment.start,
        leading: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedDeliveryBox01,
            color: Colors.white,
            size: 18,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order #${shopOrder.trackNumber}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                child: Text(
                  shopOrder.status ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        description: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(shopOrder.username ?? ''),
                ],
              ),
              const Text('Placed on 15/05/2023'),
            ],
          ),
        ),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${shopOrder.orderTotal}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Row(
              children: [
                Text('View Details'),
                Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
