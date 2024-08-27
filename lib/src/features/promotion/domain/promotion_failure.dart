import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_failure.freezed.dart';

@freezed
class PromotionFailure with _$PromotionFailure {
  const PromotionFailure._();
  // const factory PromotionFailure.api(int? errorCode) = _Api;
  const factory PromotionFailure.api(int? errorCode) = _Api;
  const factory PromotionFailure.server(String? message) = _Server;
  // const factory PromotionFailure.storage() = _Storage;
}
