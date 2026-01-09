import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import 'package:digit_data_model/data_model.dart';

part 'hf_referral_downsync.mapper.dart';

@MappableClass(
    ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralDownsyncSearchModel extends EntitySearchModel
    with HFReferralDownsyncSearchModelMappable {
  final String? locality;
  final String? projectId;
  final int? offset;
  final int? limit;
  final int? lastSyncedTime;
  final int? totalCount;
  final String? boundaryName;
  final String? tenantId;

  HFReferralDownsyncSearchModel({
    this.locality,
    this.projectId,
    this.offset,
    this.limit,
    this.lastSyncedTime,
    this.totalCount,
    this.boundaryName,
    this.tenantId,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HFReferralDownsyncSearchModel.ignoreDeleted({
    this.locality,
    this.projectId,
    this.offset,
    this.limit,
    this.lastSyncedTime,
    this.totalCount,
    this.boundaryName,
    this.tenantId,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(
    ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralDownsyncModel extends EntityModel
    with HFReferralDownsyncModelMappable {
  static const schemaName = 'HFReferralDownsync';

  final String? locality;
  final String? projectId;
  final int? offset;
  final int? limit;
  final int? lastSyncedTime;
  final int? totalCount;
  final String? boundaryName;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final HFReferralDownsyncAdditionalFields? additionalFields;

  HFReferralDownsyncModel({
    this.additionalFields,
    this.locality,
    this.projectId,
    this.offset,
    this.limit,
    this.lastSyncedTime,
    this.totalCount,
    this.boundaryName,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  HFReferralDownsyncCompanion get companion {
    return HFReferralDownsyncCompanion(
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
      locality: Value(locality),
      projectId: Value(projectId),
      offset: Value(offset),
      limit: Value(limit),
      lastSyncedTime: Value(lastSyncedTime),
      totalCount: Value(totalCount),
      boundaryName: Value(boundaryName),
      nonRecoverableError: Value(nonRecoverableError),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(
    ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HFReferralDownsyncAdditionalFields extends AdditionalFields
    with HFReferralDownsyncAdditionalFieldsMappable {
  HFReferralDownsyncAdditionalFields({
    super.schema = 'HFReferralDownsync',
    required super.version,
    super.fields,
  });
}