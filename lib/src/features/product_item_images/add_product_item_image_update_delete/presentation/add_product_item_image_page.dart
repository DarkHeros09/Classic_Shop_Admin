import 'package:classic_shop_admin/src/features/image/application/image_kit_notifier.dart';
import 'package:classic_shop_admin/src/features/product_item_images/add_product_item_image_update_delete/application/add_product_item_image_notifier.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'add_product_item_image_page.g.dart';

@riverpod
class ImageUrl extends _$ImageUrl {
  @override
  String? build(String url) {
    return null;
  }

  void setImage(String? imageUrl) {
    state = imageUrl;
  }
}

class AddProductItemImagePage extends StatefulHookConsumerWidget {
  const AddProductItemImagePage({super.key});

  @override
  ConsumerState<AddProductItemImagePage> createState() =>
      _AddProductItemImagePageState();
}

class _AddProductItemImagePageState
    extends ConsumerState<AddProductItemImagePage> {
// String? imageUrl;
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    ref.listen(
      addImageNotifierProvider,
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
                description: Text('Product images has been created.'),
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
    final imageUrl1 = ref.watch(imageUrlProvider('imageUrl1'));
    final imageUrl2 = ref.watch(imageUrlProvider('imageUrl2'));
    final imageUrl3 = ref.watch(imageUrlProvider('imageUrl3'));
    final imageUrlList = [imageUrl1, imageUrl2, imageUrl3];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Images', style: theme.textTheme.h4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Images',
                      textAlign: TextAlign.start,
                    ),
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
                                      .read(imageKitsNotifierProvider.notifier)
                                      .fetchImages(path: 'products');
                                  showModalBottomSheet<void>(
                                    context: context,
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Consumer(
                                        builder: (context, ref, child) {
                                          final state = ref
                                              .watch(imageKitsNotifierProvider);
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
                                                      shape: BoxShape.rectangle,
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
                            if (imageUrl1 != null &&
                                imageUrl2 != null &&
                                imageUrl3 != null) {
                              ref
                                  .read(addImageNotifierProvider.notifier)
                                  .createImage(
                                    productImage1: imageUrl1,
                                    productImage2: imageUrl2,
                                    productImage3: imageUrl3,
                                  );
                              ref
                                ..read(imageUrlProvider('imageUrl1').notifier)
                                    .setImage(null)
                                ..read(imageUrlProvider('imageUrl2').notifier)
                                    .setImage(null)
                                ..read(imageUrlProvider('imageUrl3').notifier)
                                    .setImage(null);
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
