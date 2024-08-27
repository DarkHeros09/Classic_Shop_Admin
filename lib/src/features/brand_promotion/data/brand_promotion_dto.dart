import 'package:classic_shop_admin/src/features/brand_promotion/domain/brand_promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_promotion_dto.freezed.dart';
part 'brand_promotion_dto.g.dart';

@freezed
class BrandPromotionDTO with _$BrandPromotionDTO {
  const factory BrandPromotionDTO({
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) = _BrandPromotionDTO;
  const BrandPromotionDTO._();

  factory BrandPromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$BrandPromotionDTOFromJson(json);

  factory BrandPromotionDTO.fromDomain(BrandPromotion _) {
    return BrandPromotionDTO(
      brandId: _.brandId,
      promotionId: _.promotionId,
      brandPromotionImage: _.brandPromotionImage,
      active: _.active,
    );
  }

  BrandPromotion toDomain() {
    return BrandPromotion(
      brandId: brandId,
      promotionId: promotionId,
      brandPromotionImage: brandPromotionImage,
      active: active,
    );
  }
}
