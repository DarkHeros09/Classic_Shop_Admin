// final signInFormKeyProvider = Provider((ref) {
//   return GlobalKey<FormBuilderState>();
// });

import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/presentation/widgets/custom_form_builder_text_field.dart';
import 'package:classic_shop_admin/src/helpers/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  late final GlobalKey<FormBuilderState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController usernameController;
  late final TextEditingController telephoneController;
  // late final FocusScopeNode focus;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormBuilderState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    telephoneController = TextEditingController();
    // focus = FocusScopeNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    telephoneController.dispose();
    formKey.currentState?.dispose();
    // focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.mapOrNull(
        loading: (_) => showDialog<Widget>(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        authenticated: (_) {
          final validated = formKey.currentState?.validate();
          if (validated != null && validated) {
            FocusScope.of(context).unfocus();
            formKey.currentState?.reset();
          }
          if (context.canPop()) {
            context.pop();
          }
        },
        failure: (value) {
          value.failure.mapOrNull(
            server: (serverErr) {
              if (context.canPop()) {
                context.pop();
              }
              return showAuthErrorToast(
                'حدث خطأ ما.',
                context,
              );
            },
          );
        },
      );
    });
    final appTheme = Theme.of(context);
    // final formKey = ref.watch(signInFormKeyProvider);
    final height = MediaQuery.sizeOf(context).height + kToolbarHeight;

    return Scaffold(
      body: FormBuilder(
        key: formKey,
        child: ListView(
          children: [
            // height * .40

            SizedBox(height: height * .034),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'تسجيل الدخول',
                  style: appTheme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: height * .042),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomFormBuilderTextField(
                textDirection: TextDirection.ltr,
                name: 'email',
                labelText: 'البريد الإلكتروني',
                errorStyle: const TextStyle(fontSize: 12),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'هذا الحقل لا يمكن أن يكون فارغاً',
                  ),
                  FormBuilderValidators.email(
                    errorText: 'يرجى إدخال الإيميل الخاص بك بشكل صحيح',
                  ),
                ]),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: height * .021,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomFormBuilderTextField(
                textDirection: TextDirection.ltr,
                obscureText: true,
                name: 'password',
                labelText: 'كلمة المرور',
                errorStyle: const TextStyle(fontSize: 12),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'هذا الحقل لا يمكن أن يكون فارغاً',
                  ),
                  FormBuilderValidators.minLength(
                    6,
                    errorText: 'كلمة المرور قصيرة جداً',
                  ),
                ]),
              ),
            ),
            SizedBox(height: height * .034),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  final validated = formKey.currentState?.validate();
                  if (validated != null && validated) {
                    final values = formKey.currentState?.fields;
                    ref.read(authNotifierProvider.notifier).signIn(
                          email: values!['email']!.value.toString(),
                          password: values['password']!.value.toString(),
                        );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9D331F),
                  disabledBackgroundColor: Colors.grey,
                  fixedSize: const Size(double.maxFinite, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                child: Text(
                  'تسجيل دخول',
                  style: appTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .010,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب؟',
                  style: appTheme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
