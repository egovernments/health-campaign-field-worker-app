// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectResourceRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  
  ProjectResourceRequestModel({
    this.id,
    this.tenantId,
    this.projectId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectResourceModel extends DataModel implements ProjectResourceRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String projectId;
  final int rowVersion;
  final String clientReferenceId;
  final ProjectProductVariantRequestModel resources;
  

  ProjectResourceModel({
    this.id,
    required this.tenantId,
    required this.projectId,
    required this.rowVersion,
    required this.clientReferenceId,
    required this.resources,
    super.auditDetails,
  }):  super();
}
