import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

import 'attendee.dart';
import 'staff.dart';

part 'attendance_register.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AttendanceRegisterSearchModel extends EntitySearchModel
    with AttendanceRegisterSearchModelMappable {
  final String? id;
  final String? staffId;
  final String? registerNumber;
  final String? status;
  final String? referenceId;
  final String? localityCode;
  final String? serviceCode;
  final int? offSet;
  final int? limit;

  AttendanceRegisterSearchModel({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.serviceCode,
    this.referenceId,
    this.offSet,
    this.limit,
    this.localityCode,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  AttendanceRegisterSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.serviceCode,
    this.referenceId,
    this.offSet,
    this.limit,
    this.localityCode,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AttendanceRegisterModel extends EntityModel
    with AttendanceRegisterModelMappable {
  static const schemaName = 'AttendanceRegister';

  final String id;
  final String? tenantId;
  final String? registerNumber;
  final String? name;
  final String? localityCode;
  final String? referenceId;
  final String? serviceCode;
  final String? status;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final int? startDate;
  final int? endDate;
  final List<IndividualModel>? individualList;
  final List<AttendeeModel>? attendees;
  final List<StaffModel>? staff;
  final Map<String, dynamic>? additionalDetails;
  final int? completedDays;
  final List<Map<DateTime, bool>>? attendanceLog;

  AttendanceRegisterModel({
    required this.id,
    this.tenantId,
    this.registerNumber,
    this.name,
    this.referenceId,
    this.serviceCode,
    this.status,
    this.nonRecoverableError = false,
    this.rowVersion,
    this.startDate,
    this.localityCode,
    this.endDate,
    this.individualList,
    this.attendees,
    this.staff,
    this.completedDays = 0,
    this.attendanceLog = const [],
    this.additionalDetails,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();

  AttendanceRegisterCompanion get companion => AttendanceRegisterCompanion(
        id: Value(id),
        tenantId: Value(tenantId!),
        registerNumber: Value(registerNumber!),
        name: Value(name!),
        referenceId: Value(referenceId!),
        serviceCode: Value(serviceCode!),
        status: Value(status!),
        startDate: Value(startDate),
        endDate: Value(endDate),
        nonRecoverableError: Value(nonRecoverableError),
        auditCreatedBy: Value(auditDetails?.createdBy),
        auditCreatedTime: Value(auditDetails?.createdTime),
        auditModifiedBy: Value(auditDetails?.lastModifiedBy),
        clientCreatedTime: Value(auditDetails?.createdTime),
        clientModifiedTime: Value(auditDetails?.lastModifiedTime),
        clientCreatedBy: Value(auditDetails?.createdBy),
        clientModifiedBy: Value(auditDetails?.lastModifiedBy),
        auditModifiedTime: Value(auditDetails?.lastModifiedTime),
        isDeleted: Value(isDeleted),
        rowVersion: Value(rowVersion),
        additionalFields: Value(jsonEncode(additionalDetails)),
      );
}
