import 'package:classic_shop_admin/src/features/brand/add_brand/presentation/add_brand_page.dart';
import 'package:classic_shop_admin/src/features/category_promotion/category_promotion_update_delete/application/category_promotion_update_delete_notifier.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/application/category_promotions_notifier.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CategoryPromotionUpdateDeletePage extends StatefulHookConsumerWidget {
  const CategoryPromotionUpdateDeletePage({
    required this.categoryPromotion,
    super.key,
  });

  final CategoryPromotion categoryPromotion;

  @override
  ConsumerState<CategoryPromotionUpdateDeletePage> createState() =>
      _CategoryPromotionUpdateDeletePageState();
}

class _CategoryPromotionUpdateDeletePageState
    extends ConsumerState<CategoryPromotionUpdateDeletePage> {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ShadTheme.of(context);
    final isActive = useState(widget.categoryPromotion.active);
    ref.listen(
      categoryPromotionUpdateDeleteNotifierProvider,
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
                description: Text('A category promotion has been updated.'),
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
        widget.categoryPromotion.categoryPromotionImage;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text(
                  'Update/Delete Category Promotion',
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
                            text: "Category's name:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: '          '),
                          TextSpan(
                            text: widget.categoryPromotion.categoryName,
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
                            text: widget.categoryPromotion.promotionName,
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
                            .fetchImages(path: 'category-promotions');
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
                                  categoryPromotionUpdateDeleteNotifierProvider
                                      .notifier,
                                )
                                .updateCategoryPromotion(
                                  categoryId:
                                      widget.categoryPromotion.categoryId,
                                  promotionId:
                                      widget.categoryPromotion.promotionId,
                                  categoryPromotionImage: imageUrl,
                                  active: isActive.value,
                                );

                            ref
                                .read(categoryPromotionsNotifierProvider)
                                .categoryPromotions
                                .entity
                                .clear();

                            await ref
                                .read(
                                  categoryPromotionsNotifierProvider.notifier,
                                )
                                .getCategoryPromotions();
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
