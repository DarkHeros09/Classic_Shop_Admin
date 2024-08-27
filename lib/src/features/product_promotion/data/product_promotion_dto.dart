import 'package:classic_shop_admin/src/features/product_promotion/domain/product_promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_promotion_dto.freezed.dart';
part 'product_promotion_dto.g.dart';

@freezed
class ProductPromotionDTO with _$ProductPromotionDTO {
  const factory ProductPromotionDTO({
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  }) = _ProductPromotionDTO;
  const ProductPromotionDTO._();

  factory ProductPromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductPromotionDTOFromJson(json);

  factory ProductPromotionDTO.fromDomain(ProductPromotion _) {
    return ProductPromotionDTO(
      productId: _.productId,
      promotionId: _.promotionId,
      productPromotionImage: _.productPromotionImage,
      active: _.active,
    );
  }

  ProductPromotion toDomain() {
    return ProductPromotion(
      productId: productId,
      promotionId: promotionId,
      productPromotionImage: productPromotionImage,
      active: active,
    );
  }
}
