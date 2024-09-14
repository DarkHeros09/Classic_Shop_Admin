import 'package:classic_shop_admin/src/features/brand/core/application/brand_notifier.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrandsPage extends StatefulHookConsumerWidget {
  const BrandsPage({super.key});

  @override
  ConsumerState<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends ConsumerState<BrandsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(brandNotifierProvider.notifier).getBrands();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandNotifierProvider);
    final itemCount = ref.watch(
      brandNotifierProvider.select(
        (state) => state.map(
          initial: (_) => 0,
          loadInProgress: (_) => 10,
          loadSuccess: (_) => _.brands.entity.length,
          loadFailure: (_) => 0,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.goNamed(AppRoute.addBrand.name),
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
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: itemCount + 1,
          itemBuilder: (context, index) => index != itemCount
              ? state.maybeMap(
                  orElse: SizedBox.fromSize,
                  loadSuccess: (value) => InkWell(
                    onTap: () => context.goNamed(
                      AppRoute.brandUpdateDelete.name,
                      pathParameters: {
                        'id': value.brands.entity[index].id.toString(),
                      },
                      extra: value.brands.entity[index],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      // margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 128,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0D0D0D),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x24000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  value.brands.entity[index].brandName,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ExtendedImage.network(
                              enableLoadState: false,
                              fit: BoxFit.cover,
                              value.brands.entity[index].brandImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox(height: 8),
        ),
      ),
    );
  }
}
