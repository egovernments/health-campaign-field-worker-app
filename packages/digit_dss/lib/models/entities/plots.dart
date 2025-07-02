// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'plots.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DashboardPlotModel with DashboardPlotModelMappable {
  final String? label;
  final String? strValue;
  final String? name;
  final String? value;
  final String? symbol;
  final String? visualizationCode;
  final String? chartType;
  final String? projectId;

  DashboardPlotModel({
    this.strValue,
    this.label,
    this.name,
    this.value,
    this.symbol,
    this.projectId,
    this.chartType,
    this.visualizationCode,
  }) : super();
}
