import 'package:classic_shop_admin/src/core/presentation/scaffold_with_bottom_nab_bar.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/presentation/signin_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/home_page.dart';
import 'package:classic_shop_admin/src/features/splash/presentation/splash_page.dart';
import 'package:classic_shop_admin/src/routing/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  signIn,
  home,
  dashboard,
  splash,
  productDetails,
}

@riverpod
StatefulNavigationShell childWidget(ChildWidgetRef ref) =>
    throw UnimplementedError();

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: 'dashborad');

@riverpod
class GoRouterConfig extends _$GoRouterConfig {
  @override
  GoRouter build() {
    final auth = ref.watch(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    return GoRouter(
      // initialLocation: '/dashboard',
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      refreshListenable: GoRouterRefreshStream(
        [
          auth.authStateChanges(),
        ],
      ),
      routes: [
        GoRoute(
          path: '/splash',
          name: AppRoute.splash.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SignInPage());
          },
          redirect: (context, state) {
            final isLoggedIn = authState.user.value != null;
            debugPrint('APPROUTER IS LOGGEDIN: $isLoggedIn');
            debugPrint('USER IS ${authState.user.value}');
            return isLoggedIn ? '/home' : null;
          },
        ),
        StatefulShellRoute.indexedStack(
          // navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ProviderScope(
              // key: GlobalObjectKey(state.pageKey),
              overrides: [childWidgetProvider.overrideWithValue(child)],
              child: const ScaffoldWithBottomNavBar(),
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/home',
                  name: AppRoute.home.name,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: HomePage());
                  },
                  redirect: (context, state) {
                    final isLoggedIn = authState.user.value != null;
                    return isLoggedIn ? '/home' : '/sign-in';
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorDashboardKey,
              routes: [
                GoRoute(
                  path: '/dashboard',
                  name: AppRoute.dashboard.name,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: DashboardPage());
                  },
                  redirect: (context, state) {
                    final isLoggedIn = authState.user.value != null;
                    return isLoggedIn ? '/dashboard' : '/sign-in';
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
