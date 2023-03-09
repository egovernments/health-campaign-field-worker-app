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
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final ProjectProductVariantModel resources;
  final DateTime createdAtTime;
  

  ProjectResourceModel({
    this.id,
    this.projectId,
    required this.clientReferenceId,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    required this.resources,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      id: Value(id),
      projectId: Value(projectId),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      resources: Value(resources.clientReferenceId),
    );
  }
}
