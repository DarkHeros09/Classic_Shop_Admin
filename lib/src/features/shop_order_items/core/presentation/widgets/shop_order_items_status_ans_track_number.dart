import 'package:classic_shop_admin/src/features/shop_order_items/core/application/shop_order_items_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/presentation/widgets/shop_order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopOrderItemsStatusAndTrackNumber extends ConsumerWidget {
  const ShopOrderItemsStatusAndTrackNumber({
    super.key,
  });

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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            shopOrderItems != null && shopOrderItems.isNotEmpty && index != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'رقم التتبع:',
                            style: appTheme.textTheme.bodySmall?.copyWith(
                              color: const Color(0xff858080),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            shopOrderItems[index].trackNumber,
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'الحالة:',
                            style: appTheme.textTheme.bodySmall!.copyWith(
                              color: const Color(0xff858080),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            shopOrderItems[index].status,
                            style: appTheme.textTheme.bodySmall?.copyWith(
                              color: switch (shopOrderItems[index].status) {
                                'تم التسليم' => const Color(0xFF2AA952),
                                'تحت الإجراء' => const Color(0xFFFFA004),
                                'ملغي' => const Color(0xFFDB3022),
                                _ => Colors.black,
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
