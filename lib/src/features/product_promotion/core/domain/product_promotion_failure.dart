import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_promotion_failure.freezed.dart';

@freezed
class ProductPromotionFailure with _$ProductPromotionFailure {
  const ProductPromotionFailure._();
  // const factory ProductPromotionFailure.api(int? errorCode) = _Api;
  const factory ProductPromotionFailure.api(int? errorCode) = _Api;
  const factory ProductPromotionFailure.server(String? message) = _Server;
  // const factory ProductPromotionFailure.storage() = _Storage;
}
