import 'package:dart_mappable/dart_mappable.dart';

import '../data_model.dart';
import 'package:attendance_management/models/attendance_register.dart';

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
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();
}

@MappableClass(ignoreNull: true)
class HCMAttendanceAdditionalModel extends AdditionalFields {
  final AttendanceRegisterAdditionalFields attendanceAdditionalFields;

  HCMAttendanceAdditionalModel({
    required this.attendanceAdditionalFields,
    super.schema = 'AttendanceRegister',
    required super.version});
}