import 'package:attendance_management/attendance_management.dart';

abstract class AttendanceListeners {
  void getAttendanceRegisters(
      Function(
              List<AttendancePackageRegisterModel>
                  attendancePackageRegisterModel)
          attendanceRegisters);

  void onHcmLocalizationChanged(Function(List<dynamic> locales) localizedStrings);
}

class AttendanceSingleton {
  static final AttendanceSingleton _singleton = AttendanceSingleton._internal();

  factory AttendanceSingleton() {
    return _singleton;
  }

  AttendanceSingleton._internal();

  AttendanceListeners? _attendanceListeners;
  String _projectId = '';
  String _userId = '';

  List<String> _localeCodes = [];

  void setAttendanceListeners(
      {required AttendanceListeners attendanceListeners,
      required String projectId,
      required String userId}) {
    _attendanceListeners = attendanceListeners;
    _projectId = projectId;
    _userId = userId;
  }

  get projectId => _projectId;
  get userId => _userId;

  void getAttendanceRegisters(
      Function(
              List<AttendancePackageRegisterModel>
                  attendancePackageRegisterModel)
          attendanceRegisters) {
    _attendanceListeners?.getAttendanceRegisters(attendanceRegisters);
  }

  void onHcmLocalizationChanged(Function(List<dynamic> locales) localizedStrings) {
    _attendanceListeners?.onHcmLocalizationChanged(localizedStrings);
  }
}
