import 'package:classic_shop_admin/src/core/domain/fresh.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_repository.dart';
import 'package:classic_shop_admin/src/features/category/core/domain/category.dart';
import 'package:classic_shop_admin/src/features/category/core/domain/category_failure.dart';
import 'package:classic_shop_admin/src/features/category/core/shared/provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_notifier.freezed.dart';
part 'categories_notifier.g.dart';

@freezed
class CategoryState with _$CategoryState {
  const CategoryState._();
  const factory CategoryState.initial(
    Fresh<List<Category>> categories,
  ) = _Initial;
  const factory CategoryState.loadInProgress(
    Fresh<List<Category>> categories,
  ) = _LoadInProgress;
  const factory CategoryState.loadSuccess(
    Fresh<List<Category>> categories,
  ) = _LoadSuccess;
  const factory CategoryState.loadFailure(
    Fresh<List<Category>> categories,
    CategoryFailure failure,
  ) = _LoadFailure;
}

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  late final CategoryRepository _repository;
  @override
  CategoryState build() {
    _repository = ref.watch(categoryRepositoryProvider);
    return state = CategoryState.initial(Fresh.yes([]));
  }

  Future<void> getCategories() async {
    // state = CategoryState.loadFailure(
    //   state.categories,
    //   const CategoryFailure.api(404),
    // );
    state = CategoryState.loadInProgress(state.categories);
    final failureOrCategories = await _repository.fetchCategories();
    state = failureOrCategories.fold(
      (l) => CategoryState.loadFailure(state.categories, l),
      CategoryState.loadSuccess,
    );
  }
}

@riverpod
class GetCategoryNotifier extends _$GetCategoryNotifier {
  late final CategoryRepository _repository;
  @override
  FutureOr<Category?> build() {
    _repository = ref.watch(categoryRepositoryProvider);
    return null;
  }

  Future<void> getCategory({required int categoryId}) async {
    // state = CategoryState.loadFailure(
    //   state.categories,
    //   const CategoryFailure.api(404),
    // );
    state = const AsyncValue.loading();

    final failureOrCategory =
        await _repository.fetchCategoryById(categoryId: categoryId);

    state = failureOrCategory.fold(
      (l) => const AsyncValue.data(null),
      (r) => AsyncValue.data(r.entity),
    );
  }
}
