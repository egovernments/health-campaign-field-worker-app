// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'project_staff.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectStaffSearchModel extends EntitySearchModel with ProjectStaffSearchModelMappable {
  final String? id;
  final String? staffId;
  final String? userId;
  final String? projectId;
  final String? tenantId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  
  ProjectStaffSearchModel({
    this.id,
    this.staffId,
    this.userId,
    this.projectId,
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
  ProjectStaffSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
    this.userId,
    this.projectId,
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
class ProjectStaffModel extends EntityModel with ProjectStaffModelMappable {

  static const schemaName = 'ProjectStaff';

  final String id;
  final String? staffId;
  final String? userId;
  final String? projectId;
  final String? channel;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final ProjectStaffAdditionalFields? additionalFields;

  ProjectStaffModel({
    this.additionalFields,
    required this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.channel,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
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
  

  ProjectStaffCompanion get companion {
    return ProjectStaffCompanion(
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
      staffId: Value(staffId),
      userId: Value(userId),
      projectId: Value(projectId),
      channel: Value(channel),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      startDate: Value(startDate),
      endDate: Value(endDate),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectStaffAdditionalFields extends AdditionalFields with ProjectStaffAdditionalFieldsMappable {
  ProjectStaffAdditionalFields({
    super.schema = 'ProjectStaff',
    required super.version,
    super.fields,
  });
}

