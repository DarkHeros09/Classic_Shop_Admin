import 'package:classic_shop_admin/src/features/shop_order_items/core/application/shop_order_items_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/presentation/widgets/shop_order_items_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

final shopOrderItemsCardIndexProvider = Provider<int?>((_) => null);

class ShopOrderItemsList extends ConsumerWidget {
  const ShopOrderItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopOrderItems = ref.watch(
      shopOrderItemsNotifierProvider.select(
        (value) => value.mapOrNull(
          loadSuccess: (value) => value.shopOrderItems.entity,
        ),
      ),
    );
    return SuperSliverList.separated(
      itemCount: shopOrderItems?.length ?? 0,
      itemBuilder: (context, index) => ProviderScope(
        key: UniqueKey(),
        overrides: [shopOrderItemsCardIndexProvider.overrideWithValue(index)],
        child: const ShopOrderItemsCard(),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
