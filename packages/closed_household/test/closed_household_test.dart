import 'package:bloc_test/bloc_test.dart';
import 'package:closed_household/closed_household.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration_delivery/utils/typedefs.dart';

import 'constants/test_constants.dart';

class MockIndividualRepository extends Mock
    implements IndividualDataRepository {}

class MockHouseholdRepository extends Mock implements HouseholdDataRepository {}

class MockHouseholdMemberRepository extends Mock
    implements HouseholdMemberDataRepository {}

class MockProjectBeneficiaryRepository extends Mock
    implements ProjectBeneficiaryDataRepository {}

class MockTaskRepository extends Mock implements TaskDataRepository {}

void main() {
  late ClosedHouseholdBloc closedHouseholdBloc;
  late MockIndividualRepository mockIndividualRepository;
  late MockHouseholdRepository mockHouseholdRepository;
  late MockHouseholdMemberRepository mockHouseholdMemberRepository;
  late MockProjectBeneficiaryRepository mockProjectBeneficiaryRepository;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockIndividualRepository = MockIndividualRepository();
    mockHouseholdRepository = MockHouseholdRepository();
    mockHouseholdMemberRepository = MockHouseholdMemberRepository();
    mockProjectBeneficiaryRepository = MockProjectBeneficiaryRepository();
    mockTaskRepository = MockTaskRepository();

    closedHouseholdBloc = ClosedHouseholdBloc(
      const ClosedHouseholdState(),
      individualRepository: mockIndividualRepository,
      householdRepository: mockHouseholdRepository,
      householdMemberRepository: mockHouseholdMemberRepository,
      projectBeneficiaryRepository: mockProjectBeneficiaryRepository,
      taskRepository: mockTaskRepository,
    );

    ClosedHouseholdSingleton().setBoundary(
        boundary: BoundaryModel(
      code: "HIERARCHY_MO",
      name: "hierarchy",
    ));

    ClosedHouseholdSingleton().setInitialData(
      loggedInUserUuid: ClosedHouseholdConstants.loggedInUserUuid,
      projectId: ClosedHouseholdConstants.projectId,
      beneficiaryType: BeneficiaryType.household,
    );
  });

  tearDown(() {
    closedHouseholdBloc.close();
  });

  setUpAll(() {
    registerFallbackValue(ClosedHouseholdConstants.mockAddress);
    registerFallbackValue(ClosedHouseholdConstants.identifierModel);
    registerFallbackValue(ClosedHouseholdConstants.mockProjectBeneficiary);
    registerFallbackValue(ClosedHouseholdConstants.mockIndividual);
    registerFallbackValue(ClosedHouseholdConstants.mockHousehold);
    registerFallbackValue(ClosedHouseholdConstants.mockTaskModel);
    registerFallbackValue(ClosedHouseholdConstants.mockHouseholdMemberModel);
  });

  group('ClosedHouseholdBloc', () {
    blocTest<ClosedHouseholdBloc, ClosedHouseholdState>(
      'emits [loading: true, loading: false] when handleSubmit is successful',
      build: () {
        when(() => mockHouseholdRepository.create(any())).thenAnswer((_) async {
          ClosedHouseholdConstants.mockHousehold;
        });
        when(() => mockIndividualRepository.create(any()))
            .thenAnswer((_) async {
          ClosedHouseholdConstants.mockIndividual;
        });
        when(() => mockProjectBeneficiaryRepository.create(any()))
            .thenAnswer((_) async {
          ClosedHouseholdConstants.mockProjectBeneficiary;
        });
        when(() => mockHouseholdMemberRepository.create(any()))
            .thenAnswer((_) async {
          ClosedHouseholdConstants.mockHouseholdMemberModel;
        });
        when(() => mockTaskRepository.create(any())).thenAnswer((_) async {
          ClosedHouseholdConstants.mockTaskModel;
        });

        return closedHouseholdBloc;
      },
      act: (bloc) => bloc.add(const ClosedHouseholdSubmitEvent(
        latitude: ClosedHouseholdConstants.latitude,
        longitude: ClosedHouseholdConstants.longitude,
        locationAccuracy: ClosedHouseholdConstants.locationAccuracy,
        householdHeadName: ClosedHouseholdConstants.householdHeadName,
      )),
      expect: () => [
        const ClosedHouseholdState(loading: true),
        const ClosedHouseholdState(loading: false),
      ],
      verify: (_) {
        verify(() => mockHouseholdRepository.create(any())).called(1);
        verify(() => mockIndividualRepository.create(any())).called(1);
        verify(() => mockProjectBeneficiaryRepository.create(any())).called(1);
        verify(() => mockHouseholdMemberRepository.create(any())).called(1);
        verify(() => mockTaskRepository.create(any())).called(1);
      },
    );

    blocTest<ClosedHouseholdBloc, ClosedHouseholdState>(
      'updates state correctly when handleSummary is called',
      build: () => closedHouseholdBloc,
      act: (bloc) => bloc.add(const ClosedHouseholdSummaryEvent(
        latitude: 12.34,
        longitude: 56.78,
        locationAccuracy: 2.0,
        householdHeadName: 'John Doe',
      )),
      expect: () => [
        const ClosedHouseholdState(
          latitude: 12.34,
          longitude: 56.78,
          locationAccuracy: 2.0,
          householdHeadName: 'John Doe',
        ),
      ],
    );
  });
}
