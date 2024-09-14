import 'package:classic_shop_admin/src/features/brand_promotion/core/application/brand_promotions_notifier.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class BrandPromotionsPage extends HookConsumerWidget {
  const BrandPromotionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(brandPromotionsNotifierProvider);
    final itemCount = ref.watch(
      brandPromotionsNotifierProvider.select(
        (value) => value.map(
          initial: (value) => 0,
          loadInProgress: (value) => value.brandPromotions.entity.length,
          loadSuccess: (value) => value.brandPromotions.entity.length,
          loadFailure: (value) => value.brandPromotions.entity.length,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.goNamed(AppRoute.addBrandPromotion.name),
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
        child: SuperListView.separated(
          itemBuilder: (context, index) => state.map(
            initial: (value) => const SizedBox(height: 8),
            loadInProgress: (value) => const Center(
              child: CircularProgressIndicator(),
            ),
            loadSuccess: (value) => InkWell(
              onTap: () => context.goNamed(
                AppRoute.brandPromotionUpdateDelete.name,
                pathParameters: {
                  'id': value.brandPromotions.entity[index].promotionId
                      .toString(),
                  'brandId':
                      value.brandPromotions.entity[index].brandId.toString(),
                },
                extra: value.brandPromotions.entity[index],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                clipBehavior: Clip.hardEdge,
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 128,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF0D0D0D),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x24000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Brand: ${value.brandPromotions.entity[index].brandName}',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Promo: ${value.brandPromotions.entity[index].promotionName}',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ExtendedImage.network(
                        enableLoadState: false,
                        fit: BoxFit.cover,
                        value.brandPromotions.entity[index].brandPromotionImage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            loadFailure: (value) => const SizedBox(height: 8),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: itemCount,
        ),
      ),
    );
  }
}
