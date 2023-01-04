// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class ProjectResourceRequestModel extends DataModel {
  
  ProjectResourceRequestModel({
    super.auditDetails,
  }):  super();
}

@MappableClass()
class ProjectResourceModel extends DataModel implements ProjectResourceRequestModel {
  final String? id;
  final String tenantId;
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
