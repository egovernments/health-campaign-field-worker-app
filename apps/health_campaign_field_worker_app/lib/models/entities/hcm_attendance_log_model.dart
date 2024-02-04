import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceLogSearchModel extends EntitySearchModel {
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
class HCMAttendanceLogModel extends EntityModel {
  static const schemaName = 'Attendance';
  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? name;
  final String? individualId;
  final int? time;
  final bool? nonRecoverableError;
  final String? type;
  final String? status;
  final int? rowVersion;
  final String? clientReferenceId;
  final bool? uploadToServer;

  HCMAttendanceLogModel({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.clientReferenceId,
    this.name,
    this.rowVersion,
    this.nonRecoverableError = false,
    this.uploadToServer = false,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceCompanion get companion => AttendanceCompanion(
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
      );
}
