import 'package:classic_shop_admin/src/features/category_promotion/core/domain/category_promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_promotion_dto.freezed.dart';
part 'category_promotion_dto.g.dart';

@freezed
class CategoryPromotionDTO with _$CategoryPromotionDTO {
  const factory CategoryPromotionDTO({
    required int categoryId,
    required String? categoryName,
    required int promotionId,
    required String? promotionName,
    required String categoryPromotionImage,
    required bool active,
  }) = _CategoryPromotionDTO;
  const CategoryPromotionDTO._();

  factory CategoryPromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryPromotionDTOFromJson(json);

  factory CategoryPromotionDTO.fromDomain(CategoryPromotion _) {
    return CategoryPromotionDTO(
      categoryId: _.categoryId,
      categoryName: _.categoryName,
      promotionId: _.promotionId,
      promotionName: _.promotionName,
      categoryPromotionImage: _.categoryPromotionImage,
      active: _.active,
    );
  }

  CategoryPromotion toDomain() {
    return CategoryPromotion(
      categoryId: categoryId,
      categoryName: categoryName,
      promotionId: promotionId,
      promotionName: promotionName,
      categoryPromotionImage: categoryPromotionImage,
      active: active,
    );
  }
}
