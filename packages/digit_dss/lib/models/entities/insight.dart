// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'insight.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class InsightModel with InsightModelMappable {
  final String? colorCode;
  final String? indicator;
  final String? name;
  final String? value;
  final String? visualizationCode;
  final String? chartType;
  final String? projectId;

  InsightModel({
    this.colorCode,
    this.indicator,
    this.name,
    this.value,
    this.chartType,
    this.visualizationCode,
    this.projectId,
  }) : super();
}
