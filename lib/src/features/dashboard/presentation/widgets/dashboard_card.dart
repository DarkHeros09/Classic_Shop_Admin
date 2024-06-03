import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      sliver: SliverAlignedGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) => Center(
          child: DashboardCard(
            index: index,
          ),
        ),
        itemCount: 4,
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ShadCard(
        title: Center(child: Text('$index')),
        content: const Center(child: Text('Products')),
      ),
    );
  }
}
