import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/category/data/category_dto.dart';
import 'package:sembast/sembast.dart';

abstract class ICategoryLocalService {
  Future<List<CategoryDTO>> fetchCategory();

  Future<void> setCategory(List<CategoryDTO> categoriesDTO);

  // Future<CategoryDTO?> getCategory(int categoryId);

  // Future<void> updateCategory(CategoryDTO dto);

  Future<void> deleteCategory(int categoryId);

  Future<void> deleteAllCategories();
}

class CategoryLocalService implements ICategoryLocalService {
  CategoryLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('categories');

  // static const categoriesKey = 'categories';

  @override
  Future<List<CategoryDTO>> fetchCategory() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => CategoryDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setCategory(List<CategoryDTO> dto) {
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await _store.record(categoryId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllCategories() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
