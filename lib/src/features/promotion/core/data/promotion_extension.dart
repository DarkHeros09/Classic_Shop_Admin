import 'package:classic_shop_admin/src/features/promotion/core/data/promotion_dto.dart';
import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion.dart';

extension DTOListToDomainList on List<PromotionDTO> {
  List<Promotion> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
