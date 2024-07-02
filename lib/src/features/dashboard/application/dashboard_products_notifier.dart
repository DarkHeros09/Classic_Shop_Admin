import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/products/core/application/paginated_products_notifier.dart';
import 'package:classic_shop_admin/src/features/products/core/domain/product.dart';
import 'package:classic_shop_admin/src/features/products/core/domain/product_failure.dart';
import 'package:classic_shop_admin/src/features/products/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/products/helper/enums.dart';
import 'package:classic_shop_admin/src/features/products/listed_products/data/list_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_products_notifier.freezed.dart';

typedef RepositoryGetter = Future<Either<ProductFailure, Fresh<List<Product>>>>
    Function(int page, int lastItemId);

@freezed
class DashboardProductsState with _$DashboardProductsState {
  const DashboardProductsState._();
  const factory DashboardProductsState.initial(
    Fresh<List<Product>> products,
  ) = _Initial;
  const factory DashboardProductsState.loadInProgress(
    Fresh<List<Product>> products,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory DashboardProductsState.loadSuccess(
    Fresh<List<Product>> products, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory DashboardProductsState.loadFailure(
    Fresh<List<Product>> products,
    ProductFailure failure,
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
