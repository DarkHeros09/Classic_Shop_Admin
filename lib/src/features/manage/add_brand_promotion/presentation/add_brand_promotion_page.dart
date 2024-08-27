import 'package:classic_shop_admin/src/features/brand/application/brand_notifier.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:classic_shop_admin/src/features/manage/add_brand_promotion/application/add_brand_promotion_notifier.dart';
import 'package:classic_shop_admin/src/features/promotion/application/promotion_notifier.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'add_brand_promotion_page.g.dart';

@Riverpod(keepAlive: true)
class BrandImageUrl extends _$BrandImageUrl {
  @override
  String? build() {
    return null;
  }

  void setImage(String? imageUrl) {
    state = imageUrl;
  }
}

class AddBrandPromotionPage extends StatefulHookConsumerWidget {
  const AddBrandPromotionPage({super.key});

  @override
  ConsumerState<AddBrandPromotionPage> createState() =>
      _AddBrandPromotionPageState();
}

class _AddBrandPromotionPageState extends ConsumerState<AddBrandPromotionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(brandNotifierProvider.notifier).getBrands();
        ref.read(promotionNotifierProvider.notifier).getPromotions();
      },
    );
  }

  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ShadTheme.of(context);
    final isActive = useState(false);
    final brandSearchValue = useState('');
    debugPrint('QQQ: ${brandSearchValue.value}');
    final brandSearchKey = useState(0);
    final searchedQueries = useState(<String, String>{});
    final promotionSearchValue = useState('');
    final promotionSearchKey = useState(0);
    final promotionMapIndex = useState(10);
    debugPrint('SQQQ: ${searchedQueries.value}');
    ref
      ..listen(brandNotifierProvider, (previous, next) {
        next.map(
          initial: (_) => canLoadNextPage = true,
          loadInProgress: (_) => canLoadNextPage = false,
          loadSuccess: (_) {
            if (!_.brands.isFresh && !hasAlreadyShownNoConnectionToast) {
              hasAlreadyShownNoConnectionToast = true;
              showNoConnectionToast(
                'لقد فقدت الاتصال بالانترنت, بعض البيانات قد لا تكون حديثة.',
                context,
              );
            }
          },
          loadFailure: (_) => canLoadNextPage = false,
        );
      })
      ..listen(
        addBrandPromotionNotifierProvider,
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
                  description: Text('A promotion has been created.'),
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

    final brandState = ref.watch(
      brandNotifierProvider.select(
        (value) {
          return {
            for (final brand in value.brands.entity)
              brand.id.toString(): brand.brandName,
          };
        },
      ),
    );
    Map<String, String> filteredBrands() => {
          for (final brand in brandState.entries)
            if (brand.value
                .toLowerCase()
                .contains(brandSearchValue.value.toLowerCase()))
              brand.key: brand.value,
        };
    final promotionState = ref.watch(
      promotionNotifierProvider.select(
        (value) {
          return {
            for (final promotion in value.promotions.entity)
              promotion.id.toString(): promotion.name,
          };
        },
      ),
    );
    Map<String, String> filteredPromotions() => {
          for (final promotion in promotionState.entries)
            if (promotion.value
                .toLowerCase()
                .contains(promotionSearchValue.value.toLowerCase()))
              promotion.key: promotion.value,
        };
    final imageUrl = ref.watch(brandImageUrlProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Brand Promotion', style: theme.textTheme.h4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    ShadSelect<String>.withSearch(
                      minWidth: 180,
                      placeholder: const Text('Select a brand...'),
                      onChanged: (value) {
                        brandSearchKey.value = int.parse(value);
                      },
                      onSearchChanged: (value) {
                        brandSearchValue.value = value;
                      },
                      searchPlaceholder: const Text('Search brand'),
                      options: [
                        if (filteredBrands().isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Text('No brand found'),
                          ),
                        ...brandState.entries.map(
                          (brand) {
                            // brandSearchKey.value = int.parse(brand.key);
                            debugPrint('${brandSearchKey.value}');
                            // this offstage is used to avoid the focus loss when the search results appear again
                            // because it keeps the widget in the tree.
                            return Offstage(
                              offstage:
                                  !filteredBrands().containsKey(brand.key),
                              child: ShadOption(
                                value: brand.key,
                                child: Text(brand.value),
                              ),
                            );
                          },
                        ),
                      ],
                      selectedOptionBuilder: (context, value) {
                        debugPrint('VVVVV: $value');
                        return Text(
                          brandState[value] ??
                              searchedQueries.value[value] ??
                              '',
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        debugPrint(
                          'SCROLL EDGE:${notification.metrics.atEdge}',
                        );
                        debugPrint(
                          'SCROLL MAX:${notification.metrics.maxScrollExtent}',
                        );
                        debugPrint(
                          'SCROLL PIXEL:${notification.metrics.pixels}',
                        );
                        final metrics = notification.metrics;
                        final limit = metrics.maxScrollExtent -
                            metrics.viewportDimension / 4;
                        final isVertical = metrics.axis == Axis.vertical;
                        if (metrics.pixels >= limit && isVertical) {
                          promotionMapIndex.value += 10;
                        }
                        return false;
                      },
                      child: ShadSelect<String>.withSearch(
                        minWidth: 180,
                        placeholder: const Text('Select a promotion...'),
                        onChanged: (value) =>
                            promotionSearchKey.value = int.parse(value),
                        onSearchChanged: (value) =>
                            promotionSearchValue.value = value,
                        searchPlaceholder: const Text('Search promotion'),
                        options: [
                          if (filteredPromotions().isEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Text('No promotion found'),
                            ),
                          ...promotionState.entries
                              .take(promotionMapIndex.value)
                              .map(
                            (promotion) {
                              // promotionSearchKey.value = int.parse(promotion.key);
                              // this offstage is used to avoid the focus loss when the search results appear again
                              // because it keeps the widget in the tree.
                              return Offstage(
                                offstage: !filteredPromotions()
                                    .containsKey(promotion.key),
                                child: ShadOption(
                                  value: promotion.key,
                                  child: Text(promotion.value),
                                ),
                              );
                            },
                          ),
                        ],
                        selectedOptionBuilder: (context, value) =>
                            Text(promotionState[value]!),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ShadButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        ref
                            .read(imageKitsNotifierProvider.notifier)
                            .fetchImages();
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
                                                  brandImageUrlProvider
                                                      .notifier,
                                                )
                                                .setImage(url);
                                            debugPrint(
                                              'BBRAND IMAGE $imageUrl',
                                            );
                                            if (mounted && context.canPop()) {
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
                    if (imageUrl != null) const SizedBox(height: 16),
                    if (imageUrl != null)
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        fit: BoxFit.cover,
                        imageUrl,
                        cacheMaxAge: const Duration(days: 30),
                      ),
                    const SizedBox(height: 16),
                    ShadSwitchFormField(
                      id: 'is_active',
                      initialValue: false,
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
                          onPressed: () {
                            if (imageUrl != null &&
                                brandSearchKey.value != 0 &&
                                promotionSearchKey.value != 0) {
                              FocusScope.of(context).unfocus();
                              ref
                                  .read(
                                    addBrandPromotionNotifierProvider.notifier,
                                  )
                                  .createBrandPromotion(
                                    brandId: brandSearchKey.value,
                                    promotionId: promotionSearchKey.value,
                                    brandPromotionImage: imageUrl,
                                    active: isActive.value,
                                  );
                              brandSearchKey.value = 0;
                              brandSearchValue.value = '';
                              searchedQueries.value.clear();
                              promotionSearchKey.value = 0;
                              promotionSearchValue.value = '';
                              promotionMapIndex.value = 10;
                              ref
                                  .read(brandImageUrlProvider.notifier)
                                  .setImage(null);
                              isActive.value = false;
                            }
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
