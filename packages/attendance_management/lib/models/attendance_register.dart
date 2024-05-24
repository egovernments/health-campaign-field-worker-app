import 'package:attendance_management/models/staff.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'attendance_audit.dart';
import 'attendee.dart';

part 'attendance_register.mapper.dart';

@MappableClass()
class RegisterAuditDetails extends AttendanceAuditDetails
    with RegisterAuditDetailsMappable {
  final String? registerId;

  const RegisterAuditDetails({
    required String createdBy,
    required int createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
    this.registerId,
  }) : super(
          createdBy: createdBy,
          createdTime: createdTime,
          lastModifiedBy: lastModifiedBy,
          lastModifiedTime: lastModifiedTime,
        );
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterModel with AttendanceRegisterModelMappable {
  static const schemaName = 'AttendanceRegister';

  final String id;
  final String? tenantId;
  final String? registerNumber;
  final String? name;
  final String? referenceId;
  final String? serviceCode;
  final String? status;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final int? startDate;
  final int? endDate;
  final List<AttendeeModel>? attendees;
  final List<StaffModel>? staff;
  final Map<String, dynamic>? additionalDetails;
  final AttendanceAuditDetails? auditDetails;
  final int? completedDays;
  final List<Map<DateTime, bool>>? attendanceLog;

  AttendanceRegisterModel({
    this.additionalDetails,
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
    this.endDate,
    this.attendees,
    this.staff,
    this.auditDetails,
    this.completedDays = 0,
    this.attendanceLog = const [],
  }) : super();
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterAdditionalFields
    with AttendanceRegisterAdditionalFieldsMappable {
  final Map<String, dynamic> description;
  AttendanceRegisterAdditionalFields({
    required this.description,
  });
}
