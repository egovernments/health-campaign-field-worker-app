import 'package:attendance_management/attendance_management.dart';
import 'package:dart_mappable/dart_mappable.dart';

import 'attendance_audit.dart';

@MappableClass()
class RegisterAuditDetails extends AttendanceAuditDetails {
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
class AttendanceRegisterSearchModel {
  final String? id;
  final List<String>? clientReferenceId;

  AttendanceRegisterSearchModel({
    this.id,
    this.clientReferenceId,
  }) : super();

  @MappableConstructor()
  AttendanceRegisterSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
  });
}

@MappableClass(ignoreNull: true)
class AttendancePackageRegisterModel {
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
  final AttendanceRegisterAdditionalFields? additionalFields;
  final AttendanceAuditDetails? auditDetails;

  AttendancePackageRegisterModel({
    this.additionalFields,
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
  }) : super();
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterAdditionalFields {
  final Map<String, dynamic> description;
  AttendanceRegisterAdditionalFields({
    required this.description,
  });
}
