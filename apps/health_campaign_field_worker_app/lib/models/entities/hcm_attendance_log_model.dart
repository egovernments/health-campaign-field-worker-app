import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'hcm_attendance_log_model.mapper.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceLogSearchModel extends EntitySearchModel
    with HCMAttendanceLogSearchModelMappable {
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

  HCMAttendanceLogSearchModel({
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
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HCMAttendanceLogSearchModel.ignoreDeleted({
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
}

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class HCMAttendanceLogModel extends EntityModel
    with HCMAttendanceLogModelMappable {
  static const schemaName = 'AttendanceLog';
  final AttendanceLogModel? attendance;
  final bool? nonRecoverableError;
  final int? rowVersion;

  HCMAttendanceLogModel({
    this.attendance,
    this.nonRecoverableError = false,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceCompanion get companion => AttendanceCompanion(
        id: Value(attendance?.id),
        clientReferenceId: Value(attendance?.clientReferenceId),
        tenantId: Value(attendance!.tenantId!),
        registerId: Value(attendance!.registerId!),
        status: Value(attendance?.status!),
        time: Value(attendance?.time),
        type: Value(attendance?.type),
        uploadToServer: Value(attendance?.uploadToServer),
        individualId: Value(attendance!.individualId!),
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
        additionalFields: Value(json.encode(attendance?.additionalDetails)),
      );
}
