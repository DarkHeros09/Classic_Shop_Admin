import 'package:classic_shop_admin/src/features/dashboard/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/widgets/loading_product_image.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCard extends HookConsumerWidget {
  const ProductCard({
    super.key,
  });

  int discount(ProductItem product) {
    late final int discount;
    final promo = (
      product.productPromoActive,
      product.categoryPromoActive,
      product.brandPromoActive
    );
    switch (promo) {
      case (true, _, _):
        discount = product.productPromoDiscountRate ?? 0;
      case (_, true, _):
        discount = product.categoryPromoDiscountRate ?? 0;
      case (_, _, true):
        discount = product.brandPromoDiscountRate ?? 0;
      default:
        discount = 0;
    }
    return discount;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context);
    final index = ref.watch(productCardIndexProvider);
    final product = ref.watch(
      dashboardProductsNotifierProvider.select(
        (state) => state.map(
          initial: (_) => _.products.entity[index],
          loadInProgress: (_) => _.products.entity[index],
          loadSuccess: (_) => _.products.entity[index],
          loadFailure: (_) => _.products.entity[index],
        ),
      ),
    );
    // final controller =
    //     useAnimationController(initialValue: product.qtyInStock == 0 ? .5 : 1);
    final discountValue = discount(product);
    final discountedPrice = (num.parse(product.price) -
            num.parse(product.price) * discountValue / 100)
        .toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () => context.pushNamed(
            AppRoute.updateDeleteProduct.name,
            pathParameters: {'id': product.id.toString()},
            // extra: (product, discountValue),
          ),
          child: Stack(
            children: [
              ExtendedImage.network(
                loadStateChanged: (state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      return const LoadingProductImage();
                    case LoadState.failed:
                    case LoadState.completed:
                      return ColorFiltered(
                        colorFilter: product.qtyInStock == 0
                            ? const ColorFilter.mode(
                                Colors.white,
                                BlendMode.color,
                              )
                            : const ColorFilter.mode(
                                Colors.transparent,
                                BlendMode.color,
                              ),
                        child: state.completedWidget,
                      );
                  }
                },
                shape: BoxShape.rectangle,
                opacity: product.qtyInStock == 0
                    ? const AlwaysStoppedAnimation<double>(.5)
                    : const AlwaysStoppedAnimation<double>(1),
                height: 224,
                width: 190,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                fit: BoxFit.cover,
                product.productImage1 ?? '',
                cacheMaxAge: const Duration(days: 30),
              ),
              if (DateTime.now().difference(product.createdAt).inDays <= 7 &&
                  product.qtyInStock != 0)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          // color: Color(0xFFB71C1C),
                          color: Colors.black,
                        ),
                        child: Text(
                          'جديد',
                          style: appTheme.textTheme.labelSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              if (product.qtyInStock == 0)
                Positioned.fill(
                  child: Align(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.black,
                        ),
                        child: Text(
                          // 'نفذت الكمية',
                          'إنتهى من المخزن',
                          style: appTheme.textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              if (discountValue != 0 && product.qtyInStock != 0)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Color(0xFFDB3022),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$discountValue%',
                              style: appTheme.textTheme.labelMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(width: 4),
                            // Transform.flip(
                            //   // flipX: true,
                            //   child: ScalableImageWidget(
                            //     si: priceTagIcon,
                            //     scale: .5,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product.brandName ?? '',
          style: appTheme.textTheme.bodySmall
              ?.copyWith(color: const Color(0xFF9B9B9B)),
        ),
        Text(
          product.name ?? '',
          style: appTheme.textTheme.bodyLarge,
        ),
        Row(
          children: [
            Stack(
              children: [
                Text(
                  '${product.price} د.ل',
                  style: appTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: discountValue != 0 || product.qtyInStock == 0
                        ? FontWeight.normal
                        : FontWeight.w700,
                    color: discountValue != 0 || product.qtyInStock == 0
                        ? const Color(0xFF9B9B9B)
                        : null,
                  ),
                ),
                if (discountValue != 0 || product.qtyInStock == 0)
                  const Positioned.fill(
                    child: SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: Color(0xFF9B9B9B),
                        // height: 25,
                        thickness: 1,
                      ),
                    ),
                  ),
              ],
            ),
            if (discountValue != 0 && product.qtyInStock != 0) ...[
              const SizedBox(width: 8),
              Text(
                '$discountedPrice د.ل',
                style: appTheme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  // color: const Color(0xFFB71C1C),
                  color: const Color(0xFFDB3022),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
