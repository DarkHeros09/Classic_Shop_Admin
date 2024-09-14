import 'package:classic_shop_admin/src/core/presentation/scaffold_with_bottom_nab_bar.dart';
import 'package:classic_shop_admin/src/features/auth/application/auth_notifier.dart';
import 'package:classic_shop_admin/src/features/auth/presentation/signin_page.dart';
import 'package:classic_shop_admin/src/features/brand/add_brand/presentation/add_brand_page.dart';
import 'package:classic_shop_admin/src/features/brand/brand_update_delete/presentation/brand_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/brand/core/domain/brand.dart';
import 'package:classic_shop_admin/src/features/brand/core/presentation/brands_page.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/add_brand_promotion/presentation/add_brand_promotion_page.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/brand_promotion_update_delete/presentation/brand_promotion_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/domain/brand_promotion.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/presentation/brand_promotions_page.dart';
import 'package:classic_shop_admin/src/features/category/add_category/presentation/add_category_page.dart';
import 'package:classic_shop_admin/src/features/category/category_update_delete/presentation/category_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/category/core/domain/category.dart';
import 'package:classic_shop_admin/src/features/category/core/presentation/categories_page.dart';
import 'package:classic_shop_admin/src/features/category_promotion/add_category_promotion/presentation/add_category_promotion_page.dart';
import 'package:classic_shop_admin/src/features/category_promotion/category_promotion_update_delete/presentation/category_promotion_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/presentation/category_promotions_page.dart';
import 'package:classic_shop_admin/src/features/color/add_color/presentation/add_color_page.dart';
import 'package:classic_shop_admin/src/features/color/color_update_delete/presentation/color_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/color/core/domain/color.dart';
import 'package:classic_shop_admin/src/features/color/core/presentation/colors_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/dashboard_page.dart';
import 'package:classic_shop_admin/src/features/dashboard/presentation/orders_page.dart';
import 'package:classic_shop_admin/src/features/image/domain/image.dart';
import 'package:classic_shop_admin/src/features/manage/core/presentation/manage_page.dart';
import 'package:classic_shop_admin/src/features/product/add_product/presentation/add_product_page.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product.dart';
import 'package:classic_shop_admin/src/features/product/core/presentation/products_page.dart';
import 'package:classic_shop_admin/src/features/product/product_update_delete/presentation/product_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/product_item_images/add_product_item_image_update_delete/presentation/add_product_item_image_page.dart';
import 'package:classic_shop_admin/src/features/product_item_images/core/presentation/product_item_images_page.dart';
import 'package:classic_shop_admin/src/features/product_item_images/product_item_image_/presentation/product_item_image_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/product_items/add_product_item/presentation/add_product_item_page.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/presentation/product_items_page.dart';
import 'package:classic_shop_admin/src/features/product_items/product_item_update_delete/presentation/product_item_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_product_items/presentation/search_page.dart';
import 'package:classic_shop_admin/src/features/product_promotion/add_product_promotion/presentation/add_product_promotion_page.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/domain/product_promotion.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/presentation/product_promotions_page.dart';
import 'package:classic_shop_admin/src/features/product_promotion/product_promotion_update_delete/presentation/product_promotion_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/promotion/add_promotion/presentation/add_promotion_page.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion.dart';
import 'package:classic_shop_admin/src/features/promotion/core/presentation/promotions_page.dart';
import 'package:classic_shop_admin/src/features/promotion/promotion_update_delete/presentation/promotion_update_delete_page.dart';
import 'package:classic_shop_admin/src/features/size/add_size/presentation/add_color_page.dart';
import 'package:classic_shop_admin/src/features/size/core/domain/size.dart';
import 'package:classic_shop_admin/src/features/size/core/presentation/sizes_page.dart';
import 'package:classic_shop_admin/src/features/size/size_update_delete/presentation/size_update_delete_page.dart';
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
  products,
  addProduct,
  productUpdateDelete,
  productItems,
  addProductItem,
  productItemUpdateDelete,
  brands,
  addBrand,
  brandUpdateDelete,
  categories,
  addCategory,
  categoryUpdateDelete,
  productItemImages,
  addProductItemImage,
  productItemImageUpdateDelete,
  colors,
  addColor,
  colorUpdateDelete,
  sizes,
  addSize,
  sizeUpdateDelete,
  promotions,
  addPromotion,
  promotionUpdateDelete,
  productPromotions,
  addProductPromotion,
  productPromotionUpdateDelete,
  brandPromotions,
  addBrandPromotion,
  brandPromotionUpdateDelete,
  categoryPromotions,
  addCategoryPromotion,
  categoryPromotionUpdateDelete,
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
                    return const NoTransitionPage(child: OrdersPage());
                  },
                  redirect: (context, state) {
                    debugPrint('REDIRECT CALLED IN HOME');
                    final isLoggedIn = authState.user.value != null;
                    debugPrint('REDIRECT CALLED $isLoggedIn');
                    return isLoggedIn ? null : '/sign-in';
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
                      path: 'products',
                      name: AppRoute.products.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ProductsPage()),
                      routes: [
                        GoRoute(
                          path: 'add_product',
                          name: AppRoute.addProduct.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddProductPage()),
                        ),
                        GoRoute(
                          path: 'update_delete_product/:id',
                          name: AppRoute.productUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final product = state.extra! as Product;
                            return NoTransitionPage(
                              child: ProductUpdateDeletePage(
                                product: product,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'product_items',
                      name: AppRoute.productItems.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ProductItemsPage()),
                      routes: [
                        GoRoute(
                          path: 'add_product_item',
                          name: AppRoute.addProductItem.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                            child: AddProductItemPage(),
                          ),
                        ),
                        GoRoute(
                          path: 'update_delete_product_item/:id',
                          name: AppRoute.productItemUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final extra = state.extra! as (ProductItem, int);
                            final product = extra.$1;
                            final discountValue = extra.$2;
                            return NoTransitionPage(
                              child: ProductItemUpdateDeletePage(
                                product: product,
                                discountValue: discountValue,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'brands',
                      name: AppRoute.brands.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: BrandsPage()),
                      routes: [
                        GoRoute(
                          path: 'add_brand',
                          name: AppRoute.addBrand.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddBrandPage()),
                        ),
                        GoRoute(
                          path: 'update_delete_brand/:id',
                          name: AppRoute.brandUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final brand = state.extra! as Brand;
                            return NoTransitionPage(
                              child: BrandUpdateDeletePage(
                                brand: brand,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'categories',
                      name: AppRoute.categories.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: CategoriesPage()),
                      routes: [
                        GoRoute(
                          path: 'add_category',
                          name: AppRoute.addCategory.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddCategoryPage()),
                        ),
                        GoRoute(
                          path: 'update_delete_category/:id',
                          name: AppRoute.categoryUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final category = state.extra! as Category;
                            return NoTransitionPage(
                              child: CategoryUpdateDeletePage(
                                category: category,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'product_item_images',
                      name: AppRoute.productItemImages.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ProductItemImagesPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: 'add_product_item_image',
                          name: AppRoute.addProductItemImage.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                            child: AddProductItemImagePage(),
                          ),
                        ),
                        GoRoute(
                          path: 'update_delete_product_item_image/:id',
                          name: AppRoute.productItemImageUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final images =
                                state.extra! as List<ProductImageUrl>;
                            return NoTransitionPage(
                              child: ProductItemImageUpdateDeletePage(
                                id: images[0].id,
                                productImage1: images[0].url,
                                productImage2: images[1].url,
                                productImage3: images[2].url,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'colors',
                      name: AppRoute.colors.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: ColorsPage()),
                      routes: [
                        GoRoute(
                          path: 'add_color',
                          name: AppRoute.addColor.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddColorPage()),
                        ),
                        GoRoute(
                          path: 'update_delete_color/:id',
                          name: AppRoute.colorUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final color = state.extra! as ColorModel;
                            return NoTransitionPage(
                              child: ColorUpdateDeletePage(
                                color: color,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'sizes',
                      name: AppRoute.sizes.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: SizesPage()),
                      routes: [
                        GoRoute(
                          path: 'add_size',
                          name: AppRoute.addSize.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddSizePage()),
                        ),
                        GoRoute(
                          path: 'update_delete_size/:id',
                          name: AppRoute.sizeUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final size = state.extra! as SizeModel;
                            return NoTransitionPage(
                              child: SizeUpdateDeletePage(
                                size: size,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'promotions',
                      name: AppRoute.promotions.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: PromotionsPage()),
                      routes: [
                        GoRoute(
                          path: 'add_promotion',
                          name: AppRoute.addPromotion.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(child: AddPromotionPage()),
                        ),
                        GoRoute(
                          path: 'update_delete_promotion/:id',
                          name: AppRoute.promotionUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final promotion = state.extra! as Promotion;
                            return NoTransitionPage(
                              child: PromotionUpdateDeletePage(
                                promotion: promotion,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'product_promotions',
                      name: AppRoute.productPromotions.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ProductPromotionsPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: 'add_product_promotion',
                          name: AppRoute.addProductPromotion.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                            child: AddProductPromotionPage(),
                          ),
                        ),
                        GoRoute(
                          path:
                              'update_delete_product_promotion/:id/product/:productId',
                          name: AppRoute.productPromotionUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final productPromotion =
                                state.extra! as ProductPromotion;
                            return NoTransitionPage(
                              child: ProductPromotionUpdateDeletePage(
                                productPromotion: productPromotion,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'brand_promotions',
                      name: AppRoute.brandPromotions.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: BrandPromotionsPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: 'add_brand_promotion',
                          name: AppRoute.addBrandPromotion.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                            child: AddBrandPromotionPage(),
                          ),
                        ),
                        GoRoute(
                          path:
                              'update_delete_brand_promotion/:id/brand/:brandId',
                          name: AppRoute.brandPromotionUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final brandPromotion =
                                state.extra! as BrandPromotion;
                            return NoTransitionPage(
                              child: BrandPromotionUpdateDeletePage(
                                brandPromotion: brandPromotion,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'category_promotions',
                      name: AppRoute.categoryPromotions.name,
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: CategoryPromotionsPage(),
                      ),
                      routes: [
                        GoRoute(
                          path: 'add_category_promotion',
                          name: AppRoute.addCategoryPromotion.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) =>
                              const NoTransitionPage(
                            child: AddCategoryPromotionPage(),
                          ),
                        ),
                        GoRoute(
                          path:
                              'update_delete_category_promotion/:id/category/:categoryId',
                          name: AppRoute.categoryPromotionUpdateDelete.name,
                          parentNavigatorKey: _rootNavigatorKey,
                          pageBuilder: (context, state) {
                            final categoryPromotion =
                                state.extra! as CategoryPromotion;
                            return NoTransitionPage(
                              child: CategoryPromotionUpdateDeletePage(
                                categoryPromotion: categoryPromotion,
                              ),
                            );
                          },
                        ),
                      ],
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
