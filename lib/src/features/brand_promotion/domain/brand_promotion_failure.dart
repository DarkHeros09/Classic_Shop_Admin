import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_promotion_failure.freezed.dart';

@freezed
class BrandPromotionFailure with _$BrandPromotionFailure {
  const BrandPromotionFailure._();
  // const factory BrandPromotionFailure.api(int? errorCode) = _Api;
  const factory BrandPromotionFailure.api(int? errorCode) = _Api;
  const factory BrandPromotionFailure.server(String? message) = _Server;
  // const factory BrandPromotionFailure.storage() = _Storage;
}
