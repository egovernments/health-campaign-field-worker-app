// Returns value of the Additional Field Model, by passing the key and additional Fields list as <Map<String, dynamic>>
import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';

dynamic getValueByKey(List<Map<String, dynamic>> data, String key) {
  for (var map in data) {
    if (map["key"] == key) {
      return map["value"];
    }
  }

  return null; // Key not found
}

// Class to store the valid max and min age for a campaign
class ValidIndividualAgeForCampaign {
  final int validMinAge;
  final int validMaxAge;

  ValidIndividualAgeForCampaign({
    required this.validMinAge,
    required this.validMaxAge,
  });
}

class ReferralReconSingleton {
  static final ReferralReconSingleton _singleton =
      ReferralReconSingleton._internal();

  factory ReferralReconSingleton() {
    return _singleton;
  }

  ReferralReconSingleton._internal();

  String _projectId = '';
  String _projectName = '';
  String _userName = '';
  String _userUUid = '';
  String _roleCode = '';
  String _appVersion = '';
  BoundaryModel? _boundaryModel;
  String _tenantId = '';
  List<String> _genderOptions = [];
  List<String> _cycles = [];
  List<String> _checklistTypes = [];
  List<String> _referralReasons = [];
  PersistenceConfiguration _persistenceConfiguration =
      PersistenceConfiguration.offlineFirst;
  ValidIndividualAgeForCampaign _validIndividualAgeForCampaign =
      ValidIndividualAgeForCampaign(validMinAge: 0, validMaxAge: 0);

  // TODO:

  Map<String, TemplateConfig>? _templateConfigs;
  String? _referralConfig;

  void setInitialData({
    required String userName,
    required String userUUid,
    required String projectId,
    required String projectName,
    required String roleCode,
    required String appVersion,
    required String tenantId,
    required ValidIndividualAgeForCampaign validIndividualAgeForCampaign,
    required List<String> genderOptions,
    required List<String> cycles,
    required List<String> referralReasons,
    required List<String> checklistTypes,
  }) {
    _projectId = projectId;
    _projectName = projectName;
    _userName = userName;
    _userUUid = userUUid;
    _appVersion = appVersion;
    _tenantId = tenantId;
    _genderOptions = genderOptions;
    _cycles = cycles;
    _validIndividualAgeForCampaign = validIndividualAgeForCampaign;
    _referralReasons = referralReasons;
    _checklistTypes = checklistTypes;
    _roleCode = roleCode;
  }

  String get projectId => _projectId;
  String get projectName => _projectName;
  String get userName => _userName;
  String get userUUid => _userUUid;
  String get roleCode => _roleCode;
  String get appVersion => _appVersion;
  String get tenantId => _tenantId;
  BoundaryModel? get boundary => _boundaryModel;
  List<String> get genderOptions => _genderOptions;
  ValidIndividualAgeForCampaign get validIndividualAgeForCampaign =>
      _validIndividualAgeForCampaign;
  List<String> get referralReasons => _referralReasons;
  List<String> get cycles => _cycles;
  List<String> get checklistTypes => _checklistTypes;
  get persistenceConfiguration => _persistenceConfiguration;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

//TODO::
  void setTemplateConfigs(Map<String, TemplateConfig> templateConfigs) {
    _templateConfigs = templateConfigs;
  }

  void setHfReferralConfig(String registrationConfig) {
    _referralConfig = registrationConfig;
  }

  Map<String, TemplateConfig>? get templateConfigs => _templateConfigs;

  String? get referralConfig => _referralConfig;
}

final Map<String, PageRouteInfo> routerMap = {
  'referral-acknowledgement': ReferralReconAcknowledgementRoute(),

  // Add more routes here
};
