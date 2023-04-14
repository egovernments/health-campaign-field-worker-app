// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

@MappableClass(ignoreNull: true)
class BoundarySearchModel extends EntitySearchModel {
  final String? boundaryType;
  final String? tenantId;
  final bool? isDeleted;
  final String? code;

  BoundarySearchModel({
    this.boundaryType,
    this.tenantId,
    this.isDeleted,
    this.code,
    super.boundaryCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class BoundaryModel extends EntityModel {
  final String? code;
  final String? name;
  final String? label;
  final int? boundaryNum;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;

  BoundaryModel({
    this.code,
    this.name,
    this.label,
    this.boundaryNum,
    this.latitude,
    this.longitude,
    this.materializedPath,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
  }) : super();

  BoundaryCompanion get companion {
    return BoundaryCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      code: Value(code),
      name: Value(name),
      boundaryNum: Value(boundaryNum),
      label: Value(label),
      latitude: Value(latitude),
      longitude: Value(longitude),
      materializedPath: Value(materializedPath),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
    );
  }
}
