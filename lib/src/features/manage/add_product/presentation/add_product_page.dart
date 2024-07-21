import 'package:classic_shop_admin/src/features/brand/application/brand_notifier.dart';
import 'package:classic_shop_admin/src/features/category/application/category_notifier.dart';
import 'package:classic_shop_admin/src/features/manage/add_product/application/add_product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AddProductPage extends StatefulHookConsumerWidget {
  const AddProductPage({super.key});

  @override
  ConsumerState<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(categoryNotifierProvider.notifier).getCategories();
        ref.read(brandNotifierProvider.notifier).getBrandss();
      },
    );
  }

  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final categorySearchValue = useState('');
    final categorySearchKey = useState(0);
    final brandSearchValue = useState('');
    final brandSearchKey = useState(0);
    final isActive = useState(false);
    ref.listen(
      addProductNotifierProvider,
      (previous, next) {
        next.mapOrNull(
          loading: (loading) {
            return showDialog<Widget>(
              context: context,
              builder: (context) {
                return const Center(
                  child: ShadCard(
                    content: CircularProgressIndicator(),
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
      categoryNotifierProvider.select(
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Product', style: theme.textTheme.h4),
                content: ShadForm(
                  key: formKey,
                  autovalidateMode: ShadAutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      ShadInputFormField(
                        id: 'name',
                        label: const Text('Name'),
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
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
                        id: 'description',
                        label: const Text('Description'),
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
                        placeholder: const Text('Select category...'),
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
                        minWidth: 180,
                        placeholder: const Text('Select brand...'),
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
                            text: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          ShadButton(
                            onPressed: () {
                              final validated =
                                  formKey.currentState?.validate();
                              if (validated != null &&
                                  validated &&
                                  categorySearchKey.value != 0 &&
                                  brandSearchKey.value != 0) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                ref
                                    .read(addProductNotifierProvider.notifier)
                                    .createProduct(
                                      name: values!['name']!.value.toString(),
                                      description: values['description']!
                                          .value
                                          .toString(),
                                      categoryId: categorySearchKey.value,
                                      brandId: brandSearchKey.value,
                                      isActive: isActive.value,
                                    );
                                formKey.currentState?.reset();
                                categorySearchKey.value = 0;
                                categorySearchValue.value = '';
                                brandSearchKey.value = 0;
                                brandSearchValue.value = '';
                                isActive.value = false;
                              }
                            },
                            text: const Text('Save'),
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
