// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectFacilitySearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? facilityId;
  final String? projectId;
  
  ProjectFacilitySearchModel({
    this.id,
    this.tenantId,
    this.facilityId,
    this.projectId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectFacilityModel extends EntityModel implements ProjectFacilitySearchModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String facilityId;
  
  @override
  final String projectId;
  final String rowVersion;
  final String clientReferenceId;
  

  ProjectFacilityModel({
    this.id,
    required this.tenantId,
    required this.facilityId,
    required this.projectId,
    required this.rowVersion,
    required this.clientReferenceId,
    super.auditDetails,
  }):  super();
}
