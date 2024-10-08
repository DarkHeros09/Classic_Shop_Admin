import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status.freezed.dart';

@freezed
class OrderStatus with _$OrderStatus {
  const factory OrderStatus({
    required int id,
    required String status,
  }) = _OrderStatus;
}
