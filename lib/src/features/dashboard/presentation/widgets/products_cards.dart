import 'package:classic_shop_admin/src/features/dashboard/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/loading_product_card.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/product_card.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/helpers/riverpod_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsCards extends StatefulHookConsumerWidget {
  const ProductsCards({
    super.key,
  });

  @override
  ConsumerState<ProductsCards> createState() => _ProductsCardsState();
}

class _ProductsCardsState extends ConsumerState<ProductsCards> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        ref.read(dashboardProductsNotifierProvider.notifier).getProductsPage(
              productItemsFunction: ProductItemsFunction.getProducts,
            ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardProductsNotifierProvider);
    final itemCount = ref.watch(dashboardProductsNotifierProvider).map(
          // initial: (_) => 0,
          // loadInProgress: (_) => 6,
          // loadSuccess: (_) =>
          //     _.products.entity.length > 6 ? 6 : _.products.entity.length,
          // loadFailure: (_) => _.products.entity.length + 1,
          initial: (_) => 0,
          loadInProgress: (_) => _.products.entity.length + _.itemsPerPage,
          loadSuccess: (_) => _.products.entity.length,
          loadFailure: (_) => _.products.entity.length + 1,
        );
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      sliver: SliverAlignedGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) => ProviderScope(
          observers: [
            RiverpodObserver(),
          ],
          key: UniqueKey(),
          overrides: [productCardIndexProvider.overrideWithValue(index)],
          child: Center(
            child: state.map(
              initial: (_) => const SizedBox.shrink(),
              loadInProgress: (_) {
                if (index < _.products.entity.length) {
                  return const ProductCard();
                } else {
                  return const LoadingProductCard();
                }
              },
              loadSuccess: (_) => const ProductCard(),
              loadFailure: (_) {
                if (index < _.products.entity.length) {
                  return const ProductCard();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
        itemCount: itemCount,
      ),
    );
  }
}
