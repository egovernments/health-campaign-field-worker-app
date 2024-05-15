import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

abstract class ReferralReconListener {
  Future<List<ProjectFacilityModel>> fetchProjectFacilitiesForProjectId();

  Future<List<ServiceDefinitionModel>> fetchSelectedServiceDefinitions(
      String code);

  Future<List<ServiceDefinitionModel>> fetchAllServiceDefinitions();

  Future<ServiceModel?> fetchSavedChecklist(
      ServiceSearchModel reconServiceSearchModel);

  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation);

  // Saves the service request details.
  Future<bool> saveServiceRequestDetails(SaveServiceRequest saveServiceRequest);

  // Saves the referral details.
  Future<bool> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation);

  void callSyncMethod();
}

// Class to store the service request recorded data
class SaveServiceRequest {
  final ServiceModel serviceModel;
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
