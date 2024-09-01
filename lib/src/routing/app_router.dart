import 'package:classic_shop_admin/src/core/presentation/scaffold_with_bottom_nab_bar.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/presentation/signin_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/home_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_brand/presentation/add_brand_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_brand_promotion/presentation/add_brand_promotion_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_category/presentation/add_category_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_category_promotion/presentation/add_category_promotion_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_color/presentation/add_color_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_image/presentation/add_image_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_product/presentation/add_product_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_product_item/presentation/add_product_item_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_product_promotion/presentation/add_product_promotion_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_promotion/presentation/add_promotion_page.dart';
import 'package:classic_shop_admin/src/features/manage/add_size/presentation/add_color_page.dart';
import 'package:classic_shop_admin/src/features/manage/core/presentation/manage_page.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/presentation/product_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_product_items/presentation/search_page.dart';
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
  productUpdateDelete,
  addProduct,
  addProductItem,
  addBrand,
  addCategory,
  addImage,
  addColor,
  addSize,
  addPromotion,
  addProductPromotion,
  addBrandPromotion,
  addCategoryPromotion,
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
      initialLocation: '/home',
      // initialLocation: '/manage/add_product_item',
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
                      name: AppRoute.productUpdateDelete.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final extra = state.extra! as (ProductItem, int);
                        final product = extra.$1;
                        final discountValue = extra.$2;
                        return NoTransitionPage(
                          child: ProductUpdateDeletePage(
                            product: product,
                            discountValue: discountValue,
                          ),
                        );
                      },
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
                  // redirect: (context, state) {
                  //   debugPrint('REDIRECT CALLED IN MANAGE');
                  //   final isLoggedIn = authState.user.value != null;
                  //   debugPrint('REDIRECT CALLED $isLoggedIn');
                  //   return isLoggedIn ? null : '/sign-in';
                  // },
                  routes: [
                    GoRoute(
                      path: 'add_product',
                      name: AppRoute.addProduct.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddProductPage()),
                    ),
                    GoRoute(
                      path: 'add_product_item',
                      name: AppRoute.addProductItem.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddProductItemPage()),
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
                    GoRoute(
                      path: 'add_color',
                      name: AppRoute.addColor.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddColorPage()),
                    ),
                    GoRoute(
                      path: 'add_size',
                      name: AppRoute.addSize.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddSizePage()),
                    ),
                    GoRoute(
                      path: 'add_promotion',
                      name: AppRoute.addPromotion.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: AddPromotionPage()),
                    ),
                    GoRoute(
                      path: 'add_product_promotion',
                      name: AppRoute.addProductPromotion.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: AddProductPromotionPage(),
                      ),
                    ),
                    GoRoute(
                      path: 'add_brand_promotion',
                      name: AppRoute.addBrandPromotion.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: AddBrandPromotionPage(),
                      ),
                    ),
                    GoRoute(
                      path: 'add_category_promotion',
                      name: AppRoute.addCategoryPromotion.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: AddCategoryPromotionPage(),
                      ),
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
