// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data_model.dart';

part 'user_action.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionSearchModel extends EntitySearchModel
    with UserActionSearchModelMappable {
  final double? latitude;
  final double? longitude;
  final bool? isSync;
  final int? timestamp;

  UserActionSearchModel({
    this.latitude,
    this.longitude,
    this.isSync,
    this.timestamp,
    super.isDeleted,
    super.boundaryCode,
    super.auditDetails,
  }) : super();

  @MappableConstructor()
  UserActionSearchModel.ignoreDeleted({
    required this.latitude,
    required this.longitude,
    required this.isSync,
    required this.timestamp,
    super.boundaryCode,
    super.auditDetails,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionModel extends EntityModel with UserActionModelMappable {
  static const schemaName = 'UserAction';
  final double latitude;
  final double longitude;
  final double locationAccuracy;
  final String clientReferenceId;
  final bool isSync;
  final int timestamp;
  final bool? nonRecoverableError;
  final String? tenantId;
  final String? id;
  final int? rowVersion;
  final String projectId;
  final String boundaryCode;
  final String action;
  final String? beneficiaryTag;
  final String? resourceTag;
  final UserActionAdditionalFields? additionalFields;

  UserActionModel({
    this.additionalFields,
    required this.latitude,
    required this.longitude,
    required this.locationAccuracy,
    required this.clientReferenceId,
    required this.isSync,
    required this.timestamp,
    required this.projectId,
    required this.boundaryCode,
    required this.action,
    this.beneficiaryTag,
    this.resourceTag,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.id,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  UserActionCompanion get companion {
    return UserActionCompanion(
      projectId: Value(projectId),
      additionalFields: Value(additionalFields?.toJson()),
      longitude: Value(longitude.toString()),
      latitude: Value(latitude.toString()),
      locationAccuracy: Value(locationAccuracy.toString()),
      tenantId: Value(tenantId),
      isDeleted: Value(isDeleted),
      clientReferenceId: Value(clientReferenceId),
      action: Value(action),
      beneficiaryTag: Value(beneficiaryTag),
      resourceTag: Value(resourceTag),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      boundaryCode: Value(boundaryCode),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      isSync: Value(isSync),
      nonRecoverableError: Value(nonRecoverableError),
      timestamp: Value(timestamp),
      id: Value(id),
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
