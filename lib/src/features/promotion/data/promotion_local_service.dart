import 'package:classic_shop_admin/src/core/data/sembast_database.dart';
import 'package:classic_shop_admin/src/features/promotion/data/promotion_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class IPromotionLocalService {
  Future<List<PromotionDTO>> fetchPromotions();

  Future<void> setPromotion(List<PromotionDTO> promotionsDTO);

  // Future<PromotionDTO?> getPromotion(int promotionId);

  // Future<void> updatePromotion(PromotionDTO dto);

  Future<void> deletePromotion(int promotionId);

  Future<void> deleteAllPromotions();
}

class PromotionLocalService implements IPromotionLocalService {
  PromotionLocalService(this._sembastDatabase);

  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('promotions');

  // static const promotionsKey = 'promotions';

  @override
  Future<List<PromotionDTO>> fetchPromotions() async {
    debugPrint('PROOO offline CALLED');
    final records = await _store.find(_sembastDatabase.instance);
    debugPrint('PROOO off $records');
    return records.map((e) => PromotionDTO.fromJson(e.value)).toList();
  }

  @override
  Future<void> setPromotion(List<PromotionDTO> dto) {
    return _store.addAll(
      _sembastDatabase.instance,
      dto.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Future<void> deletePromotion(int promotionId) async {
    await _store.record(promotionId).delete(_sembastDatabase.instance);
  }

  @override
  Future<void> deleteAllPromotions() async {
    await _store.drop(_sembastDatabase.instance);
  }
}
