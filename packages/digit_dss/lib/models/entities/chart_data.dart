// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_dss/models/entities/insight.dart';
import 'package:digit_dss/models/entities/plots.dart';

part 'chart_data.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DashboardChartDataModel with DashboardChartDataModelMappable {
  final String? headerName;
  final String? headerSymbol;
  final String? headerValue;
  final InsightModel? insight;
  final List<DashboardPlotModel>? plots;
  final String? visualizationCode;
  final String? chartType;
  final String? projectId;

  DashboardChartDataModel({
    this.headerName,
    this.headerSymbol,
    this.headerValue,
    this.projectId,
    this.chartType,
    this.visualizationCode,
    this.insight,
    this.plots,
  }) : super();
}
