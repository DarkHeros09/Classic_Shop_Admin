import 'package:classic_shop_admin/src/features/promotion/core/application/promotion_notifier.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class PromotionsPage extends HookConsumerWidget {
  const PromotionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(promotionNotifierProvider);
    final itemCount = ref.watch(
      promotionNotifierProvider.select(
        (value) => value.map(
          initial: (value) => 0,
          loadInProgress: (value) => value.promotions.entity.length + 10,
          loadSuccess: (value) => value.promotions.entity.length,
          loadFailure: (value) => 0,
        ),
      ),
    );
    debugPrint('SC rebuilt');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.goNamed(AppRoute.addPromotion.name),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SuperSliverList.separated(
              itemBuilder: (context, index) => state.map(
                initial: (_) => const SizedBox.shrink(),
                loadInProgress: (_) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Skeletonizer.zone(
                    child: ShadCard(
                      title: Bone.text(
                        words: 1,
                      ),
                    ),
                  ),
                ),
                loadSuccess: (_) => index != itemCount
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () => context.goNamed(
                            AppRoute.promotionUpdateDelete.name,
                            pathParameters: {
                              'id': _.promotions.entity[index].id.toString(),
                            },
                            extra: _.promotions.entity[index],
                          ),
                          child: ShadCard(
                            leading: _.promotions.entity[index].active
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                            footer: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Text(
                                    _.promotions.entity[index].startDate
                                        .toString(),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _.promotions.entity[index].endDate
                                        .toString(),
                                  ),
                                ),
                              ],
                            ),
                            title: Text(_.promotions.entity[index].name),
                            description:
                                Text(_.promotions.entity[index].description),
                            trailing: Text(
                              _.promotions.entity[index].discountRate
                                  .toString(),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(height: 8),
                loadFailure: (value) => const SizedBox.shrink(),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: itemCount + 1,
            ),
          ],
        ),
      ),
    );
  }
}
