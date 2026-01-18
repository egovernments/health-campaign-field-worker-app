// Returns value of the Additional Field Model, by passing the key and additional Fields list as <Map<String, dynamic>>
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';

import '../models/entities/referral_recon_enums.dart';

dynamic getValueByKey(List<Map<String, dynamic>> data, String key) {
  for (var map in data) {
    if (map["key"] == key) {
      return map["value"];
    }
  }

  return null; // Key not found
}

/// Extension on HFReferralModel to extract form data for auto-population
/// Similar to ReverseFormMapper pattern used in registration flow
extension HFReferralFormDataExtractor on HFReferralModel? {
  /// Extracts all data from HFReferralModel into a flat Map for form population
  /// Returns empty map if model is null
  Map<String, dynamic> toFormData() {
    if (this == null) return {};

    final model = this!;
    final formData = <String, dynamic>{};

    // Extract main model fields
    formData['name'] = model.name;
    formData['symptom'] = model.symptom;
    formData['beneficiaryId'] = model.beneficiaryId;
    formData['referralCode'] = model.referralCode;
    formData['projectFacilityId'] = model.projectFacilityId;
    formData['clientReferenceId'] = model.clientReferenceId;

    // Extract all additionalFields into flat map
    final additionalFields = model.additionalFields?.fields;
    if (additionalFields != null) {
      for (final field in additionalFields) {
        formData[field.key] = field.value;
      }
    }

    return formData;
  }

  /// Gets a specific additional field value by enum key
  /// Returns null if not found
  dynamic getAdditionalFieldValue(ReferralReconEnums key) {
    if (this == null) return null;
    return this!.additionalFields?.fields
        .where((e) => e.key == key.toValue())
        .firstOrNull
        ?.value;
  }

  /// Gets a specific additional field value by string key
  /// Returns null if not found
  dynamic getAdditionalFieldByKey(String key) {
    if (this == null) return null;
    return this!.additionalFields?.fields
        .where((e) => e.key == key)
        .firstOrNull
        ?.value;
  }
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
}
