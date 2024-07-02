import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_failure.freezed.dart';

@freezed
class DashboardFailure with _$DashboardFailure {
  const DashboardFailure._();
  const factory DashboardFailure.api(int? errorCode) = _Api;
  const factory DashboardFailure.error(Exception? exception) = _Error;
}
