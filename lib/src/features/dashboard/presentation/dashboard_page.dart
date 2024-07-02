import 'package:classic_shop_admin/src/features/dashboard/application/dashboard_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await ref.read(dashboardNotifierProvider.notifier).getDashboardInfo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverAlignedGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return ShadCard(
                        title: const Center(child: Text('Active Products')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.activeProducts.toString(),
                          ),
                        ),
                      );
                    case 1:
                      return ShadCard(
                        title: const Center(child: Text('Total Products')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.totalProducts.toString(),
                          ),
                        ),
                      );
                    case 2:
                      return ShadCard(
                        title: const Center(child: Text('Active Users')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.activeUsers.toString(),
                          ),
                        ),
                      );
                    case 3:
                      return ShadCard(
                        title: const Center(child: Text('Total Users')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.totalUsers.toString(),
                          ),
                        ),
                      );
                    case 4:
                      return ShadCard(
                        title: const Center(child: Text('Active Orders')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.activeOrders.toString(),
                          ),
                        ),
                      );
                    case 5:
                      return ShadCard(
                        title: const Center(child: Text('Total Orders')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.totalOrders.toString(),
                          ),
                        ),
                      );
                    case 6:
                      return ShadCard(
                        title: const Center(child: Text('Daily Revenue')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.dailyRevenue,
                          ),
                        ),
                      );
                    case 7:
                      return ShadCard(
                        title: const Center(child: Text('Total Revenue')),
                        description: Center(
                          child: Text(
                            state.dashboard.entity.totalRevenue.toString(),
                          ),
                        ),
                      );
                  }
                  return null;
                },
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
