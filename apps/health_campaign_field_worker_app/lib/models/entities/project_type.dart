// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectTypeSearchModel extends EntitySearchModel {
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  ProjectTypeSearchModel({
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class ProjectTypeModel extends EntityModel {

  static const schemaName = 'ProjectType';

  final ProjectTypeAdditionalFields? additionalFields;
  final String? id;
  final String? name;
  final String? code;
  final String? group;
  final String? beneficiaryType;
  final List<String>? eligibilityCriteria;
  final List<String>? taskProcedure;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final List<ProjectProductVariantModel>? resources;
  

  ProjectTypeModel({
    this.additionalFields,
    this.id,
    this.name,
    this.code,
    this.group,
    this.beneficiaryType,
    this.eligibilityCriteria,
    this.taskProcedure,
    required this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.resources,
    super.auditDetails,
  }): super();

  ProjectTypeCompanion get companion {
    return ProjectTypeCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
      id: Value(id),
      name: Value(name),
      code: Value(code),
      group: Value(group),
      beneficiaryType: Value(beneficiaryType),
      eligibilityCriteria: Value(eligibilityCriteria?.toString()),
      taskProcedure: Value(taskProcedure?.toString()),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class ProjectTypeAdditionalFields extends AdditionalFields {
  ProjectTypeAdditionalFields({
    super.schema = 'ProjectType',
    required super.version,
    super.fields,
  });
}
