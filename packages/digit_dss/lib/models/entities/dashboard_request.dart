// // Generated using mason. Do not modify by hand
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:digit_data_model/data_model.dart';
// import 'package:drift/drift.dart';
//
// part 'insight.mapper.dart';
//
// @MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
// class DashboardRequestModel extends EntityModel with DashboardRequestModelMappable {
//   static const schemaName = 'Insight';
//
//   final String? colorCode;
//   final String? indicator;
//   final String? name;
//   final String? value;
//   final String? visualizationCode;
//   final String? chartType;
//   final String? projectId;
//
//   InsightModel({
//     this.colorCode,
//     this.indicator,
//     this.name,
//     this.value,
//     this.chartType,
//     this.visualizationCode,
//     this.projectId,
//   }) : super();
//
//   InsightCompanion get companion {
//     return InsightCompanion(
//       auditCreatedBy: Value(auditDetails?.createdBy),
//       auditCreatedTime: Value(auditDetails?.createdTime),
//       auditModifiedBy: Value(auditDetails?.lastModifiedBy),
//       clientCreatedTime: Value(clientAuditDetails?.createdTime),
//       clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
//       clientCreatedBy: Value(clientAuditDetails?.createdBy),
//       clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
//       auditModifiedTime: Value(auditDetails?.lastModifiedTime),
//       isDeleted: Value(isDeleted),
//       colorCode: Value(colorCode),
//       indicator: Value(indicator),
//       name: Value(name),
//       value: Value(value),
//       visualizationCode: Value(visualizationCode),
//       chartType: Value(chartType),
//       projectId: Value(projectId),
//     );
//   }
// }
