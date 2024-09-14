import 'package:classic_shop_admin/src/features/size/core/application/size_notifier.dart';
import 'package:classic_shop_admin/src/features/size/core/domain/size.dart';
import 'package:classic_shop_admin/src/features/size/size_update_delete/application/size_update_delete_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SizeUpdateDeletePage extends StatefulHookConsumerWidget {
  const SizeUpdateDeletePage({required this.size, super.key});

  final SizeModel size;

  @override
  ConsumerState<SizeUpdateDeletePage> createState() =>
      _SizeUpdateDeletePageState();
}

class _SizeUpdateDeletePageState extends ConsumerState<SizeUpdateDeletePage> {
// String? imageUrl;
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    ref.listen(
      sizeUpdateDeleteNotifierProvider,
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
                description: Text('A size has been updated.'),
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Update/Delete Size', style: theme.textTheme.h4),
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
                        initialValue: widget.size.sizeValue,
                        label: const Text('Value'),
                        onPressedOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        placeholder: const Text('Size Value'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Size name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
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
                                      sizeUpdateDeleteNotifierProvider.notifier,
                                    )
                                    .updateSize(
                                      productSizeId: widget.size.id,
                                      size: values!['name']!.value.toString(),
                                    );
                                ref
                                    .read(sizeNotifierProvider)
                                    .sizes
                                    .entity
                                    .clear();

                                await ref
                                    .read(sizeNotifierProvider.notifier)
                                    .getSizes();
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
