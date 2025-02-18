import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart'; //used for mocking dependencies and repositories in bloc test
import 'package:survey_form/survey_form.dart';
import 'package:survey_form/utils/typedefs.dart';

import '../constants/test_constants.dart';

class MockServiceDataRepository extends Mock implements ServiceDataRepository {}

void main() {
  group('ServiceBloc', () {
    late ServiceBloc serviceBloc;
    final serviceDataRepository = MockServiceDataRepository();

    setUp(() {
      serviceBloc = ServiceBloc(
        const ServiceState.empty(),
        serviceDataRepository: serviceDataRepository,
      );
    });

    setUpAll(() {
      registerFallbackValue(ServiceModel(clientId: ''));
      registerFallbackValue(ServiceSearchModel(clientId: ''));
    });

    test('Initial state is correct', () {
      expect(serviceBloc.state, equals(const ServiceState.empty()));
    });

    // Test for the ServiceSearchEvent
    blocTest<ServiceBloc, ServiceState>(
      'emits ServiceSearchState when search event is added',
      build: () {
        when(() => serviceDataRepository.search(any()))
            .thenAnswer((_) async => [ServiceTestConstants.mockServiceModel]);
        return serviceBloc;
      },
      act: (bloc) => bloc.add(ServiceEvent.search(
        serviceSearchModel: ServiceTestConstants.mockServiceSearchModel,
      )),
      expect: () => [
        ServiceSearchState(
            serviceList: [ServiceTestConstants.mockServiceModel]),
      ],
      verify: (_) {
        // Verify that the search method was called
        verify(() => serviceDataRepository.search(any())).called(1);
      },
    );

    // Test for the ServiceCreateEvent
    blocTest<ServiceBloc, ServiceState>(
      'creates a ServiceModel when create event is added',
      build: () {
        when(() => serviceDataRepository.create(any()))
            .thenAnswer((_) async => ServiceTestConstants.mockServiceModel);
        return serviceBloc;
      },
      act: (bloc) => bloc.add(ServiceEvent.create(
        serviceModel: ServiceTestConstants.mockServiceModel,
      )),
      expect: () => [],
      verify: (_) {
        // Verify that the create method was called
        verify(() => serviceDataRepository.create(any())).called(1);
      },
    );

    // Test for the ServiceResetEvent
    blocTest<ServiceBloc, ServiceState>(
      'emits a ServiceSearchState when reset event is added',
      build: () => ServiceBloc(
          ServiceState.serviceSearch(
              serviceList: [ServiceTestConstants.mockServiceModel]),
          serviceDataRepository: serviceDataRepository),
      act: (bloc) => bloc.add(ServiceEvent.resetSelected(
        serviceList: [ServiceTestConstants.mockServiceModel],
      )),
      expect: () => [
        ServiceState.serviceSearch(
            serviceList: [ServiceTestConstants.mockServiceModel])
      ],
    );

    //Test for the ServiceSelect Event
    blocTest<ServiceBloc, ServiceState>(
        'emits updated state with selectedService when ServiceSelectionEvent is added',
        build: () => ServiceBloc(
            ServiceState.serviceSearch(
                serviceList: [ServiceTestConstants.mockServiceModel]),
            serviceDataRepository: serviceDataRepository),
        act: (bloc) {
          bloc.add(ServiceSelectionEvent(
              service: ServiceTestConstants.mockServiceModel));
        },
        expect: () => [
              ServiceState.serviceSearch(
                  serviceList: [ServiceTestConstants.mockServiceModel],
                  selectedService: ServiceTestConstants.mockServiceModel)
            ]);
  });
}
