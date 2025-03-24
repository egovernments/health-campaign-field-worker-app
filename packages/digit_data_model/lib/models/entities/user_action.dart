// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import '../../data_model.dart';

part 'user_action.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserActionSearchModel extends EntitySearchModel
    with UserActionSearchModelMappable {
  final double latitude;
  final double longitude;
  final bool isSync;
  final int timestamp;

  UserActionSearchModel({
    required this.latitude,
    required this.longitude,
    required this.isSync,
    required this.timestamp,
    super.isDeleted,
    super.boundaryCode,
  }) : super();

  @MappableConstructor()
  UserActionSearchModel.ignoreDeleted({
    required this.latitude,
    required this.longitude,
    required this.isSync,
    required this.timestamp,
    super.boundaryCode,
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
  final int? rowVersion;
  final String projectId;
  final String boundaryCode;
  final String action;
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
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();
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
