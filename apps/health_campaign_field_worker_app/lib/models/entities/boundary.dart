// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class BoundarySearchModel extends EntitySearchModel {
  final String? tenantId;
  final bool? isDeleted;
  
  BoundarySearchModel({
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class BoundaryModel extends EntityModel {
  final String? code;
  final String? name;
  final String? label;
  final String? latitude;
  final String? longitude;
  final String? materializedPath;
  final String? tenantId;
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime createdAtTime;
  

  BoundaryModel({
    this.code,
    this.name,
    this.label,
    this.latitude,
    this.longitude,
    this.materializedPath,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  BoundaryCompanion get companion {
    return BoundaryCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      code: Value(code),
      name: Value(name),
      label: Value(label),
      latitude: Value(latitude),
      longitude: Value(longitude),
      materializedPath: Value(materializedPath),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      );
  }
}
