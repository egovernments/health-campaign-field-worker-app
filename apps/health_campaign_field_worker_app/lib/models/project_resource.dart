// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass()
class ProjectResourceSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? projectId;
  final String? clientReferenceId;
  
  ProjectResourceSearchModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class ProjectResourceModel extends EntityModel implements ProjectResourceSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? tenantId;
  
  @override
  final String? projectId;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  final ProjectProductVariantModel? resources;
  

  ProjectResourceModel({
    this.id,
    this.tenantId,
    this.projectId,
    this.rowVersion,
    required this.clientReferenceId,
    this.resources,
    super.auditDetails,
  }):  super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      id: Value(id),
      tenantId: Value(tenantId),
      projectId: Value(projectId),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      );
  }
}
