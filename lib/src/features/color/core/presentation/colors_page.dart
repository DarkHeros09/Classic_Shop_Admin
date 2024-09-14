import 'package:classic_shop_admin/src/features/color/core/application/color_notifier.dart';
import 'package:classic_shop_admin/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ColorsPage extends HookConsumerWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(colorNotifierProvider);
    final itemCount = ref.watch(
      colorNotifierProvider.select(
        (value) => value.map(
          initial: (value) => 0,
          loadInProgress: (value) => value.colors.entity.length + 10,
          loadSuccess: (value) => value.colors.entity.length,
          loadFailure: (value) => 0,
        ),
      ),
    );
    debugPrint('SC rebuilt');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.goNamed(AppRoute.addColor.name),
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
        child: CustomScrollView(
          slivers: [
            SuperSliverList.separated(
              itemBuilder: (context, index) => state.map(
                initial: (_) => const SizedBox.shrink(),
                loadInProgress: (_) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Skeletonizer.zone(
                    child: ShadCard(
                      title: Bone.text(
                        words: 1,
                      ),
                    ),
                  ),
                ),
                loadSuccess: (_) => index != itemCount
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () => context.goNamed(
                            AppRoute.colorUpdateDelete.name,
                            pathParameters: {
                              'id': _.colors.entity[index].id.toString(),
                            },
                            extra: _.colors.entity[index],
                          ),
                          child: ShadCard(
                            title: Text(_.colors.entity[index].colorValue),
                          ),
                        ),
                      )
                    : const SizedBox(height: 8),
                loadFailure: (value) => const SizedBox.shrink(),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: itemCount + 1,
            ),
          ],
        ),
      ),
    );
  }
}
