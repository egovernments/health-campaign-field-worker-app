// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectResourceSearchModel extends EntitySearchModel {
  final String? id;
  final String? projectId;
  final String? clientReferenceId;
  final String? tenantId;
  
  ProjectResourceSearchModel({
    this.id,
    this.projectId,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectResourceModel extends EntityModel implements ProjectResourceSearchModel {
  
  @override
  final String? id;
  
  @override
  final String? projectId;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  final ProjectProductVariantModel? resources;
  

  ProjectResourceModel({
    this.id,
    this.projectId,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.resources,
    super.auditDetails,
  }):  super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      id: Value(id),
      projectId: Value(projectId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}
