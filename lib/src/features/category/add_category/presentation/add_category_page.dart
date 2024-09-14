import 'package:classic_shop_admin/src/features/category/add_category/application/add_category_notifier.dart';
import 'package:classic_shop_admin/src/features/category/core/application/categories_notifier.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'add_category_page.g.dart';

@Riverpod(keepAlive: true)
class CategoryImageUrl extends _$CategoryImageUrl {
  @override
  String? build() {
    return null;
  }

  void setImage(String? imageUrl) {
    state = imageUrl;
  }
}

class AddCategoryPage extends StatefulHookConsumerWidget {
  const AddCategoryPage({super.key});

  @override
  ConsumerState<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<AddCategoryPage> {
// String? imageUrl;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(categoriesNotifierProvider.notifier).getCategories();
      },
    );
  }

  final formKey = GlobalKey<ShadFormState>();
  int? searchKey;
  @override
  Widget build(BuildContext context) {
    final searchValue = useState('');
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    ref.listen(
      addCategoryNotifierProvider,
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
                description: Text('A category has been created.'),
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
    final imageUrl = ref.watch(categoryImageUrlProvider);
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
                .contains(searchValue.value.toLowerCase()))
              category.key: category.value,
        };

    debugPrint('CCATEGORY $parentCategory');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Category', style: theme.textTheme.h4),
                child: ShadForm(
                  autovalidateMode: ShadAutovalidateMode.disabled,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      ShadSelect<String>.withSearch(
                        minWidth: 180,
                        placeholder: const Text('Select category...'),
                        onChanged: (value) => searchKey = int.parse(value),
                        onSearchChanged: (value) => searchValue.value = value,
                        searchPlaceholder: const Text('Search category'),
                        options: [
                          if (filteredCategories().isEmpty)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Text('No category found'),
                            ),
                          ...parentCategory.entries.map(
                            (category) {
                              // searchKey = int.parse(category.key);
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
                      ShadInputFormField(
                        id: 'name',
                        label: const Text('Name'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Category Name'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Image',
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      ShadButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          ref
                              .read(imageKitsNotifierProvider.notifier)
                              .fetchImages(path: 'categories');
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
                                                'CCATEGORY IMAGE url $url',
                                              );
                                              ref
                                                  .read(
                                                    categoryImageUrlProvider
                                                        .notifier,
                                                  )
                                                  .setImage(url);
                                              debugPrint(
                                                'CCATEGORY IMAGE $imageUrl',
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
                          imageUrl,
                          cacheMaxAge: const Duration(days: 30),
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
                                  imageUrl != null) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                ref
                                    .read(addCategoryNotifierProvider.notifier)
                                    .createCategory(
                                      parentCategoryId: searchKey,
                                      categoryName:
                                          values!['name']!.value.toString(),
                                      categoryImage: imageUrl,
                                    );
                                ref
                                    .read(categoryImageUrlProvider.notifier)
                                    .setImage(null);
                                searchKey = null;
                                formKey.currentState?.reset();
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
