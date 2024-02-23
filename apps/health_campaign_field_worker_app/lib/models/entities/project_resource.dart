// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'project_resource.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceSearchModel extends EntitySearchModel with ProjectResourceSearchModelMappable {
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

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceModel extends EntityModel with ProjectResourceModelMappable {

  static const schemaName = 'ProjectResource';

  final String? id;
  final String? projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProjectProductVariantModel resource;
  final ProjectResourceAdditionalFields? additionalFields;

  ProjectResourceModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    required this.resource,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ProjectResourceCompanion get companion {
    return ProjectResourceCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      projectId: Value(projectId),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      resource: Value(resource.productVariantId),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectResourceAdditionalFields extends AdditionalFields with ProjectResourceAdditionalFieldsMappable {
  ProjectResourceAdditionalFields({
    super.schema = 'ProjectResource',
    required super.version,
    super.fields,
  });
}

