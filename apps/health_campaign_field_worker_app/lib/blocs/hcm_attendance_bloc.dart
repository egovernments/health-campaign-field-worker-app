import 'package:attendance_management/attendance_management.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  late Function(List<AttendancePackageRegisterModel> registers) _onDataReceived;

  @override
  void getAttendanceRegisters(
    Function(List<AttendancePackageRegisterModel> registers)
        attendanceRegisters,
  ) {
    _onDataReceived = attendanceRegisters;

    return onDataReceived();
  }

  void onDataReceived() async {
    await Future.delayed(const Duration(seconds: 1));
    _onDataReceived([
      AttendancePackageRegisterModel(
        id: '1',
        name: 'LLIN Bangalore',
        attendees: [],
        staff: [],
      ),
      AttendancePackageRegisterModel(
        id: '2',
        name: 'LLIN Mangalore',
        attendees: [],
        staff: [],
      ),
    ]);
  }
}
