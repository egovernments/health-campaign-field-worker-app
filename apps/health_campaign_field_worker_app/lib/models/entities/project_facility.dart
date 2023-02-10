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
  final String? clientReferenceId;
  final String? tenantId;
  
  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectFacilityModel extends EntityModel implements ProjectFacilitySearchModel {
  
  @override
  final String? id;
  
  @override
  final String? facilityId;
  
  @override
  final String? projectId;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  

  ProjectFacilityModel({
    this.id,
    this.facilityId,
    this.projectId,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    super.auditDetails,
  }):  super();

  ProjectFacilityCompanion get companion {
    return ProjectFacilityCompanion(
      id: Value(id),
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
