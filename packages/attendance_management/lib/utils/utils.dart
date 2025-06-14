import 'package:digit_data_model/data_model.dart';

// Singleton class for managing attendance operations
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
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  // Method to set attendance listeners and other information
  void setInitialData({
    required ProjectModel project,
    required String loggedInIndividualId,
    required String loggedInUserUuid,
    required String appVersion,
  }) {
    _project = project;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
  }

  ProjectModel? get project => _project;

  get loggedInIndividualId => _loggedInIndividualId;

  get loggedInUserUuid => _loggedInUserUuid;

  get appVersion => _appVersion;

  get tenantId => _tenantId;

  get persistenceConfiguration => _persistenceConfiguration;

  BoundaryModel? get boundary => _boundaryModel;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }
}
