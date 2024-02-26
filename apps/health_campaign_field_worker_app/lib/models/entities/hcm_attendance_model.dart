import 'dart:convert';

import 'package:attendance_management/models/attendance_register.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../../data/local_store/sql_store/sql_store.dart';
import '../data_model.dart';

part 'hcm_attendance_model.mapper.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceSearchModel extends EntitySearchModel
    with HCMAttendanceSearchModelMappable {
  final String? id;
  final String? staffId;
  final String? registerNumber;
  final String? status;
  final String? referenceId;
  final String? serviceCode;

  HCMAttendanceSearchModel({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.serviceCode,
    this.referenceId,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  HCMAttendanceSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.referenceId,
    this.serviceCode,
    super.additionalFields,
    super.auditDetails,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class HCMAttendanceRegisterModel extends EntityModel
    with HCMAttendanceRegisterModelMappable {
  static const schemaName = 'AttendanceRegister';
  final AttendanceRegisterModel attendanceRegister;
  final List<IndividualModel>? individualList;

  HCMAttendanceRegisterModel({
    required this.attendanceRegister,
    this.individualList,
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
        startDate: Value(attendanceRegister.startDate),
        endDate: Value(attendanceRegister.endDate),
        nonRecoverableError: Value(attendanceRegister.nonRecoverableError),
        auditCreatedBy: Value(attendanceRegister.auditDetails?.createdBy),
        auditCreatedTime: Value(attendanceRegister.auditDetails?.createdTime),
        auditModifiedBy: Value(attendanceRegister.auditDetails?.lastModifiedBy),
        clientCreatedTime: Value(attendanceRegister.auditDetails?.createdTime),
        clientModifiedTime:
            Value(attendanceRegister.auditDetails?.lastModifiedTime),
        clientCreatedBy: Value(attendanceRegister.auditDetails?.createdBy),
        clientModifiedBy:
            Value(attendanceRegister.auditDetails?.lastModifiedBy),
        auditModifiedTime:
            Value(attendanceRegister.auditDetails?.lastModifiedTime),
        isDeleted: Value(isDeleted),
        rowVersion: Value(attendanceRegister.rowVersion),
        additionalFields:
            Value(json.encode(attendanceRegister.additionalDetails)),
      );
}

@MappableClass(ignoreNull: true)
class HCMAttendanceAdditionalModel extends AdditionalFields
    with HCMAttendanceAdditionalModelMappable {
  final AttendanceRegisterAdditionalFields attendanceAdditionalFields;

  HCMAttendanceAdditionalModel({
    required this.attendanceAdditionalFields,
    super.schema = 'AttendanceRegister',
    required super.version,
  });
}
