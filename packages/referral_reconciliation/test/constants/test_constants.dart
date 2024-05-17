import 'package:digit_data_model/data_model.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';

class ReferralReconTestConstants {
  final String projectId = 'mock-e29cc774';
  final List<ProjectFacilityModel> expectedProjectFacilities = [
    ProjectFacilityModel(
        id: 'PJ_1', facilityId: 'PJ_1', projectId: 'mock-e29cc774')
  ];
  final String projectFacilityId = 'projectFacility1';
  final HFReferralModel hfReferralModel = HFReferralModel(
      id: 'referral1',
      clientReferenceId: 'abc123',
      projectFacilityId: 'projectFacility1');
  Map<String, Object> additionalDataForReferralRecord = {
    'dateOfEvaluation': DateTime(2024, 1, 1).millisecondsSinceEpoch.toString()
  };
  final DateTime dateOfReferralRecord = DateTime(2024, 1, 1);
  final String healthFacilityCoordinator = 'Mock Coordinator';
  final String serviceDefinitionCode = '123';
  final String serviceClientId = '123';
  final ServiceDefinitionModel referralReconServiceDefinitionModel =
      ServiceDefinitionModel(code: '123');
  final ServiceSearchModel reconServiceSearchModel =
      ServiceSearchModel(clientId: '123');
  final ServiceModel reconServiceModel = ServiceModel(clientId: '123');
}
