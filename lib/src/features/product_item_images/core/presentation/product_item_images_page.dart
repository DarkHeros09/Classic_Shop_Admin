import 'package:classic_shop_admin/src/features/image/application/image_notifier.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductItemImagesPage extends StatefulHookConsumerWidget {
  const ProductItemImagesPage({super.key});

  @override
  ConsumerState<ProductItemImagesPage> createState() =>
      _ProductItemImagesPageState();
}

class _ProductItemImagesPageState extends ConsumerState<ProductItemImagesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productImagesNotifierProvider.notifier).getProductImagesPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final imageUrl = ref.watch(imageUrlProvider);
    final state = ref.watch(productImagesNotifierProvider);
    final itemCount = state.maybeMap(
      orElse: () => 0,
      loadSuccess: (value) => value.images.entity
          .map((e) => e.toProductImageUrls())
          .expand((element) => element)
          .toList()
          .length,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () =>
                  context.goNamed(AppRoute.addProductItemImage.name),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
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
            debugPrint('URLSS $urls');
            return Padding(
              padding: const EdgeInsets.all(8),
              child: AlignedGridView.count(
                crossAxisSpacing: 4,
                itemCount: itemCount,
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    final url = urls[index];
                    debugPrint(
                      'CCATEGORY IMAGE url $url',
                    );
                    final selectedImage = urls
                        .where(
                          (element) => element.id == url.id,
                        )
                        .toList();
                    context.goNamed(
                      AppRoute.productItemImageUpdateDelete.name,
                      pathParameters: {
                        'id': urls[index].id.toString(),
                      },
                      extra: selectedImage,
                    );
                  },
                  child: ExtendedImage.network(
                    shape: BoxShape.rectangle,
                    height: 100,
                    width: 100,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    fit: BoxFit.cover,
                    urls[index].url,
                    cacheMaxAge: const Duration(days: 30),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
