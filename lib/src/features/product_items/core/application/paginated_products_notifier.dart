import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item_failure.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_products_notifier.freezed.dart';
part 'paginated_products_notifier.g.dart';

typedef RepositoryGetter
    = Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>> Function(
        int page, int lastItemId, int lastProductId);

@freezed
class PaginatedProductsState with _$PaginatedProductsState {
  const PaginatedProductsState._();
  const factory PaginatedProductsState.initial(
    Fresh<List<ProductItem>> products,
  ) = _Initial;
  const factory PaginatedProductsState.loadInProgress(
    Fresh<List<ProductItem>> products,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory PaginatedProductsState.loadSuccess(
    Fresh<List<ProductItem>> products, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory PaginatedProductsState.loadFailure(
    Fresh<List<ProductItem>> products,
    ProductItemFailure failure,
  ) = _LoadFailure;
}

@riverpod
class PaginatedProductsNotifier extends _$PaginatedProductsNotifier {
  @override
  PaginatedProductsState build() {
    return state = PaginatedProductsState.initial(Fresh.yes([]));
  }

  int _page = 1;
  int _lastItemId = 0;
  int _lastProductId = 0;
  int _pageSearch = 1;
  int _lastItemIdSearch = 0;
  int _lastProductIdSearch = 0;
  int _pagePromotion = 1;
  int _lastItemIdPromotion = 0;
  int _lastProductIdPromotion = 0;
  int _pageBrandPromotion = 1;
  int _lastItemIdBrandPromotion = 0;
  int _lastProductIdBrandPromotion = 0;
  int _pageCategoryPromotion = 1;
  int _lastItemIdCategoryPromotion = 0;
  int _lastProductIdCategoryPromotion = 0;

  Future<void> getPage(
    RepositoryGetter getter,
    ProductItemsFunction productFunction,
  ) async {
    // state = PaginatedProductsState.loadFailure(
    //   state.products,
    //   const ProductItemFailure.api(404),
    // );
    state = PaginatedProductsState.loadInProgress(
      state.products,
      PaginationConfig.itemsPerPage,
    );
    final failureOrProducts = await getter(
      switch (productFunction) {
        ProductItemsFunction.getProducts => _page = 1,
        ProductItemsFunction.getProductsNextPage => _page,
        ProductItemsFunction.searchProducts => _pageSearch = 1,
        ProductItemsFunction.searchProductsNextPage => _pageSearch,
        ProductItemsFunction.getProductsWithPromotions => _pagePromotion = 1,
        ProductItemsFunction.getProductsWithPromotionsNextPage =>
          _pagePromotion,
        ProductItemsFunction.getProductsWithBrandPromotions =>
          _pageBrandPromotion = 1,
        ProductItemsFunction.getProductsWithBrandPromotionsNextPage =>
          _pageBrandPromotion,
        ProductItemsFunction.getProductsWithCategoryPromotions =>
          _pageCategoryPromotion = 1,
        ProductItemsFunction.getProductsWithCategoryPromotionsNextPage =>
          _pageCategoryPromotion,
      },
      switch (productFunction) {
        ProductItemsFunction.getProducts => _lastItemId = 0,
        ProductItemsFunction.getProductsNextPage => _lastItemId,
        ProductItemsFunction.searchProducts => _lastItemIdSearch = 0,
        ProductItemsFunction.searchProductsNextPage => _lastItemIdSearch,
        ProductItemsFunction.getProductsWithPromotions => _lastItemIdPromotion =
            0,
        ProductItemsFunction.getProductsWithPromotionsNextPage =>
          _lastItemIdPromotion,
        ProductItemsFunction.getProductsWithBrandPromotions =>
          _lastItemIdBrandPromotion = 0,
        ProductItemsFunction.getProductsWithBrandPromotionsNextPage =>
          _lastItemIdBrandPromotion,
        ProductItemsFunction.getProductsWithCategoryPromotions =>
          _lastItemIdCategoryPromotion = 0,
        ProductItemsFunction.getProductsWithCategoryPromotionsNextPage =>
          _lastItemIdCategoryPromotion,
      },
      switch (productFunction) {
        ProductItemsFunction.getProducts => _lastProductId = 0,
        ProductItemsFunction.getProductsNextPage => _lastProductId,
        ProductItemsFunction.searchProducts => _lastProductIdSearch = 0,
        ProductItemsFunction.searchProductsNextPage => _lastProductIdSearch,
        ProductItemsFunction.getProductsWithPromotions =>
          _lastProductIdPromotion = 0,
        ProductItemsFunction.getProductsWithPromotionsNextPage =>
          _lastProductIdPromotion,
        ProductItemsFunction.getProductsWithBrandPromotions =>
          _lastProductIdBrandPromotion = 0,
        ProductItemsFunction.getProductsWithBrandPromotionsNextPage =>
          _lastProductIdBrandPromotion,
        ProductItemsFunction.getProductsWithCategoryPromotions =>
          _lastProductIdCategoryPromotion = 0,
        ProductItemsFunction.getProductsWithCategoryPromotionsNextPage =>
          _lastProductIdCategoryPromotion,
      },
    );
    state = failureOrProducts.fold(
      (l) => PaginatedProductsState.loadFailure(state.products, l),
      (r) {
        switch (productFunction) {
          case ProductItemsFunction.getProducts:
          case ProductItemsFunction.getProductsNextPage:
            _page++;
            debugPrint(r.toString());
            _lastItemId = r.entity.isEmpty ? 0 : r.entity.last.id;
            _lastProductId = r.entity.isEmpty ? 0 : r.entity.last.productId;

          case ProductItemsFunction.searchProducts:
          case ProductItemsFunction.searchProductsNextPage:
            _pageSearch++;
            debugPrint(r.toString());
            _lastItemIdSearch = r.entity.isEmpty ? 0 : r.entity.last.id;
            _lastProductIdSearch =
                r.entity.isEmpty ? 0 : r.entity.last.productId;

          case ProductItemsFunction.getProductsWithPromotions:
          case ProductItemsFunction.getProductsWithPromotionsNextPage:
            _pagePromotion++;
            debugPrint(r.toString());
            _lastItemIdPromotion = r.entity.isEmpty ? 0 : r.entity.last.id;
            _lastProductIdPromotion =
                r.entity.isEmpty ? 0 : r.entity.last.productId;
          case ProductItemsFunction.getProductsWithBrandPromotions:
          case ProductItemsFunction.getProductsWithBrandPromotionsNextPage:
            _pageBrandPromotion++;
            debugPrint(r.toString());
            _lastItemIdBrandPromotion = r.entity.isEmpty ? 0 : r.entity.last.id;
            _lastProductIdBrandPromotion =
                r.entity.isEmpty ? 0 : r.entity.last.productId;
          case ProductItemsFunction.getProductsWithCategoryPromotions:
          case ProductItemsFunction.getProductsWithCategoryPromotionsNextPage:
            _pageCategoryPromotion++;
            debugPrint(r.toString());
            _lastItemIdCategoryPromotion =
                r.entity.isEmpty ? 0 : r.entity.last.id;
            _lastProductIdCategoryPromotion =
                r.entity.isEmpty ? 0 : r.entity.last.productId;
        }
        return PaginatedProductsState.loadSuccess(
          r.copyWith(
            entity: [
              ...state.products.entity,
              ...r.entity,
            ],
          ),
          isNextPageAvailable: r.isNextPageAvailable ?? false,
        );
      },
    );
  }
}
