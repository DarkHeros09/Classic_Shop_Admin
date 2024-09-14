import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/category/core/data/category_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class ICategoryLocalService {
  Future<List<CategoryDTO>> fetchCategories();

  Future<void> setCategories(List<CategoryDTO> categoriesDTO);

  Future<CategoryDTO?> getCategory(int categoryId);

  Future<CategoryDTO> setCategory(CategoryDTO dto);

  Future<void> deleteCategory(int categoryId);

  Future<void> deleteAllCategories();
}

class CategoryLocalService implements ICategoryLocalService {
  CategoryLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('categories');

  // static const categoriesKey = 'categories';

  @override
  Future<List<CategoryDTO>> fetchCategories() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => CategoryDTO.fromJson(e.value)).toList();
  }

  @override
  Future<CategoryDTO> setCategory(CategoryDTO dto) async {
    final store = intMapStoreFactory.store('category_id : ${dto.id}');
    final saved = await store.record(dto.id).put(
          _sembastDatabase.instance,
          dto.toJson(),
        );
    debugPrint('resultCAT:SAVE $saved');
    return dto;
  }

  @override
  Future<void> setCategories(List<CategoryDTO> dto) {
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

  @override
  Future<CategoryDTO?> getCategory(int categoryId) async {
    final store = intMapStoreFactory.store('category_id : $categoryId');
    final record =
        await store.record(categoryId).get(_sembastDatabase.instance);

    if (record != null) {
      return CategoryDTO.fromJson(record);
    }
    return null;
  }
}
