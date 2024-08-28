// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_dss/models/entities/chart_data.dart';

part 'dashboard_response_model.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DashboardResponseSearchModel with DashboardResponseSearchModelMappable {
  final String? projectId;
  final String? visualizationCode;
  final String? chartType;
  final String? date;
  DashboardResponseSearchModel({
    this.projectId,
    this.visualizationCode,
    this.chartType,
    this.date,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DashboardResponseModel with DashboardResponseModelMappable {
  static const schemaName = 'Dashboard';

  final String? drillDownChartId;
  final bool? showLabel;
  final bool? hideInsights;
  final List<DashboardChartDataModel>? data;
  final bool? hideHeaderDenomination;
  final String? visualizationCode;
  final String? chartType;
  final String? projectId;

  DashboardResponseModel({
    this.drillDownChartId,
    this.showLabel,
    this.hideInsights,
    this.hideHeaderDenomination,
    this.projectId,
    this.chartType,
    this.visualizationCode,
    this.data,
  }) : super();
}
