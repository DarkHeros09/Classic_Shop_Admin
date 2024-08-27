import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_promotion_failure.freezed.dart';

@freezed
class CategoryPromotionFailure with _$CategoryPromotionFailure {
  const CategoryPromotionFailure._();
  // const factory CategoryPromotionFailure.api(int? errorCode) = _Api;
  const factory CategoryPromotionFailure.api(int? errorCode) = _Api;
  const factory CategoryPromotionFailure.server(String? message) = _Server;
  // const factory CategoryPromotionFailure.storage() = _Storage;
}
