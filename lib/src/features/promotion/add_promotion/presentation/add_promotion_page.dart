import 'package:classic_shop_admin/src/features/promotion/add_promotion/application/add_promotion_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AddPromotionPage extends StatefulHookConsumerWidget {
  const AddPromotionPage({super.key});

  @override
  ConsumerState<AddPromotionPage> createState() => _AddPromotionPageState();
}

class _AddPromotionPageState extends ConsumerState<AddPromotionPage> {
  final formKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isActive = useState(false);
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);
    ref.listen(
      addPromotionNotifierProvider,
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
                description: Text('A promotion has been created.'),
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: ShadCard(
                title: Text('Add Promotion', style: theme.textTheme.h4),
                child: ShadForm(
                  key: formKey,
                  autovalidateMode: ShadAutovalidateMode.disabled,
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
                        placeholder: const Text('Promotion Name'),
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Name must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'description',
                        label: const Text('Description'),
                        placeholder: const Text('Enter description'),
                        maxLines: 4,
                        validator: (v) {
                          if (v.length < 2) {
                            return 'Description must be at least 2 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        id: 'discountRate',
                        keyboardType: TextInputType.number,
                        label: const Text('Discount Rate %'),
                        placeholder: const Text('Enter discount rate %'),
                        validator: (v) {
                          final discountValue = int.tryParse(v) ?? 0;
                          if (v.isEmpty || discountValue == 0) {
                            return 'Description must be larger than 0';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('From: '),
                          ShadButton.outline(
                            onPressed: () async {
                              final currentDate = DateTime.now();
                              await showDatePicker(
                                context: context,
                                firstDate: DateTime(currentDate.year),
                                lastDate: DateTime(currentDate.year + 1),
                                currentDate: currentDate,
                                initialDate: currentDate,
                              ).then(
                                (selectedDate) async {
                                  if (context.mounted && selectedDate != null) {
                                    startDate.value = selectedDate;
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (selectedTime) {
                                        if (selectedTime != null) {
                                          startDate.value =
                                              startDate.value!.copyWith(
                                            hour: selectedTime.hour,
                                            minute: selectedTime.minute,
                                          );
                                        } else {
                                          startDate.value = null;
                                        }
                                      },
                                    );
                                  }
                                  return null;
                                },
                              );
                            },
                            icon: const Icon(LucideIcons.calendar),
                            child: Text(
                              startDate.value != null
                                  ? DateFormat('yyyy-MM-dd   hh:mm a')
                                      .format(startDate.value!)
                                  : 'Pick a start date',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('To:     '),
                          ShadButton.outline(
                            onPressed: () async {
                              final currentDate = DateTime.now();
                              await showDatePicker(
                                context: context,
                                firstDate: DateTime(currentDate.year),
                                lastDate: DateTime(currentDate.year + 1),
                                currentDate: currentDate,
                                initialDate: currentDate,
                              ).then(
                                (selectedDate) async {
                                  if (context.mounted && selectedDate != null) {
                                    endDate.value = selectedDate;
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (selectedTime) {
                                        if (selectedTime != null) {
                                          endDate.value =
                                              endDate.value!.copyWith(
                                            hour: selectedTime.hour,
                                            minute: selectedTime.minute,
                                          );
                                        } else {
                                          endDate.value = null;
                                        }
                                        return null;
                                      },
                                    );
                                  }
                                  return null;
                                },
                              );
                            },
                            icon: const Icon(LucideIcons.calendar),
                            child: Text(
                              endDate.value != null
                                  ? DateFormat('yyyy-MM-dd   hh:mm a').format(
                                      endDate.value!,
                                    )
                                  : 'Pick a end date',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ShadSwitchFormField(
                        id: 'is_active',
                        initialValue: false,
                        inputLabel: const Text('Is Active?'),
                        onChanged: (v) => isActive.value = v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ShadButton.outline(
                            onPressed: () {
                              if (context.canPop()) {
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
                                  startDate.value != null &&
                                  endDate.value != null) {
                                formKey.currentState?.save();
                                FocusScope.of(context).unfocus();
                                final values = formKey.currentState?.fields;
                                ref
                                    .read(addPromotionNotifierProvider.notifier)
                                    .createPromotion(
                                      name: values!['name']!.value.toString(),
                                      description: values['description']!
                                          .value
                                          .toString(),
                                      discountRate: int.tryParse(
                                            values['discountRate']!
                                                .value
                                                .toString(),
                                          ) ??
                                          0,
                                      startDate: startDate.value!,
                                      endDate: endDate.value!,
                                      active: isActive.value,
                                    );
                                formKey.currentState?.reset();
                                startDate.value = null;
                                endDate.value = null;
                                isActive.value = false;
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
