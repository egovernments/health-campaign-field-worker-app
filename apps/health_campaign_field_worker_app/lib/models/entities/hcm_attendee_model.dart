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
  final String? type;
  final String? status;
  final List<String>? clientReferenceId;

  HCMAttendanceLogSearchModel({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.clientReferenceId,
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
    this.clientReferenceId,
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
  final int? status;
  final int? rowVersion;
  final String? clientReferenceId;

  HCMAttendanceLogModel({
    this.id,
    this.registerId,
    this.individualId,
    this.status = -1,
    this.type,
    this.tenantId,
    this.time,
    this.clientReferenceId,
    this.name,
    this.rowVersion,
    this.nonRecoverableError = false,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceCompanion get companion => AttendanceCompanion(
        id: Value(id),
        tenantId: Value(tenantId!),
        registerId: Value(registerId!),
        status: Value(status!),
        time: Value(time),
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
