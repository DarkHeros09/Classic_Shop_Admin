import 'package:classic_shop_admin/src/features/manage/add_size/application/add_size_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AddSizePage extends StatefulHookConsumerWidget {
  const AddSizePage({super.key});

  @override
  ConsumerState<AddSizePage> createState() => _AddSizePageState();
}

class _AddSizePageState extends ConsumerState<AddSizePage> {
// String? imageUrl;
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    ref.listen(
      addSizeNotifierProvider,
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
                description: Text('A size has been created.'),
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
                title: Text('Add Size', style: theme.textTheme.h4),
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
                            onPressed: () {
                              final validated =
                                  formKey.currentState?.validate();
                              if (validated != null && validated) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                ref
                                    .read(addSizeNotifierProvider.notifier)
                                    .createSize(
                                      sizeValue:
                                          values!['name']!.value.toString(),
                                    );
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
