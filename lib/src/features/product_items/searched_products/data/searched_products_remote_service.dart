import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_remote_service.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';

class SearchedProductsRemoteService extends ProductItemRemoteService {
  SearchedProductsRemoteService(super.productApi, super.headersCache);

  Future<RemoteResponse<List<ProductItemDTO>>> searchProducts({
    required String query,
  }) async {
    return super.fetchProducts(
      productsFunction: ProductsFunction.searchProducts,
      query: query,
      requestUri: Uri.http(
        Env.httpAddress,
        '/api/v1/search-product-items',
        {
          'query': query,
          'limit': PaginationConfig.itemsPerPage.toString(),
        },
      ),
    );
  }

  Future<RemoteResponse<List<ProductItemDTO>>> searchProductsNextPage({
    required String query,
    required int lastItemId,
    required int lastProductId,
  }) async {
    return super.fetchProducts(
      productsFunction: ProductsFunction.searchProductsNextPage,
      query: query,
      lastItemId: lastItemId,
      requestUri: Uri.http(
        Env.httpAddress,
        '/api/v1/search-product-items-next-page',
        {
          'query': query,
          'limit': PaginationConfig.itemsPerPage.toString(),
          'cursor': lastItemId.toString(),
        },
      ),
    );
  }
}
