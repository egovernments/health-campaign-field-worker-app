import 'package:digit_data_model/data_model.dart';

// Singleton class for managing survey_form operations
class SurveyFormSingleton {
  static final SurveyFormSingleton _singleton = SurveyFormSingleton._internal();

  factory SurveyFormSingleton() {
    return _singleton;
  }

  SurveyFormSingleton._internal();

  String _projectId = '';
  String _projectName = '';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  Object _roles = [];
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  // Method to set survey_form listeners and other information
  void setInitialData(
      {required String projectId,
      required String projectName,
      required String loggedInIndividualId,
      required String loggedInUserUuid,
      required String appVersion,
      required Object roles}) {
    _projectId = projectId;
    _projectName = projectName;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _roles = roles;
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

bool getSelectionType(AttributesModel model) {
  // Check if additionalFields is not null
  if (model.additionalFields != null) {
    // Loop through the fields to find the key 'selectionType'
    for (var field in model.additionalFields!.fields) {
      if (field.key == 'selectionType') {
        return field.value == 'multiple';
      }
    }
  }
  return false;
}


List<String> getOptionLabels(AttributesModel model) {
  if (model.additionalFields != null) {
    for (var field in model.additionalFields!.fields) {
      if (field.value is Map && field.value.containsKey('options')) {
        var options = field.value['options'] as List;
        return options.map((option) => option['label'].toString()).toList();
      }
    }
  }
  // Return default values if no options are found
  return ['CORE_COMMON_YES', 'CORE_COMMON_NO'];
}

