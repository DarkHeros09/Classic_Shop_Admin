import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/product_items/core/application/paginated_products_notifier.dart';
import 'package:classic_shop_admin/src/features/product_items/core/shared/providers.dart';
import 'package:classic_shop_admin/src/features/product_items/helper/enums.dart';
import 'package:classic_shop_admin/src/features/product_items/listed_products/data/list_products_repository.dart';

class ListProductsNotifier extends PaginatedProductsNotifier {
  late final ListProductsRepository _repository;
  @override
  PaginatedProductsState build() {
    _repository = ref.watch(listProductsRepositoryProvider);
    // ref.keepAlive();
    return state = PaginatedProductsState.initial(Fresh.yes([]));
  }

  Future<void> getProductsPage({
    required ProductItemsFunction productItemsFunction,
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
        productItemsFunction: productItemsFunction,
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
      productItemsFunction,
    );
  }
}
