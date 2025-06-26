import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';

/// Singleton class for managing attendance operations
class AttendanceSingleton {
  static final AttendanceSingleton _singleton = AttendanceSingleton._internal();

  factory AttendanceSingleton() {
    return _singleton;
  }

  AttendanceSingleton._internal();

  ProjectModel? _project;
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration.offlineFirst;

  // --- Getters ---
  ProjectModel? get project => _project;
  String get loggedInIndividualId => _loggedInIndividualId;
  String get loggedInUserUuid => _loggedInUserUuid;
  String get appVersion => _appVersion;
  String get tenantId => _tenantId;
  BoundaryModel? get boundary => _boundaryModel;
  PersistenceConfiguration get persistenceConfiguration => _persistenceConfiguration;

  // --- Setters ---
  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

  void setInitialData({
    required ProjectModel project,
    required String loggedInIndividualId,
    required String loggedInUserUuid,
    required String appVersion,
    required List<DropdownItem> manualAttendanceReasons, // ✅ Correct type
  }) {
    _project = project;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _manualAttendanceReasons = manualAttendanceReasons;
  }

  // --- Manual Attendance Reasons handling ---
  List<DropdownItem> _manualAttendanceReasons = [];

  List<DropdownItem> get manualAttendanceReasons => _manualAttendanceReasons;

  void setManualAttendanceReasons(List<DropdownItem> reasons) {
    _manualAttendanceReasons = reasons;
  }
}
