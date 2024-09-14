import 'package:classic_shop_admin/src/features/product_promotion/core/data/product_promotion_dto.dart';
import 'package:classic_shop_admin/src/features/product_promotion/core/domain/product_promotion.dart';

extension DTOListToDomainList on List<ProductPromotionDTO> {
  List<ProductPromotion> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
