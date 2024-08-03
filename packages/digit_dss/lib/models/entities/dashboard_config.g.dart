// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigWrapperImpl _$$DashboardConfigWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardConfigWrapperImpl(
      enableDashboard: json['enableDashboard'] as bool,
      dashboardConfig: json['dashboardConfig'] == null
          ? null
          : DashboardConfig.fromJson(
              json['dashboardConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardConfigWrapperImplToJson(
        _$DashboardConfigWrapperImpl instance) =>
    <String, dynamic>{
      'enableDashboard': instance.enableDashboard,
      'dashboardConfig': instance.dashboardConfig,
    };

_$DashboardConfigImpl _$$DashboardConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardConfigImpl(
      metricCharts: (json['METRIC'] as List<dynamic>?)
          ?.map((e) => ChartConfigModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableCharts: (json['TABLE'] as List<dynamic>?)
          ?.map((e) => ChartConfigModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardConfigImplToJson(
        _$DashboardConfigImpl instance) =>
    <String, dynamic>{
      'METRIC': instance.metricCharts,
      'TABLE': instance.tableCharts,
    };

_$ChartConfigModelImpl _$$ChartConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartConfigModelImpl(
      active: json['active'] as bool,
      name: json['name'] as String,
      vizType: json['vizType'] as String?,
    );

Map<String, dynamic> _$$ChartConfigModelImplToJson(
        _$ChartConfigModelImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'name': instance.name,
      'vizType': instance.vizType,
    };
