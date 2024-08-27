import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_promotion.freezed.dart';

@freezed
class ProductPromotion with _$ProductPromotion {
  const factory ProductPromotion({
    required int productId,
    required int promotionId,
    required String productPromotionImage,
    required bool active,
  }) = _ProductPromotion;
}
