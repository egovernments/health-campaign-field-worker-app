// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardConfigPrimaryWrapperImpl
    _$$DashboardConfigPrimaryWrapperImplFromJson(Map<String, dynamic> json) =>
        _$DashboardConfigPrimaryWrapperImpl(
          dashboardConfigWrapper: (json['dashboardConfig'] as List<dynamic>?)
                  ?.map((e) => DashboardConfigWrapper.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$DashboardConfigPrimaryWrapperImplToJson(
        _$DashboardConfigPrimaryWrapperImpl instance) =>
    <String, dynamic>{
      'dashboardConfig': instance.dashboardConfigWrapper,
    };

_$DashboardConfigWrapperImpl _$$DashboardConfigWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardConfigWrapperImpl(
      enableDashboard: json['enableDashboard'] as bool,
      charts: (json['charts'] as List<dynamic>?)
          ?.map((e) => ChartConfigModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectTypeCode: json['projectTypeCode'] as String,
    );

Map<String, dynamic> _$$DashboardConfigWrapperImplToJson(
        _$DashboardConfigWrapperImpl instance) =>
    <String, dynamic>{
      'enableDashboard': instance.enableDashboard,
      'charts': instance.charts,
      'projectTypeCode': instance.projectTypeCode,
    };

_$ChartConfigModelImpl _$$ChartConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartConfigModelImpl(
      active: json['active'] as bool,
      name: json['name'] as String,
      vizType: json['vizType'] as String?,
      chartType: json['chartType'] as String,
    );

Map<String, dynamic> _$$ChartConfigModelImplToJson(
        _$ChartConfigModelImpl instance) =>
    <String, dynamic>{
      'active': instance.active,
      'name': instance.name,
      'vizType': instance.vizType,
      'chartType': instance.chartType,
    };
