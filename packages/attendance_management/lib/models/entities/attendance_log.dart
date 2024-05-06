import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

part 'attendance_log.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AttendanceLogSearchModel extends EntitySearchModel
    with AttendanceLogSearchModelMappable {
  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? time;
  final int? entryTime;
  final int? exitTime;
  final String? type;
  final String? status;
  final List<String>? clientReferenceId;
  final bool? uploadToServer;

  AttendanceLogSearchModel({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.entryTime,
    this.exitTime,
    this.clientReferenceId,
    this.uploadToServer,
    super.additionalFields,
    super.auditDetails,
  }) : super(isDeleted: false);

  @MappableConstructor()
  AttendanceLogSearchModel.ignoreDeleted({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.entryTime,
    this.exitTime,
    this.clientReferenceId,
    this.uploadToServer,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class AttendanceLogModel extends EntityModel with AttendanceLogModelMappable {
  static const schemaName = 'AttendanceLog';

  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? time;
  final String? status;
  final String? type;
  final String? clientReferenceId;
  final bool? uploadToServer;
  final List<String>? documentIds;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final AttendanceLogAdditionalFields? additionalDetails;

  AttendanceLogModel({
    this.id,
    this.tenantId,
    this.registerId,
    this.individualId,
    this.type,
    this.time,
    this.status,
    this.clientReferenceId,
    this.uploadToServer = false,
    this.documentIds = const [],
    this.nonRecoverableError = false,
    this.rowVersion,
    this.additionalDetails,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceCompanion get companion {
    return AttendanceCompanion(
      id: Value(id),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId!),
      registerId: Value(registerId!),
      status: Value(status!),
      time: Value(time),
      type: Value(type),
      uploadToServer: Value(uploadToServer),
      individualId: Value(individualId!),
      nonRecoverableError: Value(nonRecoverableError),
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(auditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      additionalFields: Value(additionalDetails?.toJson()),
    );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AttendanceLogAdditionalFields extends AdditionalFields
    with AttendanceLogAdditionalFieldsMappable {
  AttendanceLogAdditionalFields({
    super.schema = 'AttendanceLog',
    required int? version,
    super.fields,
  }) : super(version: version ?? 1);
}
