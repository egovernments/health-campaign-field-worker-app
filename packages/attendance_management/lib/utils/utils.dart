import 'package:digit_data_model/utils/utils.dart';
import 'package:drift/drift.dart';

import '../blocs/attendance_listeners.dart';
import '../models/entities/attendance_log.dart';
import '../models/entities/attendance_register.dart';

// Singleton class for managing attendance operations
class AttendanceSingleton {
  static final AttendanceSingleton _singleton = AttendanceSingleton._internal();

  factory AttendanceSingleton() {
    return _singleton;
  }

  AttendanceSingleton._internal();

  AttendanceListeners? _attendanceListeners;
  String _projectId = '';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  // Method to set attendance listeners and other information
  void setAttendanceListeners(
      {required AttendanceListeners attendanceListeners,
      required String projectId,
      required String loggedInIndividualId,
      required String loggedInUserUuid,
      required String appVersion}) {
    _attendanceListeners = attendanceListeners;
    _projectId = projectId;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
  }

  get projectId => _projectId;
  get loggedInIndividualId => _loggedInIndividualId;
  get loggedInUserUuid => _loggedInUserUuid;
  get appVersion => _appVersion;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

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