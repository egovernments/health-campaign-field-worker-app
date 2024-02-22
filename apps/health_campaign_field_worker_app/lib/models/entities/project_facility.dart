// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'project_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilitySearchModel extends EntitySearchModel with ProjectFacilitySearchModelMappable {
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

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilityModel extends EntityModel with ProjectFacilityModelMappable {

  static const schemaName = 'ProjectFacility';

  final String id;
  final String facilityId;
  final String projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProjectFacilityAdditionalFields? additionalFields;

  ProjectFacilityModel({
    this.additionalFields,
    required this.id,
    required this.facilityId,
    required this.projectId,
    this.nonRecoverableError = false,
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
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilityAdditionalFields extends AdditionalFields with ProjectFacilityAdditionalFieldsMappable {
  ProjectFacilityAdditionalFields({
    super.schema = 'ProjectFacility',
    required super.version,
    super.fields,
  });
}

