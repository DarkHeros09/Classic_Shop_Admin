import 'package:classic_shop_admin/src/core/data/network_exceptions.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product_items/core/data/product_item_extensions.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item_failure.dart';
import 'package:classic_shop_admin/src/features/product_items/searched_products/data/searched_products_remote_service.dart';
import 'package:dartz/dartz.dart';

class SearchedProductsRepository {
  SearchedProductsRepository(this._remoteService);

  final SearchedProductsRemoteService _remoteService;

  Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>> searchProducts(
    String query,
    int page,
  ) async {
    try {
      final remotePageProducts = await _remoteService.searchProducts(
        query: query,
      );
      return right(
        await remotePageProducts.maybeWhen(
          withNewData: (data, nextAvailable) async => Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: nextAvailable,
          ),
          orElse: () => Fresh.no([], isNextPageAvailable: false),
        ),
      );
    } on RestApiException catch (e) {
      return left(ProductItemFailure.api(e.errorCode));
    }
  }

  Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>>
      searchProductsNextPage(
    String query,
    int page,
    int lastItemId,
    int lastProductId,
  ) async {
    try {
      final remotePageProducts = await _remoteService.searchProductsNextPage(
        query: query,
        lastItemId: lastItemId,
        lastProductId: lastProductId,
      );
      return right(
        await remotePageProducts.maybeWhen(
          withNewData: (data, nextAvailable) async {
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: nextAvailable,
            );
          },
          orElse: () => Fresh.no([], isNextPageAvailable: false),
        ),
      );
    } on RestApiException catch (e) {
      return left(ProductItemFailure.api(e.errorCode));
    }
  }
}
