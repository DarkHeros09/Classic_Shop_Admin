import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_promotion.freezed.dart';

@freezed
class CategoryPromotion with _$CategoryPromotion {
  const factory CategoryPromotion({
    required int categoryId,
    required String? categoryName,
    required int promotionId,
    required String? promotionName,
    required String categoryPromotionImage,
    required bool active,
  }) = _CategoryPromotion;
}
