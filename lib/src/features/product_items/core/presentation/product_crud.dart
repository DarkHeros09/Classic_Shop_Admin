import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductCrud extends StatefulHookConsumerWidget {
  const ProductCrud({super.key});

  @override
  ConsumerState<ProductCrud> createState() => _ProductCrudState();
}

class _ProductCrudState extends ConsumerState<ProductCrud> {
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add/Edit Product', style: theme.textTheme.h4),
                    ShadButton.destructive(
                      onPressed: () {},
                      child: const Text('Delete'),
                    ),
                  ],
                ),
                child: ShadForm(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      ShadInputFormField(
                        id: 'name',
                        label: const Text('Name'),
                        placeholder: const Text('Product Name'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Username must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'description',
                        label: const Text('Product Description'),
                        placeholder: const Text('Enter description'),
                        maxLines: 4,
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Username must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ShadInputFormField(
                              id: 'price',
                              label: const Text('Price'),
                              placeholder: const Text('Price'),
                              validator: (v) {
                                if (v.length < 2) {
                                  return 'Username must be at least 2 characters.';
                                }
                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: ShadInputFormField(
                              id: 'discount',
                              label: const Text('Discount'),
                              placeholder: const Text('Discount (%)'),
                              validator: (v) {
                                if (v.length < 2) {
                                  return 'Username must be at least 2 characters.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Image'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ShadButton.outline(
                            icon: const Icon(
                              Icons.upload_rounded,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'No image selected',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ShadButton.outline(
                            onPressed: () {},
                            child: const Text('Delete'),
                          ),
                          const SizedBox(width: 8),
                          ShadButton(
                            onPressed: () {},
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
