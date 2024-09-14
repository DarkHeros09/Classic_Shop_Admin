import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class ICategoryPromotionLocalService {
  Future<List<CategoryPromotionDTO>> fetchCategoryPromotions();

  Future<void> setCategoryPromotion(List<CategoryPromotionDTO> promotionsDTO);

  // Future<CategoryPromotionDTO?> getCategoryPromotion(int promotionId);

  // Future<void> updateCategoryPromotion(CategoryPromotionDTO dto);

  Future<void> deleteCategoryPromotion(int promotionId);

  Future<void> deleteAllCategoryPromotions();
}

class CategoryPromotionLocalService implements ICategoryPromotionLocalService {
  CategoryPromotionLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('category-promotions');

  // static const promotionsKey = 'promotions';

  @override
  Future<List<CategoryPromotionDTO>> fetchCategoryPromotions() async {
    debugPrint('PROOO offline CALLED');
    final records = await _store.find(_sembastDatabase.instance);
    debugPrint('PROOO off $records');
    return records.map((e) => CategoryPromotionDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setCategoryPromotion(List<CategoryPromotionDTO> dto) {
    debugPrint('PROOO set data CALLED');
    deleteAllCategoryPromotions();
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteCategoryPromotion(int promotionId) async {
    await _store.record(promotionId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllCategoryPromotions() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
