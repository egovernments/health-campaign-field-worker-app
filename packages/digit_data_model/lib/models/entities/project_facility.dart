// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'project_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilitySearchModel extends EntitySearchModel
    with ProjectFacilitySearchModelMappable {
  final List<String>? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;
  final List<String>? boundaryTypes;

  final List<String>? clientReferenceId;

  ProjectFacilitySearchModel({
    this.id,
    this.clientReferenceId,
    this.facilityId,
    this.projectId,
    this.tenantId,
    this.boundaryTypes,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  ProjectFacilitySearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
    this.facilityId,
    this.projectId,
    this.tenantId,
    this.boundaryTypes,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilityModel extends EntityModel
    with ProjectFacilityModelMappable {
  static const schemaName = 'ProjectFacility';

  final String id;

  /// App-local id of a link created on the phone (never sent to the
  /// server). While unsynced the app stores the same value in [id].
  final String? clientReferenceId;
  final String facilityId;
  final String projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final ProjectFacilityAdditionalFields? additionalFields;

  ProjectFacilityModel({
    this.additionalFields,
    required this.id,
    this.clientReferenceId,
    required this.facilityId,
    required this.projectId,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

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
      clientReferenceId: Value(clientReferenceId),
      facilityId: Value(facilityId),
      projectId: Value(projectId),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilityAdditionalFields extends AdditionalFields
    with ProjectFacilityAdditionalFieldsMappable {
  ProjectFacilityAdditionalFields({
    super.schema = 'ProjectFacility',
    required super.version,
    super.fields,
  });
}
