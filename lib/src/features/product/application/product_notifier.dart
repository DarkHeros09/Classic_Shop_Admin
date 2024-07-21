// import 'package:classic_shop_admin/src/core/domain/fresh.dart';
// import 'package:classic_shop_admin/src/features/product/data/product_repository.dart';
// import 'package:classic_shop_admin/src/features/product/domain/product.dart';
// import 'package:classic_shop_admin/src/features/product/domain/product_failure.dart';
// import 'package:classic_shop_admin/src/features/product/shared/provider.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'product_notifier.freezed.dart';
// part 'product_notifier.g.dart';

// @freezed
// class ProductState with _$ProductState {
//   const ProductState._();
//   const factory ProductState.initial(
//     Fresh<List<Product>> products,
//   ) = _Initial;
//   const factory ProductState.loadInProgress(
//     Fresh<List<Product>> products,
//   ) = _LoadInProgress;
//   const factory ProductState.loadSuccess(
//     Fresh<List<Product>> products,
//   ) = _LoadSuccess;
//   const factory ProductState.loadFailure(
//     Fresh<List<Product>> products,
//     ProductFailure failure,
//   ) = _LoadFailure;
// }

// @riverpod
// class ProductNotifier extends _$ProductNotifier {
//   late final ProductRepository _repository;
//   @override
//   ProductState build() {
//     _repository = ref.watch(productRepositoryProvider);
//     return state = ProductState.initial(Fresh.yes([]));
//   }

//   Future<void> getProductss() async {
//     // state = ProductState.loadFailure(
//     //   state.categories,
//     //   const ProductFailure.api(404),
//     // );
//     state = ProductState.loadInProgress(state.products);
//     final failureOrCategories = await _repository.fetchProducts();
//     state = failureOrCategories.fold(
//       (l) => ProductState.loadFailure(state.products, l),
//       ProductState.loadSuccess,
//     );
//   }
// }
