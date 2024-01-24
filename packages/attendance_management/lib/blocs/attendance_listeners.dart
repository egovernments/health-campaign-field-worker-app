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

  void submitAttendanceDetails(SubmitAttendanceDetails submitAttendanceDetails);
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

  void submitAttendanceDetails(
      SubmitAttendanceDetails submitAttendanceDetails) {
    _attendanceListeners?.submitAttendanceDetails(submitAttendanceDetails);
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
  final String projectId;
  final List<String> attendeeId;
  final int offset;
  final int limit;
  final Function(dynamic individualSearchResponse) onLogLoaded;

  SearchAttendanceLog({
    required this.registerId,
    required this.tenantId,
    required this.entryTime,
    required this.exitTime,
    required this.currentDate,
    required this.projectId,
    required this.attendeeId,
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
  final String individualId;
  final String registrarId;
  final String status;
  final String tableId;
  final Function(String message) onMarked;

  SubmitAttendanceDetails({
    required this.individualId,
    required this.registrarId,
    required this.status,
    required this.tableId,
    required this.onMarked,
  });
}
