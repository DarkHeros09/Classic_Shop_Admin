import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';

class ListProductsRemoteService extends ProductItemRemoteService {
  ListProductsRemoteService(
    super.productApi,
    super.productAdminApi,
    super.headersCache,
  );

  Future<RemoteResponse<List<ProductItemDTO>>> getProducts({
    required ProductItemsFunction productItemsFunction,
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
    switch (productItemsFunction) {
      case ProductItemsFunction.getProducts:
        return super.fetchProducts(
          productItemsFunction: productItemsFunction,
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

      case ProductItemsFunction.getProductsNextPage:
        return super.fetchProducts(
          productItemsFunction: productItemsFunction,
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

      case ProductItemsFunction.searchProducts:
        return super.fetchProducts(
          productItemsFunction: productItemsFunction,
          requestUri: requestUri,
          pageSize: pageSize,
          query: query,
        );

      case ProductItemsFunction.searchProductsNextPage:
        return super.fetchProducts(
          productItemsFunction: productItemsFunction,
          requestUri: requestUri,
          lastItemId: lastItemId,
          lastProductId: lastProductId,
          pageSize: pageSize,
          query: query,
        );

      case ProductItemsFunction.getProductsWithPromotions:
      case ProductItemsFunction.getProductsWithBrandPromotions:
      case ProductItemsFunction.getProductsWithCategoryPromotions:
        return super.fetchProducts(
          productId: productId,
          brandId: brandId,
          categoryId: categoryId,
          productItemsFunction: productItemsFunction,
          requestUri: requestUri,
          pageSize: pageSize,
        );

      case ProductItemsFunction.getProductsWithPromotionsNextPage:
      case ProductItemsFunction.getProductsWithBrandPromotionsNextPage:
      case ProductItemsFunction.getProductsWithCategoryPromotionsNextPage:
        return super.fetchProducts(
          productItemsFunction: productItemsFunction,
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
