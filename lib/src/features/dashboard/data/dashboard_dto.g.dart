// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDTOImpl _$$DashboardDTOImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDTOImpl(
      activeProducts: (json['active_products'] as num).toInt(),
      totalProducts: (json['total_products'] as num).toInt(),
      activeUsers: (json['active_users'] as num).toInt(),
      totalUsers: (json['total_users'] as num).toInt(),
      activeOrders: (json['active_orders'] as num).toInt(),
      totalOrders: (json['total_orders'] as num).toInt(),
      todayRevenue: json['today_revenue'] as String,
      totalRevenue: (json['total_revenue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DashboardDTOImplToJson(_$DashboardDTOImpl instance) =>
    <String, dynamic>{
      'active_products': instance.activeProducts,
      'total_products': instance.totalProducts,
      'active_users': instance.activeUsers,
      'total_users': instance.totalUsers,
      'active_orders': instance.activeOrders,
      'total_orders': instance.totalOrders,
      'today_revenue': instance.todayRevenue,
      'total_revenue': instance.totalRevenue,
    };
