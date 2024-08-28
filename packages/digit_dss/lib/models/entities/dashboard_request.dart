// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'dashboard_request.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DashboardRequestModel with DashboardRequestModelMappable {
  final AggregationRequestDto aggregationRequestDto;
  final DSSHeaders headers;

  DashboardRequestModel({
    required this.aggregationRequestDto,
    required this.headers,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AggregationRequestDto with AggregationRequestDtoMappable {
  final String visualizationCode;
  final String visualizationType;
  final Map? filters;
  final RequestDate? requestDate;
  final String? moduleLevel;
  final String? queryType;

  AggregationRequestDto({
    required this.visualizationCode,
    required this.visualizationType,
    this.filters,
    this.requestDate,
    this.moduleLevel,
    this.queryType,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DSSHeaders with DSSHeadersMappable {
  final String? tenantId;
  DSSHeaders({
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class RequestDate with RequestDateMappable {
  final int? startDate;
  final int? endDate;
  final String? title;
  final String? interval;
  RequestDate({
    this.startDate,
    this.endDate,
    this.title,
    this.interval,
  }) : super();
}
