import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    required int activeProducts,
    required int totalProducts,
    required int activeUsers,
    required int totalUsers,
    required int activeOrders,
    required int totalOrders,
    required String dailyRevenue,
    required int totalRevenue,
  }) = _Dashboard;
  const Dashboard._();
}
