import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/hf_referral.dart';
import 'package:survey_form/survey_form.dart';

class ReferralReconTestConstants {
  final String projectId = '11891de8-02a2-4844-80ff-a080b7b40b70';
  final List<ProjectFacilityModel> expectedProjectFacilities = [
    ProjectFacilityModel(
        id: 'PJ_1',
        facilityId: 'PJ_1',
        projectId: '11891de8-02a2-4844-80ff-a080b7b40b70')
  ];
  final String projectFacilityId = 'PJ_1';
  final HFReferralModel hfReferralModel = HFReferralModel(
    id: '11891de8-02a2-4844-80ff-a080b7b40b62',
    clientReferenceId: '11891de8-02a2-4844-80ff-a080b7b40b65',
    projectFacilityId: 'PJ_1',
    name: 'test-referral',
  );
  Map<String, Object> additionalDataForReferralRecord = {
    'dateOfEvaluation': DateTime(2024, 1, 1).millisecondsSinceEpoch.toString()
  };
  final DateTime dateOfReferralRecord = DateTime(2024, 1, 1);
  final String healthFacilityCoordinator = 'Mock Coordinator';
  final String serviceDefinitionCode = 'SMC.HF_RF_SICK.HEALTH_FACILITY_WORKER';
  final String serviceClientId = '11891de8-02a2-4844-80ff-a9080b7b40b56';
  final ServiceDefinitionModel referralReconServiceDefinitionModel =
      ServiceDefinitionModel(code: 'SMC.HF_RF_SICK.HEALTH_FACILITY_WORKER');
  final ServiceSearchModel reconServiceSearchModel =
      ServiceSearchModel(clientId: '11891de8-02a2-4844-80ff-a9080b7b40b56');
  final ServiceModel reconServiceModel =
      ServiceModel(clientId: '11891de8-02a2-4844-80ff-a9080b7b40b56');
}
