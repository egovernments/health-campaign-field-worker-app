// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'downsync.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DownsyncSearchModel extends EntitySearchModel with DownsyncSearchModelMappable {
  final String? locality;
  final String? projectId;
  final int? offset;
  final int? limit;
  final int? lastSyncedTime;
  final int? totalCount;
  final String? boundaryName;
  final String? tenantId;
  
  DownsyncSearchModel({
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
  }):  super();

  @MappableConstructor()
  DownsyncSearchModel.ignoreDeleted({
    this.locality,
    this.projectId,
    this.offset,
    this.limit,
    this.lastSyncedTime,
    this.totalCount,
    this.boundaryName,
    this.tenantId,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DownsyncModel extends EntityModel with DownsyncModelMappable {

  static const schemaName = 'Downsync';

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
  final DownsyncAdditionalFields? additionalFields;

  DownsyncModel({
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
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  DownsyncCompanion get companion {
    return DownsyncCompanion(
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

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DownsyncAdditionalFields extends AdditionalFields with DownsyncAdditionalFieldsMappable {
  DownsyncAdditionalFields({
    super.schema = 'Downsync',
    required super.version,
    super.fields,
  });
}

