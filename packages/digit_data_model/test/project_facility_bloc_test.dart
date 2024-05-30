import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/blocs/project_facility/project_facility.dart';
import 'package:digit_data_model/models/entities/project_facility.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectFacilityDataRepository extends Mock
    implements ProjectFacilityDataRepository {}

class FakeProjectFacilitySearchModel extends Fake
    implements ProjectFacilitySearchModel {}

void main() {
  // Registering fallback value for the search model.
  setUpAll(() {
    registerFallbackValue(FakeProjectFacilitySearchModel());
  });

  late MockProjectFacilityDataRepository mockProjectFacilityDataRepository;
  late ProjectFacilityBloc projectFacilityBloc;

  // Initializing mock objects before each test.
  setUp(() {
    mockProjectFacilityDataRepository = MockProjectFacilityDataRepository();
    projectFacilityBloc = ProjectFacilityBloc(
      const ProjectFacilityEmptyState(),
      projectFacilityDataRepository: mockProjectFacilityDataRepository,
    );
  });

  group('ProjectFacilityBloc', () {
    // Testing the initial state.
    test('initial state is ProjectFacilityEmptyState', () {
      expect(
          projectFacilityBloc.state, equals(const ProjectFacilityEmptyState()));
    });

    List<String> testProjectId = ['test_project_id'];

    // Mock data for testing.
    final testProjectFacilities = [
      ProjectFacilityModel(
          id: '1', projectId: testProjectId.first, facilityId: '2'),
    ];

    // Test case for successfully loading project facilities.
    blocTest<ProjectFacilityBloc, ProjectFacilityState>(
      'emits [ProjectFacilityLoadingState, ProjectFacilityFetchedState] when ProjectFacilityLoadEvent is added',
      build: () {
        when(() => mockProjectFacilityDataRepository.search(any()))
            .thenAnswer((invocation) async {
          final searchModel =
              invocation.positionalArguments[0] as ProjectFacilitySearchModel;
          if (searchModel.projectId!.contains(testProjectId.first)) {
            return testProjectFacilities;
          } else {
            return [];
          }
        });
        return projectFacilityBloc;
      },
      act: (bloc) => bloc.add(ProjectFacilityEvent.load(
          query: ProjectFacilitySearchModel(projectId: testProjectId))),
      expect: () => [
        const ProjectFacilityLoadingState(),
        ProjectFacilityFetchedState(projectFacilities: testProjectFacilities),
      ],
      verify: (_) {
        verify(() => mockProjectFacilityDataRepository.search(any())).called(1);
      },
    );

    // Test case for empty project facilities result.
    blocTest<ProjectFacilityBloc, ProjectFacilityState>(
      'emits [ProjectFacilityLoadingState, ProjectFacilityEmptyState] when ProjectFacilityLoadEvent results in empty project facilities',
      build: () {
        when(() => mockProjectFacilityDataRepository.search(any()))
            .thenAnswer((_) async => []);
        return projectFacilityBloc;
      },
      act: (bloc) => bloc.add(ProjectFacilityEvent.load(
          query: ProjectFacilitySearchModel(projectId: testProjectId))),
      expect: () => [
        const ProjectFacilityLoadingState(),
        const ProjectFacilityEmptyState(),
      ],
      verify: (_) {
        verify(() => mockProjectFacilityDataRepository.search(any())).called(1);
      },
    );
  });
}
