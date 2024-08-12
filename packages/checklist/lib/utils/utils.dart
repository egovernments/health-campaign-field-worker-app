import 'package:digit_data_model/data_model.dart';
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
  String _roleCode = '';
  bool _isHealthFacilityWorker = false;
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
        required String appVersion, required String roleCode, required bool isHealthFacilityWorker, required Object roles}) {
    print("Printed ->>>>>>>>$roles");

    _projectId = projectId;
    _projectName=projectName;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _roles=roles;
    _isHealthFacilityWorker=isHealthFacilityWorker;
    _roleCode=roleCode;
  }

  get projectId => _projectId;
  get projectName => _projectName;
  get loggedInIndividualId => _loggedInIndividualId;
  get loggedInUserUuid => _loggedInUserUuid;
  get appVersion => _appVersion;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;
  get roles => _roles;
  get roleCode => roleCode;
  get isHealthFacilityWorker => _isHealthFacilityWorker;
  BoundaryModel? get boundary => _boundaryModel;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }
}
