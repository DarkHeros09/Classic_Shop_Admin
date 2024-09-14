import 'package:classic_shop_admin/src/core/data/pagination_config.dart';
import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product/core/data/product_repository.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product.dart';
import 'package:classic_shop_admin/src/features/product/core/domain/product_failure.dart';
import 'package:classic_shop_admin/src/features/product/core/helpers/enums.dart';
import 'package:classic_shop_admin/src/features/product/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_notifier.freezed.dart';
part 'product_notifier.g.dart';

@freezed
class ProductState with _$ProductState {
  const ProductState._();
  const factory ProductState.initial(
    Fresh<List<Product>> products,
  ) = _Initial;
  const factory ProductState.loadInProgress(
    Fresh<List<Product>> products,
    int itemsPerPage,
  ) = _LoadInProgress;
  const factory ProductState.loadSuccess(
    Fresh<List<Product>> products, {
    required bool isNextPageAvailable,
  }) = _LoadSuccess;
  const factory ProductState.loadFailure(
    Fresh<List<Product>> products,
    ProductFailure failure,
  ) = _LoadFailure;
}

@Riverpod(dependencies: [])
class ProductNotifier extends _$ProductNotifier {
  late final ProductRepository _repository;
  @override
  ProductState build() {
    _repository = ref.watch(productRepositoryProvider);
    getProductsPage();
    return state;
    // return ProductState.initial(Fresh.yes([]));
  }

  int _page = 1;
  int _lastProductId = 0;

  Future<void> getProductsPage() async {
    state = ProductState.loadInProgress(
      Fresh.yes([]),
      PaginationConfig.itemsPerPage,
    );
    _page = 1;
    _lastProductId = 0;
    final failureOrProducts = await _repository.getProducts(
      _page,
      productsFunction: ProductsFunction.getProducts,
      pageSize: PaginationConfig.itemsPerPage,
    );
    state = failureOrProducts.fold(
      (l) => ProductState.loadFailure(state.products, l),
      (r) {
        _page++;
        _lastProductId = r.entity.isEmpty ? 0 : r.entity.last.id;
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

  Future<void> getProductsNextPage() async {
    state = ProductState.loadInProgress(
      state.products,
      PaginationConfig.itemsPerPage,
    );
    final failureOrProducts = await _repository.getProducts(
      _page,
      productsFunction: ProductsFunction.getProductsNextPage,
      lastProductId: _lastProductId,
      pageSize: PaginationConfig.itemsPerPage,
    );
    state = failureOrProducts.fold(
      (l) => ProductState.loadFailure(state.products, l),
      (r) {
        _page++;
        _lastProductId = r.entity.isEmpty ? 0 : r.entity.last.id;
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
