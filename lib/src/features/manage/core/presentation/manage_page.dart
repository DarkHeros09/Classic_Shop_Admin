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
                              context.goNamed(AppRoute.addProduct.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Product',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 1:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addProductItem.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Expanded(
                            child: Text(
                              'Add Product Item',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 2:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addBrand.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Brand',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 3:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addCategory.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Category',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 4:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addImage.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Image',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 5:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addColor.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Color',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 6:
                        return ShadButton(
                          onPressed: () =>
                              context.goNamed(AppRoute.addColor.name),
                          height: 60,
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: const Text(
                            'Add Size',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      case 7:
                        return const ShadButton(
                          height: 60,
                          icon: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: Expanded(
                            child: Text(
                              'Add Promotion',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 8:
                        return const ShadButton(
                          height: 60,
                          icon: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: Expanded(
                            child: Text(
                              'Add Product Promotion',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 9:
                        return const ShadButton(
                          height: 60,
                          icon: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: Expanded(
                            child: Text(
                              'Add Category Promotion',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      case 10:
                        return const ShadButton(
                          height: 60,
                          icon: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.add),
                          ),
                          child: Expanded(
                            child: Text(
                              'Add Brand Promotion',
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
