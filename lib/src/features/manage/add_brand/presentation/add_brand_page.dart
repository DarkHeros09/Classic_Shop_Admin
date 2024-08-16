import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:classic_shop_admin/src/features/manage/add_brand/application/add_brand_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'add_brand_page.g.dart';

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

class AddBrandPage extends StatefulHookConsumerWidget {
  const AddBrandPage({super.key});

  @override
  ConsumerState<AddBrandPage> createState() => _AddBrandPageState();
}

class _AddBrandPageState extends ConsumerState<AddBrandPage> {
// String? imageUrl;
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    ref.listen(
      addBrandNotifierProvider,
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
                description: Text('A brand has been created.'),
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
    final imageUrl = ref.watch(imageUrlProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Brand', style: theme.textTheme.h4),
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
                                    .read(addBrandNotifierProvider.notifier)
                                    .createBrand(
                                      brandName:
                                          values!['name']!.value.toString(),
                                      brandImage: imageUrl,
                                    );
                                ref
                                    .read(imageUrlProvider.notifier)
                                    .setImage(null);
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
