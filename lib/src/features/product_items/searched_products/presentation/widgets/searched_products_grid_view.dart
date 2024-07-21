import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/presentation/widgets/searched_product_card.dart';
import 'package:classic_shop_admin/src/helpers/riverpod_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchedProductCardIndexProvider =
    Provider<int>((_) => throw UnimplementedError());

class SearchedProductsGridView extends ConsumerWidget {
  const SearchedProductsGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchedProductsNotifierProvider);
    return SliverAlignedGrid.count(
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.products.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.products.entity.length,
        loadFailure: (_) => _.products.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return ProviderScope(
          observers: [
            RiverpodObserver(),
          ],
          key: UniqueKey(),
          overrides: [
            searchedProductCardIndexProvider.overrideWithValue(index),
          ],
          child: state.map(
            initial: (_) => const SizedBox.shrink(),
            loadInProgress: (_) {
              if (index < _.products.entity.length) {
                return SearchedProductCard(
                  product: _.products.entity[index],
                );
              } else {
                return const SizedBox.shrink();
                // return const LoadingProductCard();
              }
            },
            loadSuccess: (_) {
              if (_.products.entity.isEmpty) {
                return const SizedBox.shrink();
              }
              return SearchedProductCard(
                product: _.products.entity[index],
              );
            },
            loadFailure: (_) {
              if (index < _.products.entity.length) {
                return SearchedProductCard(
                  product: _.products.entity[index],
                );
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
