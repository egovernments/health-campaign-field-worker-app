import 'package:digit_data_model/utils/utils.dart';
import 'package:drift/drift.dart';

import '../blocs/attendance_listeners.dart';

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

  void callSync() {
    _attendanceListeners?.callSyncMethod();
  }
}
