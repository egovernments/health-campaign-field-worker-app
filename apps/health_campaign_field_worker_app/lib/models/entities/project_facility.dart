// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectFacilitySearchModel extends EntitySearchModel {
  final String? id;
  final String? facilityId;
  final String? projectId;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectFacilityModel extends EntityModel {
  final String? id;
  final String? facilityId;
  final String? projectId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  

  ProjectFacilityModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    super.auditDetails,
    super.clientReferenceId,
  }):  super();

  ProjectFacilityCompanion get companion {
    return ProjectFacilityCompanion(
      id: Value(id),
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}
