import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/application/shop_order_notifier.dart';
import 'package:classic_shop_admin/src/features/shop_order/core/presentation/widgets/shop_order_card.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ShopOrdersPage extends StatefulHookConsumerWidget {
  const ShopOrdersPage({super.key});

  @override
  ConsumerState<ShopOrdersPage> createState() => _ShopOrdersPageState();
}

class _ShopOrdersPageState extends ConsumerState<ShopOrdersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(shopOrderNotifierProvider.notifier).getShopOrdersPage();
      },
    );
  }

  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    ref.listen(shopOrderNotifierProvider, (previous, next) {
      next.map(
        initial: (_) => canLoadNextPage = true,
        loadInProgress: (_) => canLoadNextPage = false,
        loadSuccess: (_) {
          if (!_.shopOrders.isFresh && !hasAlreadyShownNoConnectionToast) {
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
    debugPrint('mmk $canLoadNextPage');
    final state = ref.watch(shopOrderNotifierProvider);
    final itemCount = ref.watch(
      shopOrderNotifierProvider.select(
        (value) => value.map(
          initial: (_) => 0,
          loadInProgress: (_) => _.shopOrders.entity.length + 1,
          loadSuccess: (_) => _.shopOrders.entity.length,
          loadFailure: (_) => _.shopOrders.entity.length + 1,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              ref.read(shopOrderNotifierProvider.notifier).getShopOrdersPage(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final metrics = notification.metrics;
              final limit =
                  metrics.maxScrollExtent - metrics.viewportDimension / 3;
              final isVertical = metrics.axis == Axis.vertical;
              if (canLoadNextPage && metrics.pixels >= limit && isVertical) {
                canLoadNextPage = false;
                ref
                    .read(shopOrderNotifierProvider.notifier)
                    .getShopOrdersNextPage();
              }
              return false;
            },
            child: SuperListView.separated(
              itemBuilder: (context, index) => state.map(
                initial: (_) => const SizedBox.shrink(),
                loadInProgress: (_) {
                  if (index < _.shopOrders.entity.length) {
                    return OrderCard(
                      shopOrder: _.shopOrders.entity[index],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                loadSuccess: (_) => OrderCard(
                  shopOrder: _.shopOrders.entity[index],
                ),
                loadFailure: (_) {
                  if (index < _.shopOrders.entity.length) {
                    return OrderCard(
                      shopOrder: _.shopOrders.entity[index],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: itemCount,
            ),
          ),
        ),
      ),
    );
  }
}
