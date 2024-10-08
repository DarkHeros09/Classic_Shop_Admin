import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_dto.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_extensions.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item_failure.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_local_service.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_remote_service.dart';
import 'package:dartz/dartz.dart';

class ListProductsRepository {
  ListProductsRepository(
    this._remoteService,
    this._localService,
    this._headersCache,
  );

  final ListProductsRemoteService _remoteService;
  final ListProductsLocalService _localService;
  final ResponseHeadersCache _headersCache;

  Map<String, String> _createQueryParams({
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
  }) {
    final pageSizeString = pageSize == null
        ? PaginationConfig.itemsPerPage.toString()
        : pageSize.toString();
    final queryParams = {
      'limit': pageSizeString,
    };
    if (lastItemId != null) {
      queryParams['last_item_id'] = lastItemId.toString();
    }
    if (lastProductId != null) {
      queryParams['last_product_id'] = lastProductId.toString();
    }
    if (query != null) {
      queryParams['query'] = query;
    }
    if (productId != null) {
      queryParams['product_id'] = categoryId.toString();
    }
    if (categoryId != null) {
      queryParams['category_id'] = categoryId.toString();
    }
    if (brandId != null) {
      queryParams['brand_id'] = brandId.toString();
    }
    if (colorId != null) {
      queryParams['color_id'] = colorId.toString();
    }
    if (sizeId != null) {
      queryParams['size_id'] = sizeId.toString();
    }
    if (isNew != null) {
      queryParams['is_new'] = isNew.toString();
    }
    if (isPromoted != null) {
      queryParams['is_promoted'] = isPromoted.toString();
    }
    if (orderByLowPrice != null) {
      queryParams['order_by_low_price'] = orderByLowPrice.toString();
    }
    if (orderByHighPrice != null) {
      queryParams['order_by_high_price'] = orderByHighPrice.toString();
    }
    return queryParams;
  }

  Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>> getProducts(
    int page, {
    required ProductItemsFunction productItemsFunction,
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
    try {
      late final RemoteResponse<List<ProductItemDTO>> remotePageProducts;
      late final Uri requestUri;
      final queryParams = _createQueryParams(
        lastItemId: lastItemId,
        lastProductId: lastProductId,
        pageSize: pageSize,
        productId: productId,
        brandId: brandId,
        categoryId: categoryId,
        colorId: colorId,
        sizeId: sizeId,
        isNew: isNew,
        isPromoted: isPromoted,
        orderByLowPrice: orderByLowPrice,
        orderByHighPrice: orderByHighPrice,
      );
      switch (productItemsFunction) {
        case ProductItemsFunction.getProducts:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-V2',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            lastItemId: lastItemId,
            lastProductId: lastProductId,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.searchProducts:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/search-product-items',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            query: query,
          );

        case ProductItemsFunction.searchProductsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/search-product-items-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            query: query,
            requestUri: requestUri,
            pageSize: pageSize,
            lastItemId: lastItemId,
            lastProductId: lastProductId,
          );

        case ProductItemsFunction.getProductsWithPromotions:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-promotions',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            productId: productId,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsWithPromotionsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-promotions-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            lastItemId: lastItemId,
            lastProductId: lastProductId,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsWithBrandPromotions:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-brand-promotions',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsWithBrandPromotionsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-brand-promotions-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            lastItemId: lastItemId,
            lastProductId: lastProductId,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsWithCategoryPromotions:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-category-promotions',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );

        case ProductItemsFunction.getProductsWithCategoryPromotionsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/product-items-with-category-promotions-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.getProducts(
            productItemsFunction: productItemsFunction,
            requestUri: requestUri,
            lastItemId: lastItemId,
            lastProductId: lastProductId,
            pageSize: pageSize,
            categoryId: categoryId,
            brandId: brandId,
            colorId: colorId,
            sizeId: sizeId,
            isNew: isNew,
            isPromoted: isPromoted,
            orderByLowPrice: orderByLowPrice,
            orderByHighPrice: orderByHighPrice,
          );
      }
      return await _rightRemotePageProducts(
        remotePageProducts,
        page,
        requestUri,
      );
    } on RestApiException catch (e) {
      return left(ProductItemFailure.api(e.errorCode));
    }
  }

  Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>>
      _rightRemotePageProducts(
    RemoteResponse<List<ProductItemDTO>> remotePageProducts,
    int page,
    Uri requestUri,
  ) async {
    return right(
      await remotePageProducts.when(
        noConnection: (nextAvailable) async => Fresh.no(
          await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain()),
          isNextPageAvailable: page <
              await _localService.getLocalPageCount(requestUri.toString()),
        ),
        noContent: () async {
          await _localService.deleteByUri(requestUri.toString());
          return Fresh.no([], isNextPageAvailable: false);
        },
        notModified: (nextAvailable) async {
          final localData = await _localService
              .getPage(page, requestUri.toString())
              .then((_) => _.toDomain());

          if (localData.isEmpty) {
            await _headersCache.deleteHeaders(requestUri);
          }
          return Fresh.yes(
            localData,
            isNextPageAvailable: nextAvailable,
          );
        },
        withNewData: (data, nextAvailable) async {
          // await _localService.deletePage(page);
          await _localService.upsertPage(data, page, requestUri.toString());
          return Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: nextAvailable,
          );
        },
      ),
    );
  }
}
