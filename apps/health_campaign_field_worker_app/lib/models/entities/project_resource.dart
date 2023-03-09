// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectResourceSearchModel extends EntitySearchModel {
  final String? id;
  final String? projectId;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectResourceSearchModel({
    this.id,
    this.projectId,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectResourceModel extends EntityModel {
  final String? id;
  final String? projectId;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final ProjectProductVariantModel resources;
  

  ProjectResourceModel({
    this.id,
    this.projectId,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    required this.resources,
    super.auditDetails,
  }):  super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      id: Value(id),
      projectId: Value(projectId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      resources: Value(resources.clientReferenceId),
    );
  }
}
