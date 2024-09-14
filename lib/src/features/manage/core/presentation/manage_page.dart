import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.products.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Text(
                            'Products',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 1:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.productItems.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Product Items',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 2:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.brands.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Text(
                            'Brands',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 3:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.categories.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Text(
                            'Categories',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 4:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.productItemImages.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Product item images',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 5:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.colors.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Text(
                            'Colors',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 6:
                        return ShadButton(
                          onPressed: () => context.goNamed(AppRoute.sizes.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Text(
                            'Sizes',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 7:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.promotions.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Promotions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 8:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.productPromotions.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Product Promotions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 9:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.categoryPromotions.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Category Promotions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 10:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.brandPromotions.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Brand Promotion',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                    }
                    return null;
                  },
                  itemCount: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
