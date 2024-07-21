import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product_items/core/application/paginated_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item.dart';
import 'package:classic_shop_admin/src/features/product_items/core/domain/product_item_failure.dart';
import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_products_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<ProductItemFailure, Fresh<List<ProductItem>>>> Function(
        int page, int lastItemId);

@freezed
class DashboardProductsState with _$DashboardProductsState {
  const DashboardProductsState._();
  const factory DashboardProductsState.initial(
    Fresh<List<ProductItem>> products,
  ) = _Initial;
  const factory DashboardProductsState.loadInProgress(
    Fresh<List<ProductItem>> products,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory DashboardProductsState.loadSuccess(
    Fresh<List<ProductItem>> products, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory DashboardProductsState.loadFailure(
    Fresh<List<ProductItem>> products,
    ProductItemFailure failure,
  ) = _LoadFailure;
}

class DashboardProductsNotifier extends PaginatedProductsNotifier {
  late final ListProductsRepository _repository;
  @override
  PaginatedProductsState build() {
    _repository = ref.watch(listProductsRepositoryProvider);
    return state = PaginatedProductsState.initial(Fresh.yes([]));
  }

  Future<void> getProductsPage({
    required ProductsFunction productsFunction,
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
    await super.getPage(
      (page, lastItemId, lastProductId) => _repository.getProducts(
        page,
        lastItemId: lastItemId,
        lastProductId: lastProductId,
        productsFunction: productsFunction,
        productId: productId,
        categoryId: categoryId,
        brandId: brandId,
        colorId: colorId,
        sizeId: sizeId,
        query: query,
        pageSize: pageSize,
        isNew: isNew,
        isPromoted: isPromoted,
        orderByLowPrice: orderByLowPrice,
        orderByHighPrice: orderByHighPrice,
      ),
      productsFunction,
    );
  }
}
