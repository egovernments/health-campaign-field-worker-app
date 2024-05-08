import 'package:attendance_management/attendance_management.dart';

// Abstract class defining the listener to interact with the data through any other application
abstract class AttendanceListeners {
// Method to get attendance registers
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters(
      {required int offset, required int limit});

  Future<List<AttendanceRegisterModel>> loadMoreAttendanceRegisters(
      {required int limit, required int offSet});

  // Method to search attendance log
  Future<List<AttendanceLogModel>> searchAttendanceLog({
    required final String registerId,
    required final String tenantId,
    required final int entryTime,
    required final int exitTime,
    required final int currentDate,
  });

  // Method to submit attendance details
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  );

  // Method to call synchronization method
  void callSyncMethod();
}

// Singleton class for managing attendance operations
class AttendanceSingleton {
  static final AttendanceSingleton _singleton = AttendanceSingleton._internal();

  factory AttendanceSingleton() {
    return _singleton;
  }

  AttendanceSingleton._internal();

  AttendanceListeners? _attendanceListeners;
  String _projectId = '';
  String _userId = '';
  String _appVersion = '';
  String _tenantId = '';

  // Method to set attendance listeners and other information
  void setAttendanceListeners(
      {required AttendanceListeners attendanceListeners,
      required String projectId,
      required String userId,
      required String appVersion,
      required String tenantId
      }) {
    _attendanceListeners = attendanceListeners;
    _projectId = projectId;
    _userId = userId;
    _appVersion = appVersion;
    _tenantId = tenantId;
  }

  get projectId => _projectId;
  get userId => _userId;
  get appVersion => _appVersion;
  get tenantId => _tenantId;

  // Method to get attendance registers
  Future<List<AttendanceRegisterModel>?> getAttendanceRegisters(
      {required int limit, required int offset}) async {
    return await _attendanceListeners?.getAttendanceRegisters(
        offset: offset, limit: limit);
  }

  // Method to load more attendance registers
  Future<List<AttendanceRegisterModel>?> loadMoreAttendanceRegisters(
      {required int limit, required int offSet}) async {
    return await _attendanceListeners?.loadMoreAttendanceRegisters(
        limit: limit, offSet: offSet);
  }

  // Method to search attendance log
  Future<List<AttendanceLogModel>> searchAttendanceLog(
      {required final String registerId,
      required final String tenantId,
      required final int entryTime,
      required final int exitTime,
      required final int currentDate}) async {
    return await _attendanceListeners!.searchAttendanceLog(
        registerId: registerId,
        tenantId: tenantId,
        entryTime: entryTime,
        exitTime: exitTime,
        currentDate: currentDate);
  }

  // Method to submit attendance details
  Future<void> submitAttendanceDetails(
      SubmitAttendanceDetails attendanceLogs) async {
    return Future(
        () => _attendanceListeners?.submitAttendanceDetails(attendanceLogs));
  }

  void callSync() {
    _attendanceListeners?.callSyncMethod();
  }
}

class SubmitAttendanceDetails {
  final List<AttendanceLogModel> attendanceLogs;
  final List<AttendeeModel> attendeeList;
  final Function(bool message) onMarked;
  final bool? createOplog;
  final bool? isSingleSession;

  SubmitAttendanceDetails({
    required this.attendanceLogs,
    required this.attendeeList,
    required this.onMarked,
    this.createOplog = false,
    this.isSingleSession = false,
  });
}
