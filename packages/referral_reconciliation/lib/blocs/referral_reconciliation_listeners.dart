import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart';

import '../models/entities/referral_project_facility.dart';

abstract class ReferralReconListener {
  Future<List<ReferralProjectFacilityModel>>
      fetchProjectFacilitiesForProjectId();

  Future<List<ReferralReconServiceDefinitionModel>> fetchServiceDefinitions(
      String code);

  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation);

  // Saves the service request details.
  Future<void> saveServiceRequestDetails(SaveServiceRequest saveServiceRequest);

  // Saves the referral details.
  Future<void> saveReferralReconDetails(
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
    required List<String> referralReasons,
  }) {
    _referralReconListener = referralReconListener;
    _projectId = projectId;
    _userName = userName;
    _boundaryName = boundaryName;
    _appVersion = appVersion;
    _tenantId = tenantId;
    _genderOptions = genderOptions;
    _validIndividualAgeForCampaign = validIndividualAgeForCampaign;
    _referralReasons = referralReasons;
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
    return await _referralReconListener?.fetchServiceDefinitions(code);
  }

  // Saves the stock details.
  Future<void> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    return Future(
      () =>
          _referralReconListener?.saveServiceRequestDetails(saveServiceRequest),
    );
  }

  // Saves the stock details.
  Future<void> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    return Future(
      () => _referralReconListener
          ?.saveReferralReconDetails(saveReferralReconciliation),
    );
  }

  void callSync() {
    _referralReconListener?.callSyncMethod();
  }
}

class SaveServiceRequest {
  final ReferralReconServiceModel serviceModel;
  final Map<String, Object> additionalData;
  final Function(bool isServiceRequestSaved) isServiceRequestSaved;

  SaveServiceRequest(
      {required this.serviceModel,
      required this.additionalData,
      required this.isServiceRequestSaved});
}

class ReferralReconciliation {
  final HFReferralModel hfReferralModel;
  final Map<String, Object> additionalData;

  ReferralReconciliation({
    required this.hfReferralModel,
    required this.additionalData,
  });
}

class SearchReferralReconciliationClass {
  final String? tag;
  final String? name;

  SearchReferralReconciliationClass({
    this.tag,
    this.name,
  });
}

class ValidIndividualAgeForCampaign {
  final int validMinAge;
  final int validMaxAge;

  ValidIndividualAgeForCampaign({
    required this.validMinAge,
    required this.validMaxAge,
  });
}
