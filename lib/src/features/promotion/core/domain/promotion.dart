import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';

@freezed
class Promotion with _$Promotion {
  const factory Promotion({
    required int id,
    required String name,
    required String description,
    required int discountRate,
    required bool active,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Promotion;
}
