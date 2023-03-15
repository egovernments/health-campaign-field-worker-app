// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectResourceSearchModel extends EntitySearchModel {
  final List<String>? id;
  final String? projectId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectResourceSearchModel({
    this.id,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectResourceModel extends EntityModel {
  final String? id;
  final String? projectId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final ProjectProductVariantModel resource;
  

  ProjectResourceModel({
    this.id,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    required this.resource,
    super.auditDetails,
  }):  super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      id: Value(id),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      resource: Value(resource.productVariantId),
    );
  }
}
