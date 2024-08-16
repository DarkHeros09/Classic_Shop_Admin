import 'package:classic_shop_admin/src/features/dashboard/presentation/widgets/products_cards.dart';
import 'package:classic_shop_admin/src/features/dashboard/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/cs_app_bar.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    ref.listen(dashboardProductsNotifierProvider, (previous, next) {
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
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            ref.read(dashboardProductsNotifierProvider).products.entity.clear();
            await ref
                .read(dashboardProductsNotifierProvider.notifier)
                .getProductsPage(
                  productItemsFunction: ProductItemsFunction.getProducts,
                );
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
                    .read(dashboardProductsNotifierProvider.notifier)
                    .getProductsPage(
                      productItemsFunction:
                          ProductItemsFunction.getProductsNextPage,
                    );
              }
              return false;
            },
            child: const CustomScrollView(
              slivers: [
                CSAppBar(),
                ProductsCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
