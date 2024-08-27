import 'package:classic_shop_admin/src/features/category_promotion/domain/category_promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_promotion_dto.freezed.dart';
part 'category_promotion_dto.g.dart';

@freezed
class CategoryPromotionDTO with _$CategoryPromotionDTO {
  const factory CategoryPromotionDTO({
    required int categoryId,
    required int promotionId,
    required String categoryPromotionImage,
    required bool active,
  }) = _CategoryPromotionDTO;
  const CategoryPromotionDTO._();

  factory CategoryPromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryPromotionDTOFromJson(json);

  factory CategoryPromotionDTO.fromDomain(CategoryPromotion _) {
    return CategoryPromotionDTO(
      categoryId: _.categoryId,
      promotionId: _.promotionId,
      categoryPromotionImage: _.categoryPromotionImage,
      active: _.active,
    );
  }

  CategoryPromotion toDomain() {
    return CategoryPromotion(
      categoryId: categoryId,
      promotionId: promotionId,
      categoryPromotionImage: categoryPromotionImage,
      active: active,
    );
  }
}
