// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectFacilityRequestModel extends DataModel {
  
  ProjectFacilityRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectFacilityModel extends DataModel implements ProjectFacilityRequestModel {
  final String? id;
  final String tenantId;
  final String facilityId;
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
