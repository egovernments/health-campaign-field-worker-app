import 'package:digit_data_model/utils/utils.dart';

// Singleton class for managing attendance operations
class ChecklistSingleton {
  static final ChecklistSingleton _singleton = ChecklistSingleton._internal();

  factory ChecklistSingleton() {
    return _singleton;
  }

  ChecklistSingleton._internal();

  String _projectId = '';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  Object _roles=[];
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  // Method to set attendance listeners and other information
  void setInitialData(
      {required String projectId,
        required String loggedInIndividualId,
        required String loggedInUserUuid,
        required String appVersion, required Object roles}) {
    print("Printed ->>>>>>>>$roles");

    _projectId = projectId;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _roles=roles;
  }

  get projectId => _projectId;
  get loggedInIndividualId => _loggedInIndividualId;
  get loggedInUserUuid => _loggedInUserUuid;
  get appVersion => _appVersion;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;
  get roles => _roles;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }
}
