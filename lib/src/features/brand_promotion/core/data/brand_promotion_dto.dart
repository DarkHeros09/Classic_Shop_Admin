import 'package:classic_shop_admin/src/features/brand_promotion/core/domain/brand_promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_promotion_dto.freezed.dart';
part 'brand_promotion_dto.g.dart';

@freezed
class BrandPromotionDTO with _$BrandPromotionDTO {
  const factory BrandPromotionDTO({
    required int brandId,
    required String? brandName,
    required int promotionId,
    required String? promotionName,
    required String brandPromotionImage,
    required bool active,
  }) = _BrandPromotionDTO;
  const BrandPromotionDTO._();

  factory BrandPromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$BrandPromotionDTOFromJson(json);

  factory BrandPromotionDTO.fromDomain(BrandPromotion _) {
    return BrandPromotionDTO(
      brandId: _.brandId,
      brandName: _.brandName,
      promotionId: _.promotionId,
      promotionName: _.promotionName,
      brandPromotionImage: _.brandPromotionImage,
      active: _.active,
    );
  }

  BrandPromotion toDomain() {
    return BrandPromotion(
      brandId: brandId,
      brandName: brandName,
      promotionId: promotionId,
      promotionName: promotionName,
      brandPromotionImage: brandPromotionImage,
      active: active,
    );
  }
}
