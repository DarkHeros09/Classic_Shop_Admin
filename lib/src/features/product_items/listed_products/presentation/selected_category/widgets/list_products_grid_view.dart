import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/loading_product_card.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/product_card.dart';
import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:classic_shop_admin/src/helpers/riverpod_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productCardIndexProvider =
    Provider<int>((_) => throw UnimplementedError());

class ListProductsGridView extends ConsumerWidget {
  const ListProductsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listProductsNotifierProvider);
    final itemCount = ref.watch(
      listProductsNotifierProvider.select(
        (value) => value.map(
          initial: (_) => 0,
          loadInProgress: (_) => _.products.entity.length + _.itemsPerPage,
          loadSuccess: (_) => _.products.entity.length,
          loadFailure: (_) => _.products.entity.length + 1,
        ),
      ),
    );
    return SliverAlignedGrid.count(
      key: UniqueKey(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ProviderScope(
          observers: [
            RiverpodObserver(),
          ],
          key: UniqueKey(),
          overrides: [productCardIndexProvider.overrideWithValue(index)],
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
        );
      },
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 16,
    );
  }
}
