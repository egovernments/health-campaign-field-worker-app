import 'package:attendance_management/attendance_management.dart';

abstract class AttendanceListeners {
  void getAttendanceRegisters(
      Function(
              List<AttendancePackageRegisterModel>
                  attendancePackageRegisterModel)
          attendanceRegisters);

  void searchAttendanceLog(SearchAttendanceLog individualAttendanceLogSearch);

  void markIndividualAttendance(
      MarkIndividualAttendance markIndividualAttendance);

  void submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  );
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

  void searchAttendanceLog(SearchAttendanceLog searchAttendanceLog) {
    _attendanceListeners?.searchAttendanceLog(searchAttendanceLog);
  }

  void submitAttendanceDetails(SubmitAttendanceDetails attendanceLogs) {
    _attendanceListeners?.submitAttendanceDetails(attendanceLogs);
  }

  void markIndividualAttendance(
      MarkIndividualAttendance markIndividualAttendance) {
    _attendanceListeners?.markIndividualAttendance(markIndividualAttendance);
  }
}

class SearchAttendanceLog {
  final String registerId;
  final String tenantId;
  final int entryTime;
  final int exitTime;
  final int currentDate;
  final List<AttendeeModel> attendees;
  final int offset;
  final int limit;
  final Function(dynamic individualSearchResponse) onLogLoaded;

  SearchAttendanceLog({
    required this.registerId,
    required this.tenantId,
    required this.entryTime,
    required this.exitTime,
    required this.currentDate,
    required this.attendees,
    required this.offset,
    required this.limit,
    required this.onLogLoaded,
  });
}

class MarkIndividualAttendance {
  final int entryTime;
  final int exitTime;
  final String status;
  final String individualId;
  final String registerId;
  final String id;
  final Function(String message) onMarked;

  MarkIndividualAttendance({
    required this.entryTime,
    required this.exitTime,
    required this.status,
    required this.individualId,
    required this.registerId,
    required this.id,
    required this.onMarked,
  });
}

class SubmitAttendanceDetails {
  final List<AttendanceLogModel> attendanceLogs;
  final Function(bool message) onMarked;

  SubmitAttendanceDetails({
    required this.attendanceLogs,
    required this.onMarked,
  });
}
