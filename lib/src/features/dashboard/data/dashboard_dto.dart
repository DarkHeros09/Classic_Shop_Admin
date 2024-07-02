import 'package:classic_shop_admin/src/features/dashboard/domain/dashboard.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_dto.freezed.dart';
part 'dashboard_dto.g.dart';

@freezed
class DashboardDTO with _$DashboardDTO {
  const factory DashboardDTO({
    required int activeProducts,
    required int totalProducts,
    required int activeUsers,
    required int totalUsers,
    required int activeOrders,
    required int totalOrders,
    required String todayRevenue,
    @JsonKey(defaultValue: 0) required int totalRevenue,
  }) = _DashboardDTO;
  const DashboardDTO._();

  factory DashboardDTO.fromJson(Map<String, dynamic> json) =>
      _$DashboardDTOFromJson(json);

  factory DashboardDTO.fromDomain(Dashboard _) {
    return DashboardDTO(
      activeProducts: _.activeProducts,
      totalProducts: _.totalProducts,
      activeUsers: _.activeUsers,
      totalUsers: _.totalUsers,
      activeOrders: _.activeOrders,
      totalOrders: _.totalOrders,
      todayRevenue: _.dailyRevenue,
      totalRevenue: _.totalRevenue,
    );
  }

  Dashboard toDomain() {
    return Dashboard(
      activeProducts: activeProducts,
      totalProducts: totalProducts,
      activeUsers: activeUsers,
      totalUsers: totalUsers,
      activeOrders: activeOrders,
      totalOrders: totalOrders,
      dailyRevenue: todayRevenue,
      totalRevenue: totalRevenue,
    );
  }
}
