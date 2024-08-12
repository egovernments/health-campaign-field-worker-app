import 'package:digit_data_model/models/entities/boundary.dart';
import 'package:digit_data_model/utils/utils.dart';

// Singleton class for managing attendance operations
class ChecklistSingleton {
  static final ChecklistSingleton _singleton = ChecklistSingleton._internal();

  factory ChecklistSingleton() {
    return _singleton;
  }

  ChecklistSingleton._internal();

  String _projectId = '';
  String _projectName='';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  Object _roles=[];
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }
  // Method to set attendance listeners and other information
  void setInitialData(
      {required String projectId,
        required String projectName,
        required String loggedInIndividualId,
        required String loggedInUserUuid,
        required String appVersion, required Object roles}) {
    print("Printed ->>>>>>>>$roles");

    _projectId = projectId;
    _projectName=projectName;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _roles=roles;
  }

  get projectId => _projectId;
  get projectName => _projectName;
  get loggedInIndividualId => _loggedInIndividualId;
  get loggedInUserUuid => _loggedInUserUuid;
  get appVersion => _appVersion;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;
  get roles => _roles;
  BoundaryModel? get boundary => _boundaryModel;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }
}
