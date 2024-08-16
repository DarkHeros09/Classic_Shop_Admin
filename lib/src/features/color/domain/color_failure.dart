import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_failure.freezed.dart';

@freezed
class ColorFailure with _$ColorFailure {
  const ColorFailure._();
  const factory ColorFailure.api(int? errorCode) = _Api;
  const factory ColorFailure.server(String? message) = _Server;
  // const factory ColorFailure.storage() = _Storage;
}
