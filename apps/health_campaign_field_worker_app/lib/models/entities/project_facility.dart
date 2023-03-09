// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectFacilitySearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectFacilityModel extends EntityModel {
  final String id;
  final String facilityId;
  final String projectId;
  final String? tenantId;
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final DateTime createdAtTime;
  

  ProjectFacilityModel({
    required this.id,
    required this.facilityId,
    required this.projectId,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  ProjectFacilityCompanion get companion {
    return ProjectFacilityCompanion(
      id: Value(id),
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      );
  }
}
