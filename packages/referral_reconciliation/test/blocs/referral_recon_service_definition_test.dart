// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/referral_recon_service_definition.dart';
import 'package:referral_reconciliation/blocs/referral_reconciliation_listeners.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart';

import '../constants/test_constants.dart';

// Mock class for ReferralReconSingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {}

void main() {
  group('ReferralReconServiceBloc', () {
    // Declare variables for MockInventorySingleton and FacilityBloc
    late MockReferralReconSingleton mockReferralReconSingleton;
    late ReferralReconServiceDefinitionBloc serviceBloc;

    setUp(() {
      // Initialize MockReferralReconSingleton and ReferralReconServiceBloc before each test
      mockReferralReconSingleton = MockReferralReconSingleton();
      serviceBloc = ReferralReconServiceDefinitionBloc(
        const ReferralReconServiceDefinitionState.empty(),
        referralReconSingleton: mockReferralReconSingleton,
      );
    });

    // Test for when getServiceDefinitionsList returns null
    blocTest<ReferralReconServiceDefinitionBloc,
        ReferralReconServiceDefinitionState>(
      // Description of the test
      'emits [ReferralReconServiceDefinitionState] when getServiceDefinitionsList returns null',
      build: () {
        // Mock the method getServiceDefinitionsList to return null
        when(() => mockReferralReconSingleton.getServiceDefinitionsList())
            .thenAnswer((_) async => null);
        return serviceBloc;
      },
      act: (bloc) => bloc.add(const ReferralReconServiceDefinitionFetchEvent()),
      expect: () => <ReferralReconServiceDefinitionState>[
        // Expected states after the action -Expects an empty list
        const ReferralReconServiceDefinitionServiceFetchedState(
          serviceDefinitionList: [],
          selectedServiceDefinition: null,
        ),
      ],
    );
    // Test for when getServiceDefinitionsList returns a non-null list of service Requests

    blocTest<ReferralReconServiceDefinitionBloc,
        ReferralReconServiceDefinitionState>(
      // Description of the test
      'emits [ReferralReconServiceDefinitionServiceFetchedState] when getServiceDefinitionsList returns non-null List',
      build: () {
        // Mock the method getServiceDefinitionsList to return a single List
        when(() => mockReferralReconSingleton.getServiceDefinitionsList())
            .thenAnswer(
          (_) async => [
            ReferralReconTestConstants().referralReconServiceDefinitionModel,
          ],
        );
        return serviceBloc;
      },
      act: (bloc) => bloc.add(const ReferralReconServiceDefinitionFetchEvent()),
      expect: () => <ReferralReconServiceDefinitionState>[
        // Expected states after the action
        ReferralReconServiceDefinitionServiceFetchedState(
          serviceDefinitionList: [
            ReferralReconTestConstants().referralReconServiceDefinitionModel,
          ],
        ),
      ],
    );

    blocTest<ReferralReconServiceDefinitionBloc,
        ReferralReconServiceDefinitionState>(
      // Description of the test
      'emits [ReferralReconServiceDefinitionServiceFetchedState] when getServiceDefinitionsList returns non-null List',
      build: () {
        // Mock the method getServiceDefinitions to return a saved checklist
        when(() => mockReferralReconSingleton.getServiceDefinitions('123'))
            .thenAnswer(
          (_) async => [
            ReferralReconServiceDefinitionModel(
              code: ReferralReconTestConstants().serviceDefinitionCode,
            ),
          ],
        );
        return serviceBloc;
      },
      act: (bloc) => bloc.add(ReferralReconServiceDefinitionSelectionEvent(
        serviceDefinitionCode:
            ReferralReconTestConstants().serviceDefinitionCode,
      )),
      expect: () => <ReferralReconServiceDefinitionState>[
        // Expected states after the action
        ReferralReconServiceDefinitionServiceFetchedState(
          serviceDefinitionList: [
            ReferralReconTestConstants().referralReconServiceDefinitionModel,
          ],
          selectedServiceDefinition:
              ReferralReconTestConstants().referralReconServiceDefinitionModel,
        ),
      ],
    );
  });
}
