import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_failure.freezed.dart';

@freezed
class OrderStatusFailure with _$OrderStatusFailure {
  const OrderStatusFailure._();
  // const factory OrderStatusFailure.api(int? errorCode) = _Api;
  const factory OrderStatusFailure.api(int? errorCode) = _Api;
  const factory OrderStatusFailure.server(String? message) = _Server;
  // const factory OrderStatusFailure.storage() = _Storage;
}
