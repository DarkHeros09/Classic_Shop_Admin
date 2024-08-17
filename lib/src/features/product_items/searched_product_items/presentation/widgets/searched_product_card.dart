import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchedProductCard extends ConsumerWidget {
  const SearchedProductCard({
    required this.product,
    super.key,
  });

  final ProductItem product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(searchedProductsNotifierProvider);
    // final index = ref.watch(searchedProductCardIndexProvider);
    // final product = state.mapOrNull(
    //   loadSuccess: (_) => _.products.entity[index],
    // );
    // return product == null
    // ? const LoadingProductCard()
    return LoadedSearchedCard(product: product);
  }
}

class LoadedSearchedCard extends StatelessWidget {
  const LoadedSearchedCard({
    required this.product,
    super.key,
  });

  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 224,
          width: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExtendedNetworkImageProvider(
                product.productImage1 ?? '',
                cache: true,
                cacheMaxAge: const Duration(days: 30),
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Text(
          product.name ?? '',
          style: appTheme.textTheme.bodyLarge,
        ),
        Text(
          '${product.price} د.ل',
          style: appTheme.textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
