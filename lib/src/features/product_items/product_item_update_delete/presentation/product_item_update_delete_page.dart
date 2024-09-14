import 'package:classic_shop_admin/src/features/dashboard/shared/providers.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:classic_shop_admin/src/features/product_item_images/add_product_item_image_update_delete/presentation/add_product_item_image_page.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/application/product_item_update_delete_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductItemUpdateDeletePage extends StatefulHookConsumerWidget {
  const ProductItemUpdateDeletePage({
    required this.product,
    required this.discountValue,
    super.key,
  });

  final ProductItem product;
  final int discountValue;

  @override
  ConsumerState<ProductItemUpdateDeletePage> createState() =>
      _ProductItemUpdateDeletePageState();
}

class _ProductItemUpdateDeletePageState
    extends ConsumerState<ProductItemUpdateDeletePage> {
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    final nameReadOnly = useState(true);
    final descriptionReadOnly = useState(true);
    final priceReadOnly = useState(true);
    final quantityReadOnly = useState(true);
    final imageUrl1 = ref.watch(imageUrlProvider('imageUrl1')) ??
        widget.product.productImage1;
    final imageUrl2 = ref.watch(imageUrlProvider('imageUrl2')) ??
        widget.product.productImage2;
    final imageUrl3 = ref.watch(imageUrlProvider('imageUrl3')) ??
        widget.product.productImage3;
    final imageUrlList = [imageUrl1, imageUrl2, imageUrl3];
    final productActive = useState(widget.product.parentProductActive ?? false);
    final productItemActive = useState(widget.product.active);
    final productItemQTY = useState(widget.product.qtyInStock);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Edit/Delete Product', style: theme.textTheme.h4),
                child: ShadForm(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      ShadInputFormField(
                        readOnly: nameReadOnly.value,
                        suffix: IconButton(
                          onPressed: () =>
                              nameReadOnly.value = !nameReadOnly.value,
                          icon: const Icon(Icons.edit),
                        ),
                        id: 'name',
                        initialValue: widget.product.name,
                        label: const Text('Name'),
                        placeholder: const Text('Product Name'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        readOnly: descriptionReadOnly.value,
                        suffix: IconButton(
                          onPressed: () => descriptionReadOnly.value =
                              !descriptionReadOnly.value,
                          icon: const Icon(Icons.edit),
                        ),
                        id: 'description',
                        initialValue: widget.product.description,
                        label: const Text('Product Description'),
                        placeholder: const Text('Enter description'),
                        maxLines: 4,
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Description must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ShadInputFormField(
                              readOnly: priceReadOnly.value,
                              suffix: IconButton(
                                onPressed: () =>
                                    priceReadOnly.value = !priceReadOnly.value,
                                icon: const Icon(Icons.edit),
                              ),
                              id: 'price',
                              initialValue: widget.product.price,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              label: const Text('Price'),
                              placeholder: const Text('Price'),
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'Price must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: ShadInputFormField(
                              enabled: false,
                              id: 'discount',
                              keyboardType: TextInputType.number,
                              initialValue: widget.discountValue.toString(),
                              label: const Text('Discount %'),
                              placeholder: const Text('Discount (%)'),
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'Discount must not be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        readOnly: quantityReadOnly.value,
                        suffix: IconButton(
                          onPressed: () =>
                              quantityReadOnly.value = !quantityReadOnly.value,
                          icon: const Icon(Icons.edit),
                        ),
                        id: 'qty',
                        initialValue: widget.product.qtyInStock.toString(),
                        label: const Text('Quantity'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Product Quantity'),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'Quantity must not be empty.';
                          }
                          final val = int.tryParse(v);
                          if (val == null) {
                            return 'Quantity must be a number';
                          }
                          productItemQTY.value = val;
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text('Image'),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < imageUrlList.length; i++)
                            Column(
                              children: [
                                ShadButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    ref
                                        .read(
                                          imageKitsNotifierProvider.notifier,
                                        )
                                        .fetchImages(path: 'products');
                                    showModalBottomSheet<void>(
                                      context: context,
                                      showDragHandle: true,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return Consumer(
                                          builder: (context, ref, child) {
                                            final state = ref.watch(
                                              imageKitsNotifierProvider,
                                            );
                                            final itemCount = state.maybeMap(
                                              orElse: () => 0,
                                              loadSuccess: (value) =>
                                                  value.imageKits.entity.length,
                                            );
                                            return SizedBox(
                                              height: screenSize.height * 3 / 4,
                                              width: double.infinity,
                                              child: state.maybeMap(
                                                loadInProgress: (value) =>
                                                    const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                orElse: SizedBox.shrink,
                                                loadSuccess: (value) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: AlignedGridView.count(
                                                    crossAxisSpacing: 4,
                                                    itemCount: itemCount,
                                                    crossAxisCount: 4,
                                                    mainAxisSpacing: 4,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            InkWell(
                                                      onTap: () {
                                                        final url = value
                                                            .imageKits
                                                            .entity[index]
                                                            .cardImageKitsUrls;
                                                        ref
                                                            .read(
                                                              imageUrlProvider(
                                                                'imageUrl${i + 1}',
                                                              ).notifier,
                                                            )
                                                            .setImage(url);

                                                        if (mounted &&
                                                            context.canPop()) {
                                                          context.pop();
                                                        }
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                      },
                                                      child:
                                                          ExtendedImage.network(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        height: 100,
                                                        width: 100,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(10),
                                                        ),
                                                        fit: BoxFit.cover,
                                                        value
                                                            .imageKits
                                                            .entity[index]
                                                            .cardImageKitsUrls,
                                                        cacheMaxAge:
                                                            const Duration(
                                                          days: 30,
                                                        ),
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
                                if (imageUrlList[i] != null)
                                  const SizedBox(height: 16),
                                if (imageUrlList[i] != null)
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
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    fit: BoxFit.cover,
                                    imageUrlList[i] ?? '',
                                    cacheMaxAge: const Duration(days: 30),
                                  ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ShadSwitchFormField(
                        id: 'product_active',
                        initialValue: productActive.value,
                        inputLabel: const Text('Is Product Active?'),
                        onChanged: (v) => productActive.value = v,
                      ),
                      const SizedBox(height: 8),
                      ShadSwitchFormField(
                        id: 'product_item_active',
                        initialValue: productItemActive.value,
                        inputLabel: const Text('Is Product Item Active?'),
                        onChanged: (v) => productItemActive.value = v,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ShadButton.outline(
                              onPressed: () {
                                if (mounted && context.canPop()) {
                                  context.pop();
                                }
                              },
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ShadButton(
                              onPressed: () async {
                                final validated =
                                    formKey.currentState?.validate();
                                if (validated != null && validated) {
                                  formKey.currentState?.save();
                                  FocusScope.of(context).unfocus();
                                  final values = formKey.currentState?.fields;
                                  await ref
                                      .read(
                                        productItemUpdateDeleteNotifierProvider
                                            .notifier,
                                      )
                                      .updateProductItem(
                                        productItemId: widget.product.id,
                                        productId: widget.product.productId,
                                        // productSku: ,
                                        qtyInStock: productItemQTY.value,
                                        price:
                                            values!['price']!.value.toString(),
                                        active: productItemActive.value,
                                      );

                                  ref
                                      .read(dashboardProductsNotifierProvider)
                                      .products
                                      .entity
                                      .clear();

                                  await ref
                                      .read(
                                        dashboardProductsNotifierProvider
                                            .notifier,
                                      )
                                      .getProductsPage(
                                        productItemsFunction:
                                            ProductItemsFunction.getProducts,
                                      );
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ShadButton.destructive(
                        width: double.infinity,
                        onPressed: () {},
                        child: const Text('Delete'),
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
