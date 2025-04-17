// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'unique_id_pool.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolSearchModel extends EntitySearchModel
    with UniqueIdPoolSearchModelMappable {
  final String? id;
  final String? userUuid;
  final String? deviceUuid;
  final String? deviceInfo;
  final int? count;
  final String? status;
  final String? tenantId;
  final bool? fetchAllocatedIds;

  UniqueIdPoolSearchModel({
    this.id,
    this.status,
    this.deviceUuid,
    this.userUuid,
    this.count,
    this.deviceInfo,
    this.tenantId,
    this.fetchAllocatedIds,
    super.isDeleted,
    super.boundaryCode,
  }) : super();

  @MappableConstructor()
  UniqueIdPoolSearchModel.ignoreDeleted({
    this.id,
    this.status,
    this.deviceUuid,
    this.deviceInfo,
    this.count,
    this.userUuid,
    this.tenantId,
    this.fetchAllocatedIds,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolModel extends EntityModel with UniqueIdPoolModelMappable {
  static const schemaName = 'UniqueIds';

  final String id;
  final String? userUuid;
  final String? deviceUuid;
  final String status;
  final int? rowVersion;
  final String? tenantId;
  final UniqueIdPoolAdditionalFields? additionalFields;

  UniqueIdPoolModel({
    required this.id,
    required this.status,
    required this.deviceUuid,
    required this.userUuid,
    this.rowVersion,
    this.tenantId,
    this.additionalFields,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  UniqueIdPoolCompanion get companion {
    return UniqueIdPoolCompanion(
      id: Value(id),
      userUuid: Value(userUuid!),
      deviceUuid: Value(deviceUuid!),
      status: Value(status),
      tenantId: Value(tenantId),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      additionalFields: Value(additionalFields?.toJson()),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdPoolAdditionalFields extends AdditionalFields
    with UniqueIdPoolAdditionalFieldsMappable {
  UniqueIdPoolAdditionalFields({
    super.schema = 'UniqueIds',
    super.version = 1, // TODO: revert once backend handles null
    super.fields,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UniqueIdSearchResponse extends EntityModel
    with UniqueIdSearchResponseMappable {
  final List<UniqueIdPoolModel> models;
  final int fetchLimit;

  UniqueIdSearchResponse({
    required this.models,
    required this.fetchLimit,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  });
}
