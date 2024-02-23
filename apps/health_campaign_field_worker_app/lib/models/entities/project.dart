// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'project.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectSearchModel extends EntitySearchModel with ProjectSearchModelMappable {
  final String? id;
  final String? projectTypeId;
  final String? projectNumber;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? referenceId;
  final String? tenantId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectSearchModel({
    this.id,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
    this.tenantId,
    int? startDate,
    int? endDate,
    super.boundaryCode,
    super.isDeleted,
  }): startDateTime = startDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(startDate),
  endDateTime = endDate == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(endDate),
   super();

  @MappableConstructor()
  ProjectSearchModel.ignoreDeleted({
    this.id,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
    this.tenantId,
    int? startDate,
    int? endDate,
    super.boundaryCode,
  }): startDateTime = startDate == null
  ? null
      : DateTime.fromMillisecondsSinceEpoch(startDate),
  endDateTime = endDate == null
  ? null
      : DateTime.fromMillisecondsSinceEpoch(endDate),
   super(isDeleted: false);

  int? get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
  
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectModel extends EntityModel with ProjectModelMappable {

  static const schemaName = 'Project';

  final String id;
  final String? projectTypeId;
  final String? projectNumber;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String name;
  final String? department;
  final String? description;
  final String? referenceId;
  final String? projectHierarchy;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;
  final List<TargetModel>? targets;
  final List<DocumentModel>? documents;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final ProjectAdditionalFields? additionalFields;

  ProjectModel({
    this.additionalFields,
    required this.id,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    required this.name,
    this.department,
    this.description,
    this.referenceId,
    this.projectHierarchy,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.address,
    this.targets,
    this.documents,
    int? startDate,
    int? endDate,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): startDateTime = startDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startDate),
      endDateTime = endDate == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(endDate),
      super();

  int?  get startDate => startDateTime?.millisecondsSinceEpoch;
  

  int?  get endDate => endDateTime?.millisecondsSinceEpoch;
  

  ProjectCompanion get companion {
    return ProjectCompanion(
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
      projectTypeId: Value(projectTypeId),
      projectNumber: Value(projectNumber),
      subProjectTypeId: Value(subProjectTypeId),
      isTaskEnabled: Value(isTaskEnabled),
      parent: Value(parent),
      name: Value(name),
      department: Value(department),
      description: Value(description),
      referenceId: Value(referenceId),
      projectHierarchy: Value(projectHierarchy),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      startDate: Value(startDate),
      endDate: Value(endDate),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectAdditionalFields extends AdditionalFields with ProjectAdditionalFieldsMappable {
  ProjectAdditionalFields({
    super.schema = 'Project',
    required super.version,
    super.fields,
  });
}

