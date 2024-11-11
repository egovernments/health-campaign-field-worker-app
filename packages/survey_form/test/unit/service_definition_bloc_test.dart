import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart'; //used for mocking dependencies and repositories in bloc test
import 'package:survey_form/survey_form.dart';
import 'package:survey_form/utils/typedefs.dart';

import '../constants/test_constants.dart';

class MockServiceDefinitionDataRepository extends Mock implements ServiceDefinitionDataRepository {}

void main() {
  group('ServiceDefinitionBloc', () {
    late ServiceDefinitionBloc serviceDefinitionBloc;
    final serviceDefinitionDataRepository = MockServiceDefinitionDataRepository();

    setUp(() {
      serviceDefinitionBloc = ServiceDefinitionBloc(
          const ServiceDefinitionState.empty(),
          serviceDefinitionDataRepository: serviceDefinitionDataRepository
      );
    });

    setUpAll(() {
      registerFallbackValue(ServiceDefinitionModel(tenantId : ''));
      registerFallbackValue(ServiceDefinitionSearchModel(tenantId: ''));
    });

    test('Initial state is correct', () {
      expect(serviceDefinitionBloc.state, equals(const ServiceDefinitionState.empty()));
    });

    // Test for the ServiceDefinitionFetchEvent
    blocTest<ServiceDefinitionBloc, ServiceDefinitionState>(
      'emits ServiceDefinitionServiceFetchedState when ServiceDefinitionFetchEvent is added',
      build: () {
        // Mocking the search method to return a list of ServiceDefinitionModel
        when(() => serviceDefinitionDataRepository.search(any()))
            .thenAnswer((_) async => [ServiceTestConstants.mockServiceDefinitionModel]);

        return serviceDefinitionBloc;
      },
      act: (bloc) => bloc.add(const ServiceDefinitionEvent.fetch()),
      expect: () => [
        ServiceDefinitionState.serviceDefinitionFetch(
          serviceDefinitionList: [ServiceTestConstants.mockServiceDefinitionModel],
        ), // State should be the fetched service definitions
      ],
      verify: (_) {
        // Verify that the search method was called
        verify(() => serviceDefinitionDataRepository.search(any())).called(1);
      },
    );
  });
}
