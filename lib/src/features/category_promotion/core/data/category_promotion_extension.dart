import 'package:classic_shop_admin/src/features/category_promotion/core/data/category_promotion_dto.dart';
import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';

extension DTOListToDomainList on List<CategoryPromotionDTO> {
  List<CategoryPromotion> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
