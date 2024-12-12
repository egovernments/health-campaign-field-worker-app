// Importing necessary packages and modules
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:survey_form/survey_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:referral_reconciliation/blocs/referral_recon_service_definition.dart';
import 'package:referral_reconciliation/utils/typedefs.dart';
import 'package:referral_reconciliation/utils/utils.dart';

import '../constants/test_constants.dart';

// Mock class for ReferralReconSingleton
class MockReferralReconSingleton extends Mock
    implements ReferralReconSingleton {}

class MockServiceDataRepository extends Mock
    implements ServiceDefinitionDataRepository {}

// Fake classes for the search models.
class FakeServiceDefinitionSearchModel extends Fake
    implements ServiceDefinitionSearchModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeServiceDefinitionSearchModel());
  });
  group('ReferralReconServiceBloc', () {
    late ReferralReconServiceDefinitionBloc serviceBloc;
    late MockServiceDataRepository serviceDefinitionDataRepository;

    setUp(() {
      serviceDefinitionDataRepository = MockServiceDataRepository();
      serviceBloc = ReferralReconServiceDefinitionBloc(
        const ReferralReconServiceDefinitionState.empty(),
        serviceDefinitionDataRepository: serviceDefinitionDataRepository,
      );
    });

    // Test for when getServiceDefinitionsList returns null
    blocTest<ReferralReconServiceDefinitionBloc,
        ReferralReconServiceDefinitionState>(
      // Description of the test
      'emits [ReferralReconServiceDefinitionState] when getServiceDefinitionsList returns null',
      build: () {
        // Mock the method getServiceDefinitionsList to return empty
        when(() => serviceDefinitionDataRepository.search(any()))
            .thenAnswer((_) async => []);
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
        when(() => serviceDefinitionDataRepository.search(any())).thenAnswer(
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
        // Mock the method getServiceDefinitions to return a saved survey_form
        when(() => serviceDefinitionDataRepository.search(any())).thenAnswer(
          (_) async => [
            ServiceDefinitionModel(
              code: ReferralReconTestConstants().serviceDefinitionCode,
            ),
          ],
        );
        return serviceBloc;
      },
      act: (bloc) {
        bloc.add(const ReferralReconServiceDefinitionFetchEvent());
        bloc.add(ReferralReconServiceDefinitionSelectionEvent(
          serviceDefinitionCode:
              ReferralReconTestConstants().serviceDefinitionCode,
        ));
      },
      expect: () => <ReferralReconServiceDefinitionState>[
        // Expected states after the action
        ReferralReconServiceDefinitionServiceFetchedState(
          serviceDefinitionList: [
            ReferralReconTestConstants().referralReconServiceDefinitionModel,
          ],
          selectedServiceDefinition: null,
        ),
        ReferralReconServiceDefinitionServiceFetchedState(
          serviceDefinitionList: [
            ReferralReconTestConstants().referralReconServiceDefinitionModel,
          ],
          selectedServiceDefinition:
              ReferralReconTestConstants().referralReconServiceDefinitionModel,
        ),
      ],
      verify: (_) {
        verify(() => serviceDefinitionDataRepository.search(any())).called(1);
      },
    );
  });
}
