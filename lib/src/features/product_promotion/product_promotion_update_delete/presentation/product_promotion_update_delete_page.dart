import 'package:classic_shop_admin/src/features/brand/add_brand/presentation/add_brand_page.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/application/product_promotions_notifier.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/domain/product_promotion.dart';
import 'package:classic_shop_admin/src/features/product_promotion/product_promotion_update_delete/application/product_promotion_update_delete_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductPromotionUpdateDeletePage extends StatefulHookConsumerWidget {
  const ProductPromotionUpdateDeletePage({
    required this.productPromotion,
    super.key,
  });

  final ProductPromotion productPromotion;

  @override
  ConsumerState<ProductPromotionUpdateDeletePage> createState() =>
      _ProductPromotionUpdateDeletePageState();
}

class _ProductPromotionUpdateDeletePageState
    extends ConsumerState<ProductPromotionUpdateDeletePage> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ShadTheme.of(context);
    final isActive = useState(widget.productPromotion.active);
    ref.listen(
      productPromotionUpdateDeleteNotifierProvider,
      (previous, next) {
        next.mapOrNull(
          loading: (loading) {
            return showDialog<Widget>(
              context: context,
              builder: (context) {
                return const Center(
                  child: ShadCard(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            );
          },
          data: (_) {
            Navigator.pop(context);
            ShadToaster.of(context).show(
              const ShadToast(
                description: Text('A product promotion has been updated.'),
              ),
            );
          },
          error: (_) {
            Navigator.pop(context);
            ShadToaster.of(context).show(
              const ShadToast.destructive(
                description: Text('There was a problem with your request'),
              ),
            );
          },
        );
      },
    );
    final imageUrl = ref.watch(imageUrlProvider) ??
        widget.productPromotion.productPromotionImage;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text(
                  'Update/Delete Product Promotion',
                  style: theme.textTheme.h4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Product's name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: '          '),
                          TextSpan(
                            text: widget.productPromotion.productName,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Promotion's name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: '     '),
                          TextSpan(
                            text: widget.productPromotion.promotionName,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ShadButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        ref
                            .read(imageKitsNotifierProvider.notifier)
                            .fetchImages(path: 'product-promotions');
                        showModalBottomSheet<void>(
                          context: context,
                          showDragHandle: true,
                          isScrollControlled: true,
                          builder: (context) {
                            return Consumer(
                              builder: (context, ref, child) {
                                final state =
                                    ref.watch(imageKitsNotifierProvider);
                                final itemCount = state.maybeMap(
                                  orElse: () => 0,
                                  loadSuccess: (value) =>
                                      value.imageKits.entity.length,
                                );
                                return SizedBox(
                                  height: screenSize.height * 3 / 4,
                                  width: double.infinity,
                                  child: state.maybeMap(
                                    loadInProgress: (value) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    orElse: SizedBox.shrink,
                                    loadSuccess: (value) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: AlignedGridView.count(
                                        crossAxisSpacing: 4,
                                        itemCount: itemCount,
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 4,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () {
                                            final url = value
                                                .imageKits
                                                .entity[index]
                                                .cardImageKitsUrls;
                                            debugPrint(
                                              'BBRAND IMAGE url $url',
                                            );
                                            ref
                                                .read(
                                                  imageUrlProvider.notifier,
                                                )
                                                .setImage(url);
                                            debugPrint(
                                              'BBRAND IMAGE $imageUrl',
                                            );
                                            if (context.mounted &&
                                                context.canPop()) {
                                              context.pop();
                                            }
                                            FocusScope.of(context).unfocus();
                                          },
                                          child: ExtendedImage.network(
                                            shape: BoxShape.rectangle,
                                            height: 100,
                                            width: 100,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            fit: BoxFit.cover,
                                            value.imageKits.entity[index]
                                                .cardImageKitsUrls,
                                            cacheMaxAge:
                                                const Duration(days: 30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.upload_rounded),
                    ),
                    const SizedBox(height: 16),
                    ExtendedImage.network(
                      loadStateChanged: (state) {
                        switch (state.extendedImageLoadState) {
                          case LoadState.loading:
                            return const ShadProgress();
                          case LoadState.failed:
                          case LoadState.completed:
                        }
                        return null;
                      },
                      shape: BoxShape.rectangle,
                      height: 112,
                      width: 95,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      fit: BoxFit.cover,
                      imageUrl,
                      cacheMaxAge: const Duration(days: 30),
                    ),
                    const SizedBox(height: 16),
                    ShadSwitchFormField(
                      id: 'is_active',
                      initialValue: isActive.value,
                      inputLabel: const Text('Is Active?'),
                      onChanged: (v) => isActive.value = v,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ShadButton.outline(
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop();
                            }
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        ShadButton(
                          onPressed: () async {
                            await ref
                                .read(
                                  productPromotionUpdateDeleteNotifierProvider
                                      .notifier,
                                )
                                .updateProductPromotion(
                                  productId: widget.productPromotion.productId,
                                  promotionId:
                                      widget.productPromotion.promotionId,
                                  productPromotionImage: imageUrl,
                                  active: isActive.value,
                                );

                            ref
                                .read(productPromotionsNotifierProvider)
                                .productPromotions
                                .entity
                                .clear();

                            await ref
                                .read(
                                    productPromotionsNotifierProvider.notifier)
                                .getProductPromotions();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
