import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:registration_delivery/blocs/side_effects/side_effects.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';

import 'constants/test_constants.dart';

class MockSideEffectRepository extends Mock
    implements DataRepository<SideEffectModel, SideEffectSearchModel> {}

void main() {
  late SideEffectsBloc sideEffectsBloc;
  late MockSideEffectRepository mockRepository;

  setUp(() {
    mockRepository = MockSideEffectRepository();
    sideEffectsBloc = SideEffectsBloc(
      const SideEffectsState(),
      sideEffectRepository: mockRepository,
    );
  });

  tearDown(() {
    sideEffectsBloc.close();
  });

  setUpAll(() {
    registerFallbackValue(
        RegistrationDeliveryTestConstants.mockSideEffectModel);
    registerFallbackValue(
        RegistrationDeliveryTestConstants.mockUpdatedSideEffectModel);
    registerFallbackValue(SideEffectSearchModel(
      clientReferenceId: ['1891de8-02a2-4844-80ff-a080b7b40b70'],
    ));
  });

  group('SideEffectsBloc Tests', () {
    final mockSearchQuery = SideEffectSearchModel(
      clientReferenceId: ['1891de8-02a2-4844-80ff-a080b7b40b70'],
    );
    final mockSearchResult = [
      RegistrationDeliveryTestConstants.mockSideEffectModel
    ];

    test('Initial state is correct', () {
      expect(sideEffectsBloc.state, equals(const SideEffectsState()));
    });

    //Test case for _handleSubmit when isEditing is false
    blocTest<SideEffectsBloc, SideEffectsState>(
      'emits [loading, loaded] when submitting a new side effect',
      build: () {
        when(() => mockRepository.create(any())).thenAnswer(
            (_) async => RegistrationDeliveryTestConstants.mockSideEffectModel);
        return sideEffectsBloc;
      },
      act: (bloc) => bloc.add(SideEffectsEvent.handleSubmit(
          RegistrationDeliveryTestConstants.mockSideEffectModel, false)),
      expect: () => [
        const SideEffectsState(loading: true),
        const SideEffectsState(loading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.create(
            RegistrationDeliveryTestConstants.mockSideEffectModel)).called(1);
      },
    );

    //Test case for _handleSubmit when isEditing is true
    blocTest<SideEffectsBloc, SideEffectsState>(
      'emits [loading, loaded] when updating a side effect',
      build: () {
        when(() => mockRepository.update(any())).thenAnswer((_) async =>
            RegistrationDeliveryTestConstants.mockUpdatedSideEffectModel);
        return sideEffectsBloc;
      },
      act: (bloc) => bloc.add(SideEffectsEvent.handleSubmit(
          RegistrationDeliveryTestConstants.mockUpdatedSideEffectModel, true)),
      expect: () => [
        const SideEffectsState(loading: true),
        const SideEffectsState(loading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.update(
                RegistrationDeliveryTestConstants.mockUpdatedSideEffectModel))
            .called(1);
      },
    );

    blocTest<SideEffectsBloc, SideEffectsState>(
      'emits [loading, sideEffects] when search returns results',
      build: () {
        when(() => mockRepository.search(any()))
            .thenAnswer((_) async => mockSearchResult);
        return sideEffectsBloc;
      },
      act: (bloc) => bloc.add(SideEffectsEvent.handleSearch(mockSearchQuery)),
      expect: () => [
        const SideEffectsState(loading: true),
        SideEffectsState(loading: false, sideEffects: mockSearchResult),
      ],
      verify: (_) {
        verify(() => mockRepository.search(mockSearchQuery)).called(1);
      },
    );

    blocTest<SideEffectsBloc, SideEffectsState>(
      'emits [loading, empty list] when search returns no results',
      build: () {
        when(() => mockRepository.search(any())).thenAnswer((_) async => []);
        return sideEffectsBloc;
      },
      act: (bloc) => bloc.add(SideEffectsEvent.handleSearch(mockSearchQuery)),
      expect: () => [
        const SideEffectsState(loading: true),
        const SideEffectsState(loading: false, sideEffects: null),
      ],
      verify: (_) {
        verify(() => mockRepository.search(mockSearchQuery)).called(1);
      },
    );
  });
}
