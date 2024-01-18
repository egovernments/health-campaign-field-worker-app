import 'package:attendance_management/attendance_management.dart';

abstract class AttendanceListeners {
  void getAttendanceRegisters(
      Function(List<AttendancePackageRegisterModel> attendancePackageRegisterModel) attendanceRegisters);
}
