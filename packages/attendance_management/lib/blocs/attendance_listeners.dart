import 'package:attendance_management/attendance_management.dart';

abstract class AttendanceListeners {
  void getAttendanceRegisters(
      Function(List<AttendancePackageRegisterModel> attendancePackageRegisterModel) attendanceRegisters);

  void loadLocalization(List codes);
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

  void loadLocalization(List codes) {
    _attendanceListeners?.loadLocalization(codes);
    AttendanceBloc(const RegisterLoading()).add(LoadLocalization(codes));
  }
}