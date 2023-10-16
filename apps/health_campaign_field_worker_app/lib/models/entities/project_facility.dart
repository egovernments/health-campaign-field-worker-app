// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class ProjectFacilitySearchModel extends EntitySearchModel {
  final String? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;
  
  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  ProjectFacilitySearchModel.ignoreDeleted({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class ProjectFacilityModel extends EntityModel {

  static const schemaName = 'ProjectFacility';

  final String id;
  final String facilityId;
  final String projectId;
  final String? tenantId;
  final int? rowVersion;
  final ProjectFacilityAdditionalFields? additionalFields;

  ProjectFacilityModel({
    this.additionalFields,
    required this.id,
    required this.facilityId,
    required this.projectId,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  ProjectFacilityCompanion get companion {
    return ProjectFacilityCompanion(
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
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class ProjectFacilityAdditionalFields extends AdditionalFields {
  ProjectFacilityAdditionalFields({
    super.schema = 'ProjectFacility',
    required super.version,
    super.fields,
  });
}
