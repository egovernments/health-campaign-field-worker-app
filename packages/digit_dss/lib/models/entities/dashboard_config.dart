import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_config.freezed.dart';
part 'dashboard_config.g.dart';

@freezed
class DashboardConfigPrimaryWrapper with _$DashboardConfigPrimaryWrapper {
  const factory DashboardConfigPrimaryWrapper({
    @JsonKey(name: 'dashboardConfig')
    @Default([])
    List<DashboardConfigWrapper> dashboardConfigWrapper,
  }) = _DashboardConfigPrimaryWrapper;

  factory DashboardConfigPrimaryWrapper.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashboardConfigPrimaryWrapperFromJson(json);
}

@freezed
class DashboardConfigWrapper with _$DashboardConfigWrapper {
  const factory DashboardConfigWrapper({
    @JsonKey(name: 'enableDashboard') required bool enableDashboard,
    @JsonKey(name: 'charts') List<ChartConfigModel>? charts,
  }) = _DashboardConfigWrapper;

  factory DashboardConfigWrapper.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DashboardConfigWrapperFromJson(json);
}

@freezed
class ChartConfigModel with _$ChartConfigModel {
  const factory ChartConfigModel({
    @JsonKey(name: 'active') required bool active,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'vizType') String? vizType,
    @JsonKey(name: 'chartType') required String chartType,
  }) = _ChartConfigModel;

  factory ChartConfigModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChartConfigModelFromJson(json);
}
