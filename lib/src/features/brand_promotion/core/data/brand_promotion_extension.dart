import 'package:classic_shop_admin/src/features/brand_promotion/core/data/brand_promotion_dto.dart';
import 'package:classic_shop_admin/src/features/brand_promotion/core/domain/brand_promotion.dart';

extension DTOListToDomainList on List<BrandPromotionDTO> {
  List<BrandPromotion> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
