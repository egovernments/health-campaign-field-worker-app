import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart';

import '../models/entities/referral_project_facility.dart';

abstract class ReferralReconListener {
  Future<List<ReferralProjectFacilityModel>>
      fetchProjectFacilitiesForProjectId();

  Future<List<ReferralReconServiceDefinitionModel>>
      fetchSelectedServiceDefinitions(String code);

  Future<List<ReferralReconServiceDefinitionModel>>
      fetchAllServiceDefinitions();

  Future<ReferralReconServiceModel?> fetchSavedChecklist(
      ReferralReconServiceSearchModel reconServiceSearchModel);

  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation);

  // Saves the service request details.
  Future<bool> saveServiceRequestDetails(SaveServiceRequest saveServiceRequest);

  // Saves the referral details.
  Future<bool> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation);

  void callSyncMethod();
}

class ReferralReconSingleton {
  static final ReferralReconSingleton _singleton =
      ReferralReconSingleton._internal();

  factory ReferralReconSingleton() {
    return _singleton;
  }

  ReferralReconSingleton._internal();

  ReferralReconListener? _referralReconListener;
  String _projectId = '';
  String _userName = '';
  String _appVersion = '';
  String _boundaryName = '';
  String _tenantId = '';
  List<String> _genderOptions = [];
  List<String> _cycles = [];
  List<String> _checklistTypes = [];
  List<String> _referralReasons = [];
  ValidIndividualAgeForCampaign _validIndividualAgeForCampaign =
      ValidIndividualAgeForCampaign(validMinAge: 0, validMaxAge: 0);

  void setInitialData({
    required ReferralReconListener referralReconListener,
    required String userName,
    required String boundaryName,
    required String projectId,
    required String appVersion,
    required String tenantId,
    required ValidIndividualAgeForCampaign validIndividualAgeForCampaign,
    required List<String> genderOptions,
    required List<String> cycles,
    required List<String> referralReasons,
    required List<String> checklistTypes,
  }) {
    _referralReconListener = referralReconListener;
    _projectId = projectId;
    _userName = userName;
    _boundaryName = boundaryName;
    _appVersion = appVersion;
    _tenantId = tenantId;
    _genderOptions = genderOptions;
    _cycles = cycles;
    _validIndividualAgeForCampaign = validIndividualAgeForCampaign;
    _referralReasons = referralReasons;
    _checklistTypes = checklistTypes;
  }

  String get projectId => _projectId;
  String get userName => _userName;
  String get boundaryName => _boundaryName;
  String get appVersion => _appVersion;
  String get tenantId => _tenantId;
  List<String> get genderOptions => _genderOptions;
  ValidIndividualAgeForCampaign get validIndividualAgeForCampaign =>
      _validIndividualAgeForCampaign;
  List<String> get referralReasons => _referralReasons;
  List<String> get cycles => _cycles;
  List<String> get checklistTypes => _checklistTypes;

  Future<List<ReferralProjectFacilityModel>?>
      getProjectFacilitiesForProjectId() async {
    return await _referralReconListener?.fetchProjectFacilitiesForProjectId();
  }

  Future<List<ReferralReconciliation>?> getReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation) async {
    return await _referralReconListener
        ?.fetchReferralReconciliations(searchReferralReconciliation);
  }

  Future<List<ReferralReconServiceDefinitionModel>?> getServiceDefinitions(
      String code) async {
    return await _referralReconListener?.fetchSelectedServiceDefinitions(code);
  }

  Future<List<ReferralReconServiceDefinitionModel>?>
      getServiceDefinitionsList() async {
    return await _referralReconListener?.fetchAllServiceDefinitions();
  }

  // Saves the service request details.
  Future<bool?> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    return await _referralReconListener
        ?.saveServiceRequestDetails(saveServiceRequest);
  }

  //Searches for the recorded service requests for the given referral
  Future<ReferralReconServiceModel?> getSavedChecklist(
      ReferralReconServiceSearchModel reconServiceSearchModel) async {
    return await _referralReconListener
        ?.fetchSavedChecklist(reconServiceSearchModel);
  }

  // Saves the referral reconciliation details.
  Future<bool?> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    return await _referralReconListener
        ?.saveReferralReconDetails(saveReferralReconciliation);
  }

  // Calls the main sync method on Go to Home
  void callSync() {
    _referralReconListener?.callSyncMethod();
  }
}

// Class to store the service request recorded data
class SaveServiceRequest {
  final ReferralReconServiceModel serviceModel;
  final Map<String, Object>? additionalData;

  SaveServiceRequest({
    required this.serviceModel,
    required this.additionalData,
  });
}

//Class to store the referral details
class ReferralReconciliation {
  final HFReferralModel hfReferralModel;
  final Map<String, Object> additionalData;

  ReferralReconciliation({
    required this.hfReferralModel,
    required this.additionalData,
  });
}

// Class to store the search referral reconciliation parameters
class SearchReferralReconciliationClass {
  final String? tag;
  final String? name;

  SearchReferralReconciliationClass({
    this.tag,
    this.name,
  });
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
