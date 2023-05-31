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
  @override
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

  static const schemaName = 'ProjectResource';

  final String? id;
  final String? projectId;
  final String? tenantId;
  @override
  final bool? isDeleted;
  final int? rowVersion;
  final ProjectProductVariantModel resource;
  final ProjectResourceAdditionalFields? additionalFields;

  ProjectResourceModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    required this.resource,
    super.auditDetails,
  }): super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      id: Value(id),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      resource: Value(resource.productVariantId),
    );
  }
}

@MappableClass(ignoreNull: true)
class ProjectResourceAdditionalFields extends AdditionalFields {
  ProjectResourceAdditionalFields({
    super.schema = 'ProjectResource',
    required super.version,
    super.fields,
  });
}
