import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product/core/application/product_notifier.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_repository.dart';
import 'package:classic_shop_admin/src/features/product/core/helpers/enums.dart';
import 'package:classic_shop_admin/src/features/product/core/shared/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'searched_product_notifier.g.dart';

@riverpod
class SearchedProductNotifier extends _$SearchedProductNotifier {
  late final ProductRepository _repository;
  @override
  ProductState build() {
    _repository = ref.watch(productRepositoryProvider);
    return ProductState.initial(Fresh.yes([]));
  }

  int _pageSearch = 1;
  int _lastProductIdSearch = 0;

  Future<void> searchProductsPage(String query) async {
    state = ProductState.loadInProgress(
      Fresh.yes([]),
      PaginationConfig.itemsPerPage,
    );
    _pageSearch = 1;
    _lastProductIdSearch = 0;
    final failureOrProducts = await _repository.getProducts(
      _pageSearch,
      productsFunction: ProductsFunction.searchProducts,
      query: query,
    );
    state = failureOrProducts.fold(
      (l) => ProductState.loadFailure(state.products, l),
      (r) {
        _pageSearch++;
        _lastProductIdSearch = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ProductState.loadSuccess(
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

  Future<void> searchProductsNextPage(String query) async {
    state = ProductState.loadInProgress(
      state.products,
      PaginationConfig.itemsPerPage,
    );
    final failureOrProducts = await _repository.getProducts(
      _pageSearch,
      productsFunction: ProductsFunction.searchProductsNextPage,
      lastProductId: _lastProductIdSearch,
      query: query,
    );
    state = failureOrProducts.fold(
      (l) => ProductState.loadFailure(state.products, l),
      (r) {
        _pageSearch++;
        _lastProductIdSearch = r.entity.isEmpty ? 0 : r.entity.last.id;
        return ProductState.loadSuccess(
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
