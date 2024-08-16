import 'dart:async';

import 'package:classic_shop_admin/src/features/color/application/color_notifier.dart';
import 'package:classic_shop_admin/src/features/image/application/image_notifier.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/manage/add_product_item/application/add_product_item_notifier.dart';
import 'package:classic_shop_admin/src/features/product/application/product_notifier.dart';
import 'package:classic_shop_admin/src/features/product/application/searched_product_notifier.dart';
import 'package:classic_shop_admin/src/features/size/application/size_notifier.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'add_product_item_page.g.dart';

@Riverpod(keepAlive: true)
class ImageUrl extends _$ImageUrl {
  @override
  ProductImageUrl? build() {
    return null;
  }

  void setImage(ProductImageUrl? imageUrl) {
    state = imageUrl;
  }
}

class AddProductItemPage extends StatefulHookConsumerWidget {
  const AddProductItemPage({super.key});

  @override
  ConsumerState<AddProductItemPage> createState() => _AddProductItemPageState();
}

class _AddProductItemPageState extends ConsumerState<AddProductItemPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        debugPrint('CALLED PAGE');
        ref.read(productNotifierProvider.notifier).getProductsPage();
        ref.read(sizeNotifierProvider.notifier).getSizes();
        ref.read(colorNotifierProvider.notifier).getColors();
      },
    );
  }

  Timer? _debounce;
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await ref
          .read(searchedProductNotifierProvider.notifier)
          .searchProductsPage(query);
      debugPrint('PNAME SEARCH: $query');
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  final formKey = GlobalKey<ShadFormState>();
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ShadTheme.of(context);
    final productSearchValue = useState('');
    debugPrint('QQQ: ${productSearchValue.value}');
    final productSearchKey = useState(0);
    final searchedQueries = useState(<String, String>{});
    debugPrint('SQQQ: ${searchedQueries.value}');
    final sizeSearchValue = useState('');
    final sizeSearchKey = useState(0);
    final colorSearchValue = useState('');
    final colorSearchKey = useState(0);
    final isActive = useState(false);
    final sizeMapIndex = useState(10);
    final colorMapIndex = useState(10);
    ref
      ..listen(productNotifierProvider, (previous, next) {
        next.map(
          initial: (_) => canLoadNextPage = true,
          loadInProgress: (_) => canLoadNextPage = false,
          loadSuccess: (_) {
            if (!_.products.isFresh && !hasAlreadyShownNoConnectionToast) {
              hasAlreadyShownNoConnectionToast = true;
              showNoConnectionToast(
                'لقد فقدت الاتصال بالانترنت, بعض البيانات قد لا تكون حديثة.',
                context,
              );
            }
            canLoadNextPage = _.isNextPageAvailable;
          },
          loadFailure: (_) => canLoadNextPage = false,
        );
      })
      ..listen(
        addProductItemNotifierProvider,
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
                  description: Text('A product item has been created.'),
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
    final productState = ref.watch(
      productNotifierProvider.select(
        (value) {
          return {
            for (final product in value.products.entity)
              product.id.toString(): product.name,
          };
        },
      ),
    );
    debugPrint('PNAME LIST: $productState');
    final searchedProductState = ref.watch(
      searchedProductNotifierProvider.select(
        (value) {
          return {
            for (final product in value.products.entity)
              product.id.toString(): product.name,
          };
        },
      ),
    );
    debugPrint('PSEARCH LIST: $searchedProductState');
    Map<String, String> filteredProducts() => {
          for (final product in productState.entries)
            if (product.value
                .toLowerCase()
                .contains(productSearchValue.value.toLowerCase()))
              product.key: product.value,
        };
    Map<String, String> searchedProducts() => {
          for (final product in searchedProductState.entries)
            if (product.value
                .toLowerCase()
                .contains(productSearchValue.value.toLowerCase()))
              product.key: product.value,
        };
    final sizeState = ref.watch(
      sizeNotifierProvider.select(
        (value) {
          return {
            for (final size in value.sizes.entity)
              size.id.toString(): size.sizeValue,
          };
        },
      ),
    );
    Map<String, String> filteredSizes() => {
          for (final size in sizeState.entries)
            if (size.value
                .toLowerCase()
                .contains(sizeSearchValue.value.toLowerCase()))
              size.key: size.value,
        };
    final colorState = ref.watch(
      colorNotifierProvider.select(
        (value) {
          return {
            for (final color in value.colors.entity)
              color.id.toString(): color.colorValue,
          };
        },
      ),
    );
    Map<String, String> filteredColors() => {
          for (final color in colorState.entries)
            if (color.value
                .toLowerCase()
                .contains(colorSearchValue.value.toLowerCase()))
              color.key: color.value,
        };
    final imageUrl = ref.watch(imageUrlProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Product Item', style: theme.textTheme.h4),
                child: ShadForm(
                  key: formKey,
                  autovalidateMode: ShadAutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
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
                          if (canLoadNextPage &&
                              metrics.pixels >= limit &&
                              isVertical) {
                            canLoadNextPage = false;
                            if (productSearchValue.value.isEmpty) {
                              debugPrint('statement NEXT');
                              ref
                                  .read(productNotifierProvider.notifier)
                                  .getProductsNextPage();
                            } else {
                              debugPrint('statement SEARCH');
                              ref
                                  .read(
                                    searchedProductNotifierProvider.notifier,
                                  )
                                  .searchProductsNextPage(
                                    productSearchValue.value,
                                  );
                            }
                          }
                          return false;
                        },
                        child: ShadSelect<String>.withSearch(
                          minWidth: 180,
                          placeholder: const Text('Select a product...'),
                          onChanged: (value) {
                            productSearchKey.value = int.parse(value);
                          },
                          onSearchChanged: (value) {
                            productSearchValue.value = value;
                            if (value.isNotEmpty) {
                              _onSearchChanged(value);
                            }
                          },
                          searchPlaceholder: const Text('Search product'),
                          options: [
                            if (filteredProducts().isEmpty &&
                                searchedProducts().isEmpty)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 24),
                                child: Text('No product found'),
                              ),
                            if (searchedProducts().isEmpty)
                              ...productState.entries.map(
                                (product) {
                                  // productSearchKey.value = int.parse(product.key);
                                  debugPrint('${productSearchKey.value}');
                                  // this offstage is used to avoid the focus loss when the search results appear again
                                  // because it keeps the widget in the tree.
                                  return Offstage(
                                    offstage: !filteredProducts()
                                        .containsKey(product.key),
                                    child: ShadOption(
                                      value: product.key,
                                      child: Text(product.value),
                                    ),
                                  );
                                },
                              ),
                            ...searchedProductState.entries.map(
                              (product) {
                                searchedQueries.value = searchedProductState;

                                // productSearchKey.value = int.parse(product.key);
                                debugPrint('${productSearchKey.value}');
                                // this offstage is used to avoid the focus loss when the search results appear again
                                // because it keeps the widget in the tree.
                                return Offstage(
                                  offstage: !searchedProducts()
                                      .containsKey(product.key),
                                  child: ShadOption(
                                    value: product.key,
                                    child: Text(product.value),
                                  ),
                                );
                              },
                            ),
                          ],
                          selectedOptionBuilder: (context, value) {
                            debugPrint('VVVVV: $value');
                            return Text(
                              productState[value] ??
                                  searchedQueries.value[value] ??
                                  '',
                            );
                          },
                        ),
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
                            sizeMapIndex.value += 10;
                          }
                          return false;
                        },
                        child: ShadSelect<String>.withSearch(
                          minWidth: 180,
                          placeholder: const Text('Select a size...'),
                          onChanged: (value) =>
                              sizeSearchKey.value = int.parse(value),
                          onSearchChanged: (value) =>
                              sizeSearchValue.value = value,
                          searchPlaceholder: const Text('Search size'),
                          options: [
                            if (filteredSizes().isEmpty)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 24),
                                child: Text('No size found'),
                              ),
                            ...sizeState.entries.take(sizeMapIndex.value).map(
                              (size) {
                                // sizeSearchKey.value = int.parse(size.key);
                                // this offstage is used to avoid the focus loss when the search results appear again
                                // because it keeps the widget in the tree.
                                return Offstage(
                                  offstage:
                                      !filteredSizes().containsKey(size.key),
                                  child: ShadOption(
                                    value: size.key,
                                    child: Text(size.value),
                                  ),
                                );
                              },
                            ),
                          ],
                          selectedOptionBuilder: (context, value) =>
                              Text(sizeState[value]!),
                        ),
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
                          if (canLoadNextPage &&
                              metrics.pixels >= limit &&
                              isVertical) {
                            colorMapIndex.value += 10;
                          }
                          return false;
                        },
                        child: ShadSelect<String>.withSearch(
                          minWidth: 180,
                          placeholder: const Text('Select a color...'),
                          onChanged: (value) =>
                              colorSearchKey.value = int.parse(value),
                          onSearchChanged: (value) =>
                              colorSearchValue.value = value,
                          searchPlaceholder: const Text('Search color'),
                          options: [
                            if (filteredSizes().isEmpty)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 24),
                                child: Text('No color found'),
                              ),
                            ...colorState.entries.take(colorMapIndex.value).map(
                              (color) {
                                // colorSearchKey.value = int.parse(color.key);
                                // this offstage is used to avoid the focus loss when the search results appear again
                                // because it keeps the widget in the tree.
                                return Offstage(
                                  offstage:
                                      !filteredColors().containsKey(color.key),
                                  child: ShadOption(
                                    value: color.key,
                                    child: Text(color.value),
                                  ),
                                );
                              },
                            ),
                          ],
                          selectedOptionBuilder: (context, value) =>
                              Text(colorState[value]!),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ShadButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          ref
                              .read(productImagesNotifierProvider.notifier)
                              .getProductImagesPage();
                          showModalBottomSheet<void>(
                            context: context,
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (context) {
                              return Consumer(
                                builder: (context, ref, child) {
                                  final state =
                                      ref.watch(productImagesNotifierProvider);
                                  final itemCount = state.maybeMap(
                                    orElse: () => 0,
                                    loadSuccess: (value) => value.images.entity
                                        .map((e) => e.toProductImageUrls())
                                        .expand((element) => element)
                                        .toList()
                                        .length,
                                  );
                                  return SizedBox(
                                    height: screenSize.height * 3 / 4,
                                    width: double.infinity,
                                    child: state.maybeMap(
                                      loadInProgress: (value) => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      orElse: SizedBox.shrink,
                                      loadSuccess: (value) {
                                        final urls = value.images.entity
                                            .map(
                                              (e) => e.toProductImageUrls(),
                                            )
                                            .expand((element) => element)
                                            .toList();
                                        return Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: AlignedGridView.count(
                                            crossAxisSpacing: 4,
                                            itemCount: itemCount,
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 4,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                final url = urls[index];
                                                debugPrint(
                                                  'CCATEGORY IMAGE url $url',
                                                );
                                                ref
                                                    .read(
                                                      imageUrlProvider.notifier,
                                                    )
                                                    .setImage(url);
                                                // debugPrint(
                                                //   'CCATEGORY IMAGE $imageUrl',
                                                // );
                                                if (mounted &&
                                                    context.canPop()) {
                                                  context.pop();
                                                }
                                                FocusScope.of(context)
                                                    .unfocus();
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
                                                urls[index].url,
                                                cacheMaxAge:
                                                    const Duration(days: 30),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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
                          imageUrl.url,
                          cacheMaxAge: const Duration(days: 30),
                        ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'sku',
                        label: const Text('SKU'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Product SKU'),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'qty',
                        label: const Text('Quantity'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Product Quantity'),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'price',
                        label: const Text('Price'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Product Price'),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
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
                              if (mounted && context.canPop()) {
                                context.pop();
                              }
                            },
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          ShadButton(
                            onPressed: () {
                              final validated =
                                  formKey.currentState?.validate();
                              if (validated != null &&
                                  validated &&
                                  productSearchKey.value != 0 &&
                                  sizeSearchKey.value != 0) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                ref
                                    .read(
                                      addProductItemNotifierProvider.notifier,
                                    )
                                    .createProductItem(
                                      productId: productSearchKey.value,
                                      sizeId: sizeSearchKey.value,
                                      colorId: colorSearchKey.value,
                                      imageId: imageUrl?.id ?? 0,
                                      productSku: int.tryParse(
                                            values!['sku']!.value.toString(),
                                          ) ??
                                          0,
                                      qtyInStock: int.tryParse(
                                            values['qty']!.value.toString(),
                                          ) ??
                                          0,
                                      price: values['price']!.value.toString(),
                                      active: isActive.value,
                                    );
                                formKey.currentState?.reset();
                                productSearchKey.value = 0;
                                productSearchValue.value = '';
                                sizeSearchKey.value = 0;
                                sizeSearchValue.value = '';
                                colorSearchKey.value = 0;
                                colorSearchValue.value = '';
                                ref
                                    .read(imageUrlProvider.notifier)
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
      ),
    );
  }
}
