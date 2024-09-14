import 'package:classic_shop_admin/src/features/brand/brand_update_delete/application/brand_update_delete_notifier.dart';
import 'package:classic_shop_admin/src/features/brand/core/application/brand_notifier.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand.dart';
import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'brand_update_delete_page.g.dart';

@riverpod
class ImageUrl extends _$ImageUrl {
  @override
  String? build() {
    return null;
  }

  void setImage(String? imageUrl) {
    state = imageUrl;
  }
}

class BrandUpdateDeletePage extends StatefulHookConsumerWidget {
  const BrandUpdateDeletePage({required this.brand, super.key});

  final Brand brand;

  @override
  ConsumerState<BrandUpdateDeletePage> createState() =>
      _BrandUpdateDeletePageState();
}

class _BrandUpdateDeletePageState extends ConsumerState<BrandUpdateDeletePage> {
// String? imageUrl;
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    final nameReadOnly = useState(true);
    ref.listen(
      brandUpdateDeleteNotifierProvider,
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
                description: Text('Brand has been updated.'),
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
    debugPrint('IIMMGG height ${screenSize.height}');
    final imageUrl = ref.watch(imageUrlProvider) ?? widget.brand.brandImage;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Update Brand', style: theme.textTheme.h4),
                child: ShadForm(
                  autovalidateMode: ShadAutovalidateMode.disabled,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      ShadInputFormField(
                        id: 'name',
                        initialValue: widget.brand.brandName,
                        readOnly: nameReadOnly.value,
                        suffix: IconButton(
                          onPressed: () =>
                              nameReadOnly.value = !nameReadOnly.value,
                          icon: const Icon(Icons.edit),
                        ),
                        label: const Text('Name'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Brand Name'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Username must be at least 2 characters.';
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
                              .fetchImages(path: 'brands');
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
                            onPressed: () async {
                              final validated =
                                  formKey.currentState?.validate();
                              if (validated != null && validated) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                await ref
                                    .read(
                                      brandUpdateDeleteNotifierProvider
                                          .notifier,
                                    )
                                    .updateBrand(
                                      brandId: widget.brand.id,
                                      brandName:
                                          values!['name']!.value.toString(),
                                      brandImage: imageUrl,
                                    );

                                ref
                                    .read(brandNotifierProvider)
                                    .brands
                                    .entity
                                    .clear();

                                await ref
                                    .read(brandNotifierProvider.notifier)
                                    .getBrands();
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
