import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IBrandPromotionLocalService {
  Future<List<BrandPromotionDTO>> fetchBrandPromotions();

  Future<void> setBrandPromotion(List<BrandPromotionDTO> promotionsDTO);

  // Future<BrandPromotionDTO?> getBrandPromotion(int promotionId);

  // Future<void> updateBrandPromotion(BrandPromotionDTO dto);

  Future<void> deleteBrandPromotion(int promotionId);

  Future<void> deleteAllBrandPromotions();
}

class BrandPromotionLocalService implements IBrandPromotionLocalService {
  BrandPromotionLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('brand-promotions');

  // static const promotionsKey = 'promotions';

  @override
  Future<List<BrandPromotionDTO>> fetchBrandPromotions() async {
    debugPrint('PROOO offline CALLED');
    final records = await _store.find(_sembastDatabase.instance);
    debugPrint('PROOO off $records');
    return records.map((e) => BrandPromotionDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setBrandPromotion(List<BrandPromotionDTO> dto) {
    debugPrint('PROOO set data CALLED');
    deleteAllBrandPromotions();
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deleteBrandPromotion(int promotionId) async {
    await _store.record(promotionId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllBrandPromotions() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
