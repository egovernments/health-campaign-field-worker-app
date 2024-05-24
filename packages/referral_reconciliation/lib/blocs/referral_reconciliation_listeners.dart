import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';

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
