import 'package:classic_shop_admin/src/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_widget_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  // await for all initialization code to be complete before returning
  // auth
  debugPrint('AUTH PROVIDER CALLED BEFORE');
  ref.listen(
    authNotifierProvider,
    (previous, next) {
      debugPrint('AUTH PROVIDER CALLED');
    },
  );
  // databse
  await Future.wait([
    ref.watch(dbProvider.future),
  ]);
}

class AppWidgetStartup extends ConsumerWidget {
  const AppWidgetStartup({required this.onLoaded, super.key});
  final WidgetBuilder onLoaded;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => onLoaded(context),
      loading: () => const SplashPage(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () {
          ref.invalidate(appStartupProvider);
        },
      ),
    );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    required this.message,
    required this.onRetry,
    super.key,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
