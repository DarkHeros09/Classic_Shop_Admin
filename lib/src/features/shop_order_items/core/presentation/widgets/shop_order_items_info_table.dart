import 'package:classic_shop_admin/src/features/shop_order_items/core/application/shop_order_items_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order_items/core/presentation/widgets/shop_order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopOrderItemsInfoTable extends ConsumerWidget {
  const ShopOrderItemsInfoTable({super.key});

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
    final total = index != null
        ? num.tryParse(shopOrderItems?[index].orderTotal ?? '')
            ?.toStringAsFixed(2)
        : '';
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            shopOrderItems != null && shopOrderItems.isNotEmpty && index != null
                ? Table(
                    columnWidths: const {
                      0: FractionColumnWidth(.31),
                      1: FractionColumnWidth(.69),
                    },
                    border: TableBorder.all(
                      style: BorderStyle.none,
                    ),
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'عنوان الشحن:',
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff858080)),
                          ),
                          Text(
                            '${shopOrderItems[index].addressLine}, ${shopOrderItems[index].city}.',
                            style: appTheme.textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'طريقة الدفع:',
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff858080)),
                          ),
                          Text(
                            shopOrderItems[index].paymentType ?? '',
                            style: appTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'الخصم:',
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff858080)),
                          ),
                          Text(
                            '10 د.ل',
                            style: appTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'التوصيل:',
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff858080)),
                          ),
                          Text(
                            '${shopOrderItems[index].deliveryPrice} د.ل',
                            style: appTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'الإجمالي الكلي:',
                            style: appTheme.textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff858080)),
                          ),
                          Row(
                            children: [
                              Text(
                                '$total د.ل',
                                style: appTheme.textTheme.bodySmall,
                              ),
                              const Icon(
                                Icons.price_check,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const TableRow(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
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
