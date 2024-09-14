import 'package:classic_shop_admin/src/features/promotion/core/domain/promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_dto.freezed.dart';
part 'promotion_dto.g.dart';

@freezed
class PromotionDTO with _$PromotionDTO {
  const factory PromotionDTO({
    required int id,
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  }) = _PromotionDTO;
  const PromotionDTO._();

  factory PromotionDTO.fromJson(Map<String, dynamic> json) =>
      _$PromotionDTOFromJson(json);

  factory PromotionDTO.fromDomain(Promotion _) {
    return PromotionDTO(
      id: _.id,
      name: _.name,
      description: _.description,
      discountRate: _.discountRate,
      active: _.active,
      startDate: _.startDate,
      endDate: _.endDate,
    );
  }

  Promotion toDomain() {
    return Promotion(
      id: id,
      name: name,
      description: description,
      discountRate: discountRate,
      active: active,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
