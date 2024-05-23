// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/referral_recon_service.dart';
import 'package:referral_reconciliation/utils/typedefs.dart';
import 'package:referral_reconciliation/utils/utils.dart';

import '../constants/test_constants.dart';

// Mock class for ReferralReconSingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {}

class MockServiceDataRepository extends Mock implements ServiceDataRepository {}

// Fake classes for the search models.
class FakeServiceSearchModel extends Fake implements ServiceSearchModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeServiceSearchModel());
  });
  group('ReferralReconServiceBloc', () {
    // Declare variables for MockInventorySingleton and FacilityBloc
    late MockReferralReconSingleton mockReferralReconSingleton;
    late ReferralReconServiceBloc serviceBloc;
    late MockServiceDataRepository mockServiceDataRepository;
    late String mockProjectId;
    late ServiceSearchModel mockServiceSearchModel;
    late ServiceModel mockServiceModel;

    setUp(() {
      // Initialize MockReferralReconSingleton and ReferralReconServiceBloc before each test
      mockReferralReconSingleton = MockReferralReconSingleton();
      mockServiceDataRepository = MockServiceDataRepository();
      serviceBloc = ReferralReconServiceBloc(
        const ReferralReconServiceState.empty(),
        serviceDataRepository: mockServiceDataRepository,
      );
      mockServiceSearchModel =
          ReferralReconTestConstants().reconServiceSearchModel;
      mockServiceModel = ReferralReconTestConstants().reconServiceModel;
      // Initialize mockProjectId
      mockProjectId = ReferralReconTestConstants().projectId;
    });

    // Test for when getSavedChecklist returns null
    blocTest<ReferralReconServiceBloc, ReferralReconServiceState>(
      // Description of the test
      'emits [ReferralReconServiceSearchState] when getSavedChecklist returns null',
      build: () {
        // Mock the method getSavedChecklist to return null
        when(() => mockServiceDataRepository.search(any()))
            .thenAnswer((_) async => []);
        return serviceBloc;
      },
      act: (bloc) => bloc.add(ReferralReconServiceEvent.search(
          serviceSearchModel: mockServiceSearchModel)),
      expect: () => <ReferralReconServiceState>[
        // Expected states after the action
        const ReferralReconServiceSearchState(serviceList: []),
      ],
    );
    // Test for when getSavedChecklist returns a non-null list of service Requests

    blocTest<ReferralReconServiceBloc, ReferralReconServiceState>(
      // Description of the test
      'emits [ReferralReconServiceSearchState] when getSavedChecklist returns non-null List',
      build: () {
        // Mock the method getSavedChecklist to return a single List
        when(() => mockServiceDataRepository.search(any())).thenAnswer(
            (_) async => [ReferralReconTestConstants().reconServiceModel]);
        return serviceBloc;
      },
      act: (bloc) => bloc.add(ReferralReconServiceEvent.search(
          serviceSearchModel: mockServiceSearchModel)),
      expect: () => <ReferralReconServiceState>[
        // Expected states after the action
        ReferralReconServiceSearchState(
          serviceList: [
            ReferralReconTestConstants().reconServiceModel,
          ],
        ),
      ],
    );
  });
}
