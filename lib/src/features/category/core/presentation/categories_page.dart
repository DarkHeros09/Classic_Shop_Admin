import 'package:classic_shop_admin/src/features/category/core/application/categories_notifier.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesPage extends StatefulHookConsumerWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(categoriesNotifierProvider.notifier).getCategories();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoriesNotifierProvider);
    final itemCount = ref.watch(
      categoriesNotifierProvider.select(
        (state) => state.map(
          initial: (_) => 0,
          loadInProgress: (_) => 10,
          loadSuccess: (_) => _.categories.entity.length,
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
              onPressed: () => context.goNamed(AppRoute.addCategory.name),
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
                      AppRoute.categoryUpdateDelete.name,
                      pathParameters: {
                        'id': value.categories.entity[index].id.toString(),
                      },
                      extra: value.categories.entity[index],
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
                                  value.categories.entity[index].categoryName,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ExtendedImage.network(
                              enableLoadState: false,
                              fit: BoxFit.cover,
                              value.categories.entity[index].categoryImage,
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
