// Importing necessary packages and files for testing.
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes for the data repositories.
class MockFacilityDataRepository extends Mock
    implements FacilityDataRepository {}

class MockProjectFacilityDataRepository extends Mock
    implements ProjectFacilityDataRepository {}

// Fake classes for the search models.
class FakeProjectFacilitySearchModel extends Fake
    implements ProjectFacilitySearchModel {}

class FakeFacilitySearchModel extends Fake implements FacilitySearchModel {}

void main() {
  // Registering fallback values for the search models.
  setUpAll(() {
    registerFallbackValue(FakeProjectFacilitySearchModel());
    registerFallbackValue(FakeFacilitySearchModel());
  });

  late MockFacilityDataRepository mockFacilityDataRepository;
  late MockProjectFacilityDataRepository mockProjectFacilityDataRepository;
  late FacilityBloc facilityBloc;

  // Initializing mock objects before each test.
  setUp(() {
    mockFacilityDataRepository = MockFacilityDataRepository();
    mockProjectFacilityDataRepository = MockProjectFacilityDataRepository();
    facilityBloc = FacilityBloc(
      facilityDataRepository: mockFacilityDataRepository,
      projectFacilityDataRepository: mockProjectFacilityDataRepository,
    );
  });

  group('FacilityBloc', () {
    // Testing the initial state.
    test('initial state is FacilityEmptyState', () {
      expect(facilityBloc.state, equals(const FacilityEmptyState()));
    });

    // Mock data for testing.
    const testProjectId = 'test_project_id';
    const testFacilityId = '1';
    final testFacilities = [
      FacilityModel(
          id: 'Delivery Team',
          additionalFields: FacilityAdditionalFields(
              version: 1,
              fields: [const AdditionalField('type', 'DeliveryTeam')])),
    ];
    final testProjectFacilities = [
      ProjectFacilityModel(
          projectId: 'test_project_id', facilityId: '1', id: '2'),
    ];

    // Test case for successfully loading facilities.
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityFetchedState] when FacilityLoadForProjectEvent is added',
      build: () {
        when(() => mockProjectFacilityDataRepository.search(any()))
            .thenAnswer((_) async => testProjectFacilities);
        when(() => mockFacilityDataRepository.search(any()))
            .thenAnswer((_) async => testFacilities);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: testProjectId, loadAllProjects: false)),
      expect: () => [
        const FacilityLoadingState(),
        FacilityFetchedState(facilities: testFacilities, allFacilities: [
          FacilityModel(
              id: 'Delivery Team',
              additionalFields: FacilityAdditionalFields(
                  version: 1,
                  fields: [const AdditionalField('type', 'DeliveryTeam')])),
        ]),
      ],
      verify: (_) {
        verify(() => mockProjectFacilityDataRepository.search(any())).called(1);
        verify(() => mockFacilityDataRepository.search(any())).called(1);
      },
    );

    // Test case for empty facilities result.
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityFetchedState] when FacilityLoadForProjectEvent is added',
      build: () {
        when(() => mockProjectFacilityDataRepository.search(any()))
            .thenAnswer((invocation) async {
          final searchModel =
              invocation.positionalArguments[0] as ProjectFacilitySearchModel;
          if (searchModel.projectId != null &&
              searchModel.projectId!.contains(testProjectId)) {
            when(() => mockFacilityDataRepository.search(any()))
                .thenAnswer((invocation) async {
              final searchModel =
                  invocation.positionalArguments[0] as FacilitySearchModel;
              if (searchModel.id != null &&
                  searchModel.id!.contains(testFacilityId)) {
                return testFacilities;
              } else {
                return [];
              }
            });
            return testProjectFacilities;
          } else {
            return [];
          }
        });
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: '23e32', loadAllProjects: false)),
      expect: () => [const FacilityLoadingState(), const FacilityEmptyState()],
      verify: (_) {
        verify(() => mockProjectFacilityDataRepository.search(any())).called(1);
      },
    );

    // Test case for loading all projects.
    blocTest<FacilityBloc, FacilityState>(
      'emits [FacilityLoadingState, FacilityFetchedState] when FacilityLoadForProjectEvent with loadAllProjects is added',
      build: () {
        when(() => mockProjectFacilityDataRepository.search(any()))
            .thenAnswer((_) async => testProjectFacilities);
        when(() => mockFacilityDataRepository.search(any()))
            .thenAnswer((_) async => testFacilities);
        return facilityBloc;
      },
      act: (bloc) => bloc.add(const FacilityEvent.loadForProjectId(
          projectId: testProjectId, loadAllProjects: true)),
      expect: () => [
        const FacilityLoadingState(),
        FacilityFetchedState(facilities: testFacilities, allFacilities: [
          FacilityModel(
            id: 'Delivery Team',
            additionalFields: FacilityAdditionalFields(
                version: 1,
                fields: [const AdditionalField('type', 'DeliveryTeam')]),
          ),
          ...testFacilities,
        ]),
      ],
      verify: (_) {
        verify(() => mockProjectFacilityDataRepository.search(any())).called(1);
        verify(() => mockFacilityDataRepository.search(any())).called(2);
      },
    );
  });
}
