import 'package:classic_shop_admin/src/features/product/core/application/product_notifier.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProductsPage extends StatefulHookConsumerWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);
    final itemCount = ref.watch(
      productNotifierProvider.select(
        (state) => state.map(
          initial: (_) => 0,
          loadInProgress: (_) => _.products.entity.length + _.itemsPerPage,
          loadSuccess: (_) => _.products.entity.length,
          loadFailure: (_) => _.products.entity.length + 1,
        ),
      ),
    );
    ref.listen(productNotifierProvider, (previous, next) {
      next.map(
        initial: (_) => canLoadNextPage = true,
        loadInProgress: (_) => canLoadNextPage = false,
        loadSuccess: (_) {
          if (!_.products.isFresh && !hasAlreadyShownNoConnectionToast) {
            hasAlreadyShownNoConnectionToast = true;
            showNoConnectionToast(
              'لقد فقدت الاتصال بالانترنت, بعض البيانات قد لا تكون حديثة.',
              context,
            );
          }
          canLoadNextPage = _.isNextPageAvailable;
        },
        loadFailure: (_) => canLoadNextPage = false,
      );
    });
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.goNamed(AppRoute.addProduct.name),
      //   tooltip: 'add product',
      //   child: const Icon(Icons.add),
      // ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () => context.goNamed(AppRoute.addProduct.name),
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
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            ref.read(productNotifierProvider).products.entity.clear();
            await ref.read(productNotifierProvider.notifier).getProductsPage();
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;
              final limit =
                  metrics.maxScrollExtent - metrics.viewportDimension / 3;
              final isVertical = metrics.axis == Axis.vertical;
              if (canLoadNextPage && metrics.pixels >= limit && isVertical) {
                canLoadNextPage = false;
                ref
                    .read(productNotifierProvider.notifier)
                    .getProductsNextPage();
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                // CSAppBar(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 8),
                ),
                SuperSliverList.separated(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return state.map(
                      initial: (_) => const SizedBox.shrink(),
                      loadInProgress: (_) =>
                          const Skeleton.leaf(child: ShadCard()),
                      loadSuccess: (_) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () => context.goNamed(
                            AppRoute.productUpdateDelete.name,
                            pathParameters: {
                              'id': _.products.entity[index].id.toString(),
                            },
                            extra: _.products.entity[index],
                          ),
                          child: ShadCard(
                            title: Text(_.products.entity[index].name),
                            backgroundColor: _.products.entity[index].active
                                ? Colors.green[900]
                                : null,
                          ),
                        ),
                      ),
                      loadFailure: (value) => const SizedBox.shrink(),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
