import 'package:classic_shop_admin/src/core/presentation/scaffold_with_bottom_nab_bar.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/presentation/signin_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/home_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_brand/presentation/add_brand_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_category/presentation/add_category_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_image/presentation/add_image_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_product/presentation/add_product_page.dart';
import 'package:classic_shop_admin/src/features/manage/core/presentation/manage_page.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/product_crud.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/presentation/search_page.dart';
import 'package:classic_shop_admin/src/features/splash/presentation/splash_page.dart';
import 'package:classic_shop_admin/src/helpers/riverpod_observer.dart';
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
  manage,
  splash,
  updateDeleteProduct,
  addProduct,
  addBrand,
  addCategory,
  addImage,
  search,
}

@Riverpod(keepAlive: true, dependencies: [])
StatefulNavigationShell childWidget(ChildWidgetRef ref) =>
    throw UnimplementedError();

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorDashboardKey =
    GlobalKey<NavigatorState>(debugLabel: 'dashborad');
final _shellNavigatorManageKey =
    GlobalKey<NavigatorState>(debugLabel: 'manage');

@Riverpod(keepAlive: true)
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
          path: '/search',
          name: AppRoute.search.name,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SearchPage());
          },
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
              observers: [
                RiverpodObserver(),
              ],
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
                    debugPrint('REDIRECT CALLED IN HOME');
                    final isLoggedIn = authState.user.value != null;
                    debugPrint('REDIRECT CALLED $isLoggedIn');
                    return isLoggedIn ? null : '/sign-in';
                  },
                  routes: [
                    GoRoute(
                      path: 'update_delete_product/:id',
                      name: AppRoute.updateDeleteProduct.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ProductCrud()),
                    ),
                  ],
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
                    debugPrint('REDIRECT CALLED IN DASHBOARD');
                    final isLoggedIn = authState.user.value != null;
                    debugPrint('REDIRECT CALLED $isLoggedIn');
                    return isLoggedIn ? null : '/sign-in';
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorManageKey,
              routes: [
                GoRoute(
                  path: '/manage',
                  name: AppRoute.manage.name,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: ManagePage());
                  },
                  redirect: (context, state) {
                    debugPrint('REDIRECT CALLED IN MANAGE');
                    final isLoggedIn = authState.user.value != null;
                    debugPrint('REDIRECT CALLED $isLoggedIn');
                    return isLoggedIn ? null : '/sign-in';
                  },
                  routes: [
                    GoRoute(
                      path: 'add_product',
                      name: AppRoute.addProduct.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddProductPage()),
                    ),
                    GoRoute(
                      path: 'add_brand',
                      name: AppRoute.addBrand.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddBrandPage()),
                    ),
                    GoRoute(
                      path: 'add_category',
                      name: AppRoute.addCategory.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddCategoryPage()),
                    ),
                    GoRoute(
                      path: 'add_image',
                      name: AppRoute.addImage.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddImagePage()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
