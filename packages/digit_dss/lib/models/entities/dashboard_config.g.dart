// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardConfigPrimaryWrapper _$DashboardConfigPrimaryWrapperFromJson(
        Map<String, dynamic> json) =>
    _DashboardConfigPrimaryWrapper(
      dashboardConfigWrapper: (json['dashboardConfig'] as List<dynamic>?)
              ?.map((e) =>
                  DashboardConfigWrapper.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DashboardConfigPrimaryWrapperToJson(
        _DashboardConfigPrimaryWrapper instance) =>
    <String, dynamic>{
      'dashboardConfig': instance.dashboardConfigWrapper,
    };

_DashboardConfigWrapper _$DashboardConfigWrapperFromJson(
        Map<String, dynamic> json) =>
    _DashboardConfigWrapper(
      enableDashboard: json['enableDashboard'] as bool,
      charts: (json['charts'] as List<dynamic>?)
          ?.map((e) => ChartConfigModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectTypeCode: json['projectTypeCode'] as String,
      projectTypeId: json['projectTypeId'] as String?,
    );

Map<String, dynamic> _$DashboardConfigWrapperToJson(
        _DashboardConfigWrapper instance) =>
    <String, dynamic>{
      'enableDashboard': instance.enableDashboard,
      'charts': instance.charts,
      'projectTypeCode': instance.projectTypeCode,
      'projectTypeId': instance.projectTypeId,
    };

_ChartConfigModel _$ChartConfigModelFromJson(Map<String, dynamic> json) =>
    _ChartConfigModel(
      active: json['active'] as bool,
      name: json['name'] as String,
      vizType: json['vizType'] as String?,
      chartType: json['chartType'] as String,
    );

Map<String, dynamic> _$ChartConfigModelToJson(_ChartConfigModel instance) =>
    <String, dynamic>{
      'active': instance.active,
      'name': instance.name,
      'vizType': instance.vizType,
      'chartType': instance.chartType,
    };
