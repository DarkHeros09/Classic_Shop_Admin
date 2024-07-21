import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';

class ListProductsRemoteService extends ProductItemRemoteService {
  ListProductsRemoteService(super.productApi, super.headersCache);

  Future<RemoteResponse<List<ProductItemDTO>>> getProducts({
    required ProductsFunction productsFunction,
    required Uri requestUri,
    int? lastItemId,
    int? lastProductId,
    int? productId,
    int? categoryId,
    int? brandId,
    int? sizeId,
    int? colorId,
    String? query,
    int? pageSize,
    bool? isNew,
    bool? isPromoted,
    bool? orderByLowPrice,
    bool? orderByHighPrice,
  }) async {
    switch (productsFunction) {
      case ProductsFunction.getProducts:
        return super.fetchProducts(
          productsFunction: productsFunction,
          categoryId: categoryId,
          brandId: brandId,
          colorId: colorId,
          sizeId: sizeId,
          requestUri: requestUri,
          pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          isNew: isNew,
          isPromoted: isPromoted,
          orderByLowPrice: orderByLowPrice,
          orderByHighPrice: orderByHighPrice,
        );

      case ProductsFunction.getProductsNextPage:
        return super.fetchProducts(
          productsFunction: productsFunction,
          lastItemId: lastItemId,
          lastProductId: lastProductId,
          categoryId: categoryId,
          brandId: brandId,
          colorId: colorId,
          sizeId: sizeId,
          requestUri: requestUri,
          pageSize: pageSize ?? PaginationConfig.itemsPerPage,
          isNew: isNew,
          isPromoted: isPromoted,
          orderByLowPrice: orderByLowPrice,
          orderByHighPrice: orderByHighPrice,
        );

      case ProductsFunction.searchProducts:
        return super.fetchProducts(
          productsFunction: productsFunction,
          requestUri: requestUri,
          pageSize: pageSize,
          query: query,
        );

      case ProductsFunction.searchProductsNextPage:
        return super.fetchProducts(
          productsFunction: productsFunction,
          requestUri: requestUri,
          lastItemId: lastItemId,
          lastProductId: lastProductId,
          pageSize: pageSize,
          query: query,
        );

      case ProductsFunction.getProductsWithPromotions:
      case ProductsFunction.getProductsWithBrandPromotions:
      case ProductsFunction.getProductsWithCategoryPromotions:
        return super.fetchProducts(
          productId: productId,
          brandId: brandId,
          categoryId: categoryId,
          productsFunction: productsFunction,
          requestUri: requestUri,
          pageSize: pageSize,
        );

      case ProductsFunction.getProductsWithPromotionsNextPage:
      case ProductsFunction.getProductsWithBrandPromotionsNextPage:
      case ProductsFunction.getProductsWithCategoryPromotionsNextPage:
        return super.fetchProducts(
          productsFunction: productsFunction,
          brandId: brandId,
          categoryId: categoryId,
          requestUri: requestUri,
          lastItemId: lastItemId,
          lastProductId: lastProductId,
          pageSize: pageSize,
        );
    }
  }
}
