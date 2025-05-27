import 'package:bloc_test/bloc_test.dart';
import 'package:delivery/delivery.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/models/entities/project_beneficiary.dart';

import 'package:registration/utils/global_search_parameters.dart';
import 'package:registration/utils/typedefs.dart';

import 'constants/test_constants.dart';

class MockHouseholdDataRepository extends Mock
    implements HouseholdDataRepository {}

class MockIndividualDataRepository extends Mock
    implements IndividualDataRepository {}

class MockHouseholdMemberDataRepository extends Mock
    implements HouseholdMemberDataRepository {}

class MockProjectBeneficiaryDataRepository extends Mock
    implements ProjectBeneficiaryDataRepository {}

class MockIndividualGlobalSearchRepository extends Mock
    implements IndividualGlobalDeliverySearchRepository {}

class MockTaskDataRepository extends Mock
    implements DataRepository<TaskModel, TaskSearchModel> {}

class MockSideEffectDataRepository extends Mock
    implements DataRepository<SideEffectModel, SideEffectSearchModel> {}

class MockReferralDataRepository extends Mock
    implements DataRepository<ReferralModel, ReferralSearchModel> {}

void main() {
  late MockHouseholdDataRepository mockHouseholdDataRepository;
  late MockIndividualDataRepository mockIndividualDataRepository;
  late MockHouseholdMemberDataRepository mockHouseholdMemberDataRepository;
  late MockProjectBeneficiaryDataRepository
      mockProjectBeneficiaryDataRepository;
  late MockSideEffectDataRepository mockSideEffectDataRepository;
  late MockReferralDataRepository mockReferralDataRepository;

  late HouseholdOverviewDeliveryBloc householdOverviewBloc;
  late MockIndividualGlobalSearchRepository
      mockIndividualGlobalSearchRepository;
  late MockTaskDataRepository mockTaskDataRepository;

  setUp(() {
    mockIndividualGlobalSearchRepository =
        MockIndividualGlobalSearchRepository();
    mockHouseholdDataRepository = MockHouseholdDataRepository();
    mockIndividualDataRepository = MockIndividualDataRepository();
    mockHouseholdMemberDataRepository = MockHouseholdMemberDataRepository();
    mockProjectBeneficiaryDataRepository =
        MockProjectBeneficiaryDataRepository();

    mockIndividualGlobalSearchRepository =
        MockIndividualGlobalSearchRepository();
    mockTaskDataRepository = MockTaskDataRepository();
    mockSideEffectDataRepository = MockSideEffectDataRepository();
    mockReferralDataRepository = MockReferralDataRepository();
    householdOverviewBloc = HouseholdOverviewDeliveryBloc(
      HouseholdOverviewDeliveryState(
          householdMemberDeliveryWrapper:
              DeliveryTestConstants.householdMemberWrapper),
      individualRepository: mockIndividualDataRepository,
      householdRepository: mockHouseholdDataRepository,
      householdMemberRepository: mockHouseholdMemberDataRepository,
      projectBeneficiaryRepository: mockProjectBeneficiaryDataRepository,
      beneficiaryType: BeneficiaryType.individual,
      individualGlobalSearchRepository: mockIndividualGlobalSearchRepository,
      taskDataRepository: mockTaskDataRepository,
      sideEffectDataRepository: mockSideEffectDataRepository,
      referralDataRepository: mockReferralDataRepository,
    );
  });

  setUpAll(() {
    registerFallbackValue(GlobalSearchParameters(
      householdType: HouseholdType.community,
      householdClientReferenceId: '1ce2-3f4g-5h6i-7j8k-9l0m',
      isProximityEnabled: false,
      latitude: null,
      longitude: null,
      maxRadius: null,
      nameSearch: 'test',
      offset: null,
      limit: null,
      filter: [],
    ));
    registerFallbackValue(HouseholdSearchModel());
    registerFallbackValue(HouseholdMemberSearchModel());
    registerFallbackValue(IndividualSearchModel());
    registerFallbackValue(ProjectBeneficiarySearchModel());
  });

  // Test case for _handleReloadMember event
  blocTest<HouseholdOverviewDeliveryBloc, HouseholdOverviewDeliveryState>(
    'emits [HouseholdOverviewState with loading true, HouseholdOverviewState with updated householdMemberDeliveryWrapper] when _handleReloadMember is called',
    build: () {
      when(() => mockHouseholdMemberDataRepository.search(any()))
          .thenAnswer((_) async => [DeliveryTestConstants.mockHouseholdMember]);
      when(() => mockHouseholdDataRepository.search(any()))
          .thenAnswer((_) async => [DeliveryTestConstants.mockHousehold]);
      when(() => mockIndividualDataRepository.search(any()))
          .thenAnswer((_) async => [DeliveryTestConstants.mockIndividual]);
      when(() => mockProjectBeneficiaryDataRepository.search(any())).thenAnswer(
          (_) async => [DeliveryTestConstants.mockProjectBeneficiary]);

      return householdOverviewBloc;
    },
    act: (bloc) => bloc.add(const HouseholdOverviewReloadEvent(
        projectId: DeliveryTestConstants.testProjectId,
        projectBeneficiaryType: BeneficiaryType.individual)),
    expect: () => [
      HouseholdOverviewDeliveryState(
          loading: true,
          householdMemberDeliveryWrapper:
              DeliveryTestConstants.householdMemberWrapper),
      HouseholdOverviewDeliveryState(
        loading: false,
        householdMemberDeliveryWrapper:
            DeliveryTestConstants.householdMemberWrapper,
      )
    ],
  );

  //Test case for when search is performed
  blocTest<HouseholdOverviewDeliveryBloc, HouseholdOverviewDeliveryState>(
    'emits [loading: true, search results] when search is performed',
    build: () {
      // Mock search behavior for individual and household members
      when(() =>
          mockIndividualGlobalSearchRepository
              .individualGlobalSearch(any())).thenAnswer((_) async => {
            'total_count': 0,
            'data': [DeliveryTestConstants.individualModel]
          });

      when(() => mockHouseholdMemberDataRepository.search(any()))
          .thenAnswer((_) async => [
                DeliveryTestConstants.mockHouseholdMember,
              ]);
      when(() => mockHouseholdDataRepository.search(any()))
          .thenAnswer((_) async => [
                DeliveryTestConstants.mockHousehold,
              ]);
      when(() => mockIndividualDataRepository.search(any()))
          .thenAnswer((_) async => [
                DeliveryTestConstants.mockIndividual,
              ]);
      when(() => mockProjectBeneficiaryDataRepository.search(any()))
          .thenAnswer((_) async => [
                DeliveryTestConstants.mockProjectBeneficiary,
              ]);

      return householdOverviewBloc;
    },
    act: (bloc) {
      // Perform a search query
      bloc.add(const HouseholdOverviewReloadEvent(
        projectId: DeliveryTestConstants.testProjectId,
        projectBeneficiaryType: BeneficiaryType.individual,
        searchByName: 'test',
        selectedFilter: [],
      ));
    },
    expect: () => [
      HouseholdOverviewDeliveryState(
        loading: true,
        householdMemberDeliveryWrapper:
            DeliveryTestConstants.householdMemberWrapper,
      ),
      HouseholdOverviewDeliveryState(
          loading: false,
          householdMemberDeliveryWrapper:
              DeliveryTestConstants.householdMemberWrapper,
          offset: 10),
    ],
  );
}
