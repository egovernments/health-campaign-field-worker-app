// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'user_action.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionSearchModel extends EntitySearchModel with UserActionSearchModelMappable {
  final List<String>? id;
  final List<String>? clientReferenceId;
  final String? projectId;
  final String? tenantId;
  final String? createdBy;
  final String? status;
  final int? offset;
  final int? limit;

  UserActionSearchModel({
    this.id,
    this.projectId,
    this.createdBy,
    this.status,
    this.offset,
    this.limit,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  });

  @MappableConstructor()
  UserActionSearchModel.ignoreDeleted({
    this.id,
    this.projectId,
    this.createdBy,
    this.status,
    this.offset,
    this.limit,
    this.clientReferenceId,
    this.tenantId,
    super.boundaryCode,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionModel extends EntityModel with UserActionModelMappable {
  static const schemaName = 'UserAction';

  final String? id;
  final String? projectId;
  final String? status;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final String? boundary;
  final int? rowVersion;
  final String? resourceTag;
  final String? beneficiaryTag;
  final String? action;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final UserActionAdditionalFields? additionalFields;

  UserActionModel({
    this.additionalFields,
    this.id,
    this.projectId,
    this.status,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.boundary,
    this.rowVersion,
    this.beneficiaryTag,
    this.resourceTag,
    this.action,
    this.longitude,
    this.latitude,
    this.locationAccuracy,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  })  : super();


  UserActionCompanion get companion {
    return UserActionCompanion(
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
      status: Value(status),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      boundaryCode: Value(boundary),
      rowVersion: Value(rowVersion),
      action: Value(action),
      beneficiaryTags: Value(beneficiaryTag),
      resourceTags: Value(resourceTag),
      latitude: Value(latitude),
      longitude: Value(longitude),
      locationAccuracy: Value(locationAccuracy),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionAdditionalFields extends AdditionalFields
    with UserActionAdditionalFieldsMappable {
  UserActionAdditionalFields({
    super.schema = 'UserAction',
    required super.version,
    super.fields,
  });
}
