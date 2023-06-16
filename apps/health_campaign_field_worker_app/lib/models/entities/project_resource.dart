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
  
  ProjectResourceSearchModel({
    this.id,
    this.projectId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ProjectResourceSearchModel.ignoreDeleted({
    this.id,
    this.projectId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class ProjectResourceModel extends EntityModel {

  static const schemaName = 'ProjectResource';

  final String? id;
  final String? projectId;
  final String? tenantId;
  final int? rowVersion;
  final ProjectProductVariantModel resource;
  final ProjectResourceAdditionalFields? additionalFields;

  ProjectResourceModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.tenantId,
    this.rowVersion,
    required this.resource,
    super.auditDetails,
    super.isDeleted = false,
  }): super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
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
