import 'package:attendance_management/models/attendance_log.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'hcm_attendance_log_model.mapper.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceLogSearchModel extends EntitySearchModel with HCMAttendanceLogSearchModelMappable {
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
  });
}

@MappableClass(ignoreNull: true)
class HCMAttendanceLogModel extends EntityModel with HCMAttendanceLogModelMappable {
  static const schemaName = 'Attendance';
  final AttendanceLogModel? attendanceLog;
  final bool? nonRecoverableError;
  final int? rowVersion;

  HCMAttendanceLogModel({
    this.attendanceLog,
    this.nonRecoverableError = false,
    this.rowVersion,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceCompanion get companion => AttendanceCompanion(
        id: Value(attendanceLog?.id),
        clientReferenceId: Value(attendanceLog?.clientReferenceId),
        tenantId: Value(attendanceLog!.tenantId!),
        registerId: Value(attendanceLog!.registerId!),
        status: Value(attendanceLog?.status!),
        time: Value(attendanceLog?.time),
        type: Value(attendanceLog?.type),
        uploadToServer: Value(attendanceLog?.uploadToServer),
        individualId: Value(attendanceLog!.individualId!),
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
      );
}
