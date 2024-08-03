import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_config.freezed.dart';
part 'dashboard_config.g.dart';


@freezed
class DashboardConfigWrapper with _$DashboardConfigWrapper {
  const factory DashboardConfigWrapper({
    @JsonKey(name: 'enableDashboard') required bool enableDashboard,
    @JsonKey(name: 'dashboardConfig') DashboardConfig? dashboardConfig,
  }) = _DashboardConfigWrapper;

  factory DashboardConfigWrapper.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashboardConfigWrapperFromJson(json);
}

@freezed
class DashboardConfig with _$DashboardConfig {
  const factory DashboardConfig({
    @JsonKey(name: 'METRIC') List<ChartConfigModel>? metricCharts,
    @JsonKey(name: 'TABLE') List<ChartConfigModel>? tableCharts,
  }) = _DashboardConfig;

  factory DashboardConfig.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashboardConfigFromJson(json);
}

@freezed
class ChartConfigModel with _$ChartConfigModel {
  const factory ChartConfigModel({
    @JsonKey(name: 'active') required bool active,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'vizType') String? vizType,
  }) = _ChartConfigModel;

  factory ChartConfigModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChartConfigModelFromJson(json);
}
