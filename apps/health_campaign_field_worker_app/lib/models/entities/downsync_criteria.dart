// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class DownsyncCriteriaSearchModel extends EntitySearchModel {
  final String? projectId;
  final List<String>? clientReferenceId;
  
  DownsyncCriteriaSearchModel({
    this.projectId,
    this.clientReferenceId,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  DownsyncCriteriaSearchModel.ignoreDeleted({
    this.projectId,
    this.clientReferenceId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class DownsyncCriteriaModel extends EntityModel {

  static const schemaName = 'DownsyncCriteria';

  final String? locality;
  final String? tenantId;
  final int? offset;
  final int? limit;
  final String? projectId;
  final int? lastSyncedTime;
  final int? totalCount;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final int? rowVersion;
  final DownsyncCriteriaAdditionalFields? additionalFields;

  DownsyncCriteriaModel({
    this.additionalFields,
    this.locality,
    this.tenantId,
    this.offset,
    this.limit,
    this.projectId,
    this.lastSyncedTime,
    this.totalCount,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  DownsyncCriteriaCompanion get companion {
    return DownsyncCriteriaCompanion(
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
      tenantId: Value(tenantId),
      offset: Value(offset),
      limit: Value(limit),
      projectId: Value(projectId),
      lastSyncedTime: Value(lastSyncedTime),
      totalCount: Value(totalCount),
      nonRecoverableError: Value(nonRecoverableError),
      clientReferenceId: Value(clientReferenceId),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true)
class DownsyncCriteriaAdditionalFields extends AdditionalFields {
  DownsyncCriteriaAdditionalFields({
    super.schema = 'DownsyncCriteria',
    required super.version,
    super.fields,
  });
}
