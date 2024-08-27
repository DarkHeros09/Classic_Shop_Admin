import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_promotion.freezed.dart';

@freezed
class BrandPromotion with _$BrandPromotion {
  const factory BrandPromotion({
    required int brandId,
    required int promotionId,
    required String brandPromotionImage,
    required bool active,
  }) = _BrandPromotion;
}
