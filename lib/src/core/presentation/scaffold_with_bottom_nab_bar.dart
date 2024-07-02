import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithBottomNavBar extends ConsumerWidget {
  const ScaffoldWithBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childWidget = ref.watch(childWidgetProvider);
    return Scaffold(
      body: childWidget,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childWidget = ref.watch(childWidgetProvider);
    return BottomNavigationBar(
      currentIndex: childWidget.currentIndex,
      onTap: (value) {
        childWidget.goBranch(
          value,
          initialLocation: true,
        );
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
      ],
    );
  }
}
