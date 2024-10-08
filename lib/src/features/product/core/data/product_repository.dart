import 'package:classic_shop_admin/gen/env.g.dart';
import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/data/remote_response.dart';
import 'package:classic_shop_admin/src/core/data/response_headers_cache.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_dto.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_extension.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_local_service.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_remote_service.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product_failure.dart';
import 'package:classic_shop_admin/src/features/product/core/helpers/enums.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  ProductRepository(
    this._localService,
    this._remoteService,
    this._headersCache,
  );

  final ProductLocalService _localService;
  final ProductRemoteService _remoteService;
  final ResponseHeadersCache _headersCache;

  Map<String, String> _createQueryParams({
    int? lastProductId,
    String? query,
    int? pageSize,
  }) {
    final pageSizeString = pageSize == null
        ? PaginationConfig.itemsPerPage.toString()
        : pageSize.toString();
    final queryParams = {
      'limit': pageSizeString,
    };
    if (lastProductId != null) {
      queryParams['last_product_id'] = lastProductId.toString();
    }
    if (query != null) {
      queryParams['query'] = query;
    }
    return queryParams;
  }

  Future<Either<ProductFailure, Fresh<List<Product>>>> listAllProducts(
    int page,
  ) async {
    try {
      final requestUri = Uri.http(
        Env.httpAddress,
        '/api/v1/products',
      );
      final remotePageProducts = await _remoteService.listAllProducts(
        requestUri: requestUri,
      );

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
    } on RestApiException catch (e) {
      return left(ProductFailure.api(e.errorCode));
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Either<ProductFailure, Unit>> createProduct({
    required int adminId,
    required String name,
    required String description,
    required int categoryId,
    required int brandId,
    required bool isActive,
  }) async {
    try {
      final product = await _remoteService.createProduct(
        adminId: adminId,
        name: name,
        description: description,
        categoryId: categoryId,
        brandId: brandId,
        isActive: isActive,
      );

      return await product.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ProductFailure.server('Could not create product')),
      );
    } on RestApiException catch (e) {
      return left(ProductFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ProductFailure.server('Could not create product'));
    }
  }

  Future<Either<ProductFailure, Fresh<List<Product>>>> getProducts(
    int page, {
    required ProductsFunction productsFunction,
    int? lastProductId,
    String? query,
    int? pageSize,
  }) async {
    try {
      late final RemoteResponse<List<ProductDTO>> remotePageProducts;
      late final Uri requestUri;
      final queryParams = _createQueryParams(
        lastProductId: lastProductId,
        pageSize: pageSize,
      );
      switch (productsFunction) {
        case ProductsFunction.getProducts:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/products-V2',
            queryParams,
          );
          remotePageProducts = await _remoteService.fetchProducts(
            productsFunction: productsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
          );

        case ProductsFunction.getProductsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/products-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.fetchProducts(
            productsFunction: productsFunction,
            requestUri: requestUri,
            lastProductId: lastProductId,
            pageSize: pageSize,
          );

        case ProductsFunction.searchProducts:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/search-products',
            queryParams,
          );
          remotePageProducts = await _remoteService.fetchProducts(
            productsFunction: productsFunction,
            requestUri: requestUri,
            pageSize: pageSize,
            query: query,
          );

        case ProductsFunction.searchProductsNextPage:
          requestUri = Uri.http(
            Env.httpAddress,
            '/api/v1/search-products-next-page',
            queryParams,
          );
          remotePageProducts = await _remoteService.fetchProducts(
            productsFunction: productsFunction,
            query: query,
            requestUri: requestUri,
            pageSize: pageSize,
            lastProductId: lastProductId,
          );
      }
      return await _rightRemotePageProducts(
        remotePageProducts,
        page,
        requestUri,
      );
    } on RestApiException catch (e) {
      return left(ProductFailure.api(e.errorCode));
    }
  }

  Future<Either<ProductFailure, Fresh<List<Product>>>> _rightRemotePageProducts(
    RemoteResponse<List<ProductDTO>> remotePageProducts,
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

  Future<Either<ProductFailure, Unit>> updateProduct({
    required int adminId,
    required int productId,
    int? categoryId,
    int? brandId,
    String? name,
    String? description,
    bool? active,
  }) async {
    try {
      final product = await _remoteService.updateProduct(
        adminId: adminId,
        productId: productId,
        categoryId: categoryId,
        brandId: brandId,
        name: name,
        description: description,
        active: active,
      );

      return await product.maybeWhen(
        withNewData: (data, _) async {
          return right(unit);
        },
        orElse: () =>
            left(const ProductFailure.server('Could not create product')),
      );
    } on RestApiException catch (e) {
      return left(ProductFailure.api(e.errorCode));
    } on Exception catch (_) {
      return left(const ProductFailure.server('Could not create product'));
    }
  }
}
