import 'package:attendance_management/attendance_management.dart';

abstract class AttendanceListeners {
  void getAttendanceRegisters(
      Function(List<AttendancePackageRegisterModel> attendancePackageRegisterModel) attendanceRegisters);
}

class AttendanceSingleton {
  static final AttendanceSingleton _singleton = AttendanceSingleton._internal();

  factory AttendanceSingleton() {
    return _singleton;
  }

  AttendanceSingleton._internal();

  AttendanceListeners? _attendanceListeners;

  void setAttendanceListeners(AttendanceListeners attendanceListeners) {
    _attendanceListeners = attendanceListeners;
  }

  void getAttendanceRegisters(
      Function(List<AttendancePackageRegisterModel> attendancePackageRegisterModel) attendanceRegisters) {
    _attendanceListeners?.getAttendanceRegisters(attendanceRegisters);
  }
}