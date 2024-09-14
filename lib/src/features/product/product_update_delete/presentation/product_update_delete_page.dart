import 'package:classic_shop_admin/src/features/brand/core/application/brand_notifier.dart';
import 'package:classic_shop_admin/src/features/category/core/application/categories_notifier.dart';
import 'package:classic_shop_admin/src/features/product/core/application/product_notifier.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product.dart';
import 'package:classic_shop_admin/src/features/product/product_update_delete/application/product_update_delete_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductUpdateDeletePage extends StatefulHookConsumerWidget {
  const ProductUpdateDeletePage({required this.product, super.key});

  final Product product;
  @override
  ConsumerState<ProductUpdateDeletePage> createState() =>
      _ProductUpdateDeletePageState();
}

class _ProductUpdateDeletePageState
    extends ConsumerState<ProductUpdateDeletePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(categoriesNotifierProvider.notifier).getCategories();
        ref.read(brandNotifierProvider.notifier).getBrands();
        ref
            .read(getCategoryNotifierProvider.notifier)
            .getCategory(categoryId: widget.product.categoryId);
        ref
            .read(getBrandNotifierProvider.notifier)
            .getBrand(brandId: widget.product.brandId);
      },
    );
  }

  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    // final brandReadOnly = useState(true);
    // final categoryReadOnly = useState(true);
    final nameReadOnly = useState(true);
    final descriptionReadOnly = useState(true);
    final isActive = useState(widget.product.active);
    final categorySearchValue = useState('');
    final categorySearchKey = useState(widget.product.categoryId);
    final brandSearchValue = useState('');
    final brandSearchKey = useState(widget.product.brandId);
    ref.listen(
      productUpdateDeleteNotifierProvider,
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
                description: Text('A product has been created.'),
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
    final parentCategory = ref.watch(
      categoriesNotifierProvider.select(
        (value) {
          return {
            for (final category in value.categories.entity)
              category.id.toString(): category.categoryName,
          };
        },
      ),
    );
    Map<String, String> filteredCategories() => {
          for (final category in parentCategory.entries)
            if (category.value
                .toLowerCase()
                .contains(categorySearchValue.value.toLowerCase()))
              category.key: category.value,
        };
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

    final initCategoryValue = ref.watch(getCategoryNotifierProvider).value;
    final initBrandValue = ref.watch(getBrandNotifierProvider).value;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Update Product', style: theme.textTheme.h4),
                child: ShadForm(
                  key: formKey,
                  autovalidateMode: ShadAutovalidateMode.disabled,
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
                      ShadSelect<String>.withSearch(
                        minWidth: 180,
                        placeholder: Text(
                          initCategoryValue?.categoryName ??
                              'Select category...',
                        ),
                        onChanged: (value) =>
                            categorySearchKey.value = int.parse(value),
                        onSearchChanged: (value) {
                          categorySearchValue.value = value;
                        },
                        searchPlaceholder: const Text('Search category'),
                        options: [
                          if (filteredCategories().isEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Text('No category found'),
                            ),
                          ...parentCategory.entries.map(
                            (category) {
                              // categorySearchKey.value = int.parse(category.key);
                              debugPrint('${categorySearchKey.value}');
                              // this offstage is used to avoid the focus loss when the search results appear again
                              // because it keeps the widget in the tree.
                              return Offstage(
                                offstage: !filteredCategories()
                                    .containsKey(category.key),
                                child: ShadOption(
                                  value: category.key,
                                  child: Text(category.value),
                                ),
                              );
                            },
                          ),
                        ],
                        selectedOptionBuilder: (context, value) =>
                            Text(parentCategory[value]!),
                      ),
                      const SizedBox(height: 16),
                      ShadSelect<String>.withSearch(
                        // initialValue: widget.product.brandId.toString(),
                        minWidth: 180,
                        placeholder: Text(
                          initBrandValue?.brandName ?? 'Select brand...',
                        ),
                        onChanged: (value) =>
                            brandSearchKey.value = int.parse(value),
                        onSearchChanged: (value) =>
                            brandSearchValue.value = value,
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
                        selectedOptionBuilder: (context, value) =>
                            Text(brandState[value]!),
                      ),
                      const SizedBox(height: 16),
                      ShadSwitchFormField(
                        id: 'product_active',
                        initialValue: isActive.value,
                        inputLabel: const Text('Is Product Active?'),
                        onChanged: (v) => isActive.value = v,
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

                                  debugPrint(
                                    'QAZNAME: ${values!['name']!.value}',
                                  );
                                  debugPrint(
                                    'QAZDESCR: ${values['description']!.value}',
                                  );
                                  debugPrint(
                                    'QAZCAT: ${categorySearchKey.value}',
                                  );
                                  debugPrint(
                                    'QAZBRAND: ${brandSearchKey.value}',
                                  );
                                  debugPrint('QAZACTIVE: ${isActive.value}');
                                  await ref
                                      .read(
                                        productUpdateDeleteNotifierProvider
                                            .notifier,
                                      )
                                      .updateProduct(
                                        productId: widget.product.id,
                                        name: values['name']!.value.toString(),
                                        description: values['description']!
                                            .value
                                            .toString(),
                                        categoryId: categorySearchKey.value,
                                        brandId: brandSearchKey.value,
                                        active: isActive.value,
                                      );

                                  ref
                                      .read(productNotifierProvider)
                                      .products
                                      .entity
                                      .clear();

                                  await ref
                                      .read(productNotifierProvider.notifier)
                                      .getProductsPage();
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
