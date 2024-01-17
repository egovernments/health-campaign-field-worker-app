import 'package:attendance_management/models/attendance_register.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceSearchModel extends EntitySearchModel {
  final AttendanceRegisterSearchModel attendanceSearchRegister;

  HCMAttendanceSearchModel({
    required this.attendanceSearchRegister,
    super.boundaryCode,
    super.isDeleted,
  }) : super();
}

@MappableClass(ignoreNull: true)
class HCMAttendanceRegisterModel extends EntityModel {
  final AttendancePackageRegisterModel attendanceRegister;

  HCMAttendanceRegisterModel({
    required this.attendanceRegister,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceRegisterCompanion get companion => AttendanceRegisterCompanion(
        id: Value(attendanceRegister.id),
        tenantId: Value(attendanceRegister.tenantId!),
        registerNumber: Value(attendanceRegister.registerNumber!),
        name: Value(attendanceRegister.name!),
        referenceId: Value(attendanceRegister.referenceId!),
        serviceCode: Value(attendanceRegister.serviceCode!),
        status: Value(attendanceRegister.status!),
        startDate: Value(attendanceRegister.startDateTime),
        endDate: Value(attendanceRegister.endDateTime),
        nonRecoverableError: Value(attendanceRegister.nonRecoverableError),
        auditCreatedBy: Value(auditDetails?.createdBy),
        auditCreatedTime: Value(auditDetails?.createdTime),
        auditModifiedBy: Value(auditDetails?.lastModifiedBy),
        clientCreatedTime: Value(clientAuditDetails?.createdTime),
        clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
        clientCreatedBy: Value(clientAuditDetails?.createdBy),
        clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
        auditModifiedTime: Value(auditDetails?.lastModifiedTime),
        isDeleted: Value(isDeleted),
        rowVersion: Value(attendanceRegister.rowVersion),
      );
}

@MappableClass(ignoreNull: true)
class HCMAttendanceAdditionalModel extends AdditionalFields {
  final AttendanceRegisterAdditionalFields attendanceAdditionalFields;

  HCMAttendanceAdditionalModel(
      {required this.attendanceAdditionalFields,
      super.schema = 'AttendanceRegister',
      required super.version,});
}
