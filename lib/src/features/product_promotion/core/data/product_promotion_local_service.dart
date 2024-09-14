import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IProductPromotionLocalService {
  Future<List<ProductPromotionDTO>> fetchProductPromotions();

  Future<void> setProductPromotion(List<ProductPromotionDTO> promotionsDTO);

  // Future<ProductPromotionDTO?> getProductPromotion(int promotionId);

  // Future<void> updateProductPromotion(ProductPromotionDTO dto);

  Future<void> deleteProductPromotion(int promotionId);

  Future<void> deleteAllProductPromotions();
}

class ProductPromotionLocalService implements IProductPromotionLocalService {
  ProductPromotionLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('product-promotions');

  // static const promotionsKey = 'promotions';

  @override
  Future<List<ProductPromotionDTO>> fetchProductPromotions() async {
    debugPrint('PROOO offline CALLED');
    final records = await _store.find(_sembastDatabase.instance);
    debugPrint('PROOO off $records');
    return records.map((e) => ProductPromotionDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setProductPromotion(List<ProductPromotionDTO> dto) {
    debugPrint('PROOO set data CALLED');
    deleteAllProductPromotions();
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteProductPromotion(int promotionId) async {
    await _store.record(promotionId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllProductPromotions() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
