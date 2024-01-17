import 'package:dart_mappable/dart_mappable.dart';

import 'attendee.dart';
import 'staff.dart';

@MappableClass(ignoreNull: true)
class AttendanceRegisterSearchModel {
  final String? id;
  final List<String>? clientReferenceId;
  final List<StaffSearchModel>? staff;
  final List<AttendeeSearchModel>? attendees;

  AttendanceRegisterSearchModel({
    this.id,
    this.clientReferenceId,
    this.staff,
    this.attendees,
  }) : super();

  @MappableConstructor()
  AttendanceRegisterSearchModel.ignoreDeleted({
    this.id,
    this.clientReferenceId,
    this.staff,
    this.attendees,
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
  final List<StaffModel>? staff;
  final List<AttendeeModel>? attendees;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final AttendanceRegisterAdditionalFields? additionalFields;

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
    this.staff,
    this.attendees,
    int? startDate,
    int? endDate,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate),
        super();

  int? get startDate => startDateTime?.millisecondsSinceEpoch;

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
}

@MappableClass(ignoreNull: true)
class AttendanceRegisterAdditionalFields {
  final Map<String, dynamic> description;
  AttendanceRegisterAdditionalFields({
    required this.description,
  });
}
