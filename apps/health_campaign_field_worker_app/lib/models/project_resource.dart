import 'package:dart_mappable/dart_mappable.dart';

import 'project_product_variant.dart';
import 'data_model.dart';

@MappableClass()
class ProjectResourceRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final int? rowVersion;
  final String? clientReferenceId;
  final ProjectProductVariantRequestModel? resources;
  
  ProjectResourceRequestModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.rowVersion,
    this.clientReferenceId,
    this.resources,
    super.auditDetails,
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
  
  @override
  final int rowVersion;
  
  @override
  final String clientReferenceId;
  
  @override
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
