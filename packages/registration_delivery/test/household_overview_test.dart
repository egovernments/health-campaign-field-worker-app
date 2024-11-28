import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/models/entities/referral.dart';
import 'package:registration_delivery/models/entities/side_effect.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:registration_delivery/utils/typedefs.dart';

import 'constants/test_constants.dart';

class MockHouseholdDataRepository extends Mock
    implements HouseholdDataRepository {}

class MockIndividualDataRepository extends Mock
    implements IndividualDataRepository {}

class MockHouseholdMemberDataRepository extends Mock
    implements HouseholdMemberDataRepository {}

class MockProjectBeneficiaryDataRepository extends Mock
    implements ProjectBeneficiaryDataRepository {}

class MockTaskDataRepository extends Mock implements TaskDataRepository {}

class MockSideEffectDataRepository extends Mock
    implements SideEffectDataRepository {}

class MockReferralDataRepository extends Mock
    implements ReferralDataRepository {}

class MockIndividualGlobalSearchRepository extends Mock
    implements IndividualGlobalSearchRepository {}

void main() {
  late MockHouseholdDataRepository mockHouseholdDataRepository;
  late MockIndividualDataRepository mockIndividualDataRepository;
  late MockHouseholdMemberDataRepository mockHouseholdMemberDataRepository;
  late MockProjectBeneficiaryDataRepository
      mockProjectBeneficiaryDataRepository;
  late MockTaskDataRepository mockTaskDataRepository;
  late MockSideEffectDataRepository mockSideEffectDataRepository;
  late MockReferralDataRepository mockReferralDataRepository;
  late HouseholdOverviewBloc householdOverviewBloc;
  late MockIndividualGlobalSearchRepository
      mockIndividualGlobalSearchRepository;

  setUp(() {
    mockHouseholdDataRepository = MockHouseholdDataRepository();
    mockIndividualDataRepository = MockIndividualDataRepository();
    mockHouseholdMemberDataRepository = MockHouseholdMemberDataRepository();
    mockProjectBeneficiaryDataRepository =
        MockProjectBeneficiaryDataRepository();
    mockTaskDataRepository = MockTaskDataRepository();
    mockSideEffectDataRepository = MockSideEffectDataRepository();
    mockReferralDataRepository = MockReferralDataRepository();
    mockIndividualGlobalSearchRepository =
        MockIndividualGlobalSearchRepository();
    householdOverviewBloc = HouseholdOverviewBloc(
      HouseholdOverviewState(
          householdMemberWrapper:
              RegistrationDeliveryTestConstants.householdMemberWrapper),
      individualRepository: mockIndividualDataRepository,
      householdRepository: mockHouseholdDataRepository,
      householdMemberRepository: mockHouseholdMemberDataRepository,
      projectBeneficiaryRepository: mockProjectBeneficiaryDataRepository,
      taskDataRepository: mockTaskDataRepository,
      sideEffectDataRepository: mockSideEffectDataRepository,
      referralDataRepository: mockReferralDataRepository,
      beneficiaryType: BeneficiaryType.individual,
      individualGlobalSearchRepository: mockIndividualGlobalSearchRepository,
    );
  });

  setUpAll(() {
    registerFallbackValue(HouseholdSearchModel());
    registerFallbackValue(HouseholdMemberSearchModel());
    registerFallbackValue(IndividualSearchModel());
    registerFallbackValue(ProjectBeneficiarySearchModel());
    registerFallbackValue(TaskSearchModel());
    registerFallbackValue(SideEffectSearchModel());
    registerFallbackValue(ReferralSearchModel());
  });

  // Test case for _handleReloadMember event
  blocTest<HouseholdOverviewBloc, HouseholdOverviewState>(
    'emits [HouseholdOverviewState with loading true, HouseholdOverviewState with updated householdMemberWrapper] when _handleReloadMember is called',
    build: () {
      when(() => mockHouseholdMemberDataRepository.search(any())).thenAnswer(
          (_) async => [RegistrationDeliveryTestConstants.mockHouseholdMember]);
      when(() => mockHouseholdDataRepository.search(any())).thenAnswer(
          (_) async => [RegistrationDeliveryTestConstants.mockHousehold]);
      when(() => mockIndividualDataRepository.search(any())).thenAnswer(
          (_) async => [RegistrationDeliveryTestConstants.mockIndividual]);
      when(() => mockProjectBeneficiaryDataRepository.search(any())).thenAnswer(
          (_) async =>
              [RegistrationDeliveryTestConstants.mockProjectBeneficiary]);
      when(() => mockTaskDataRepository.search(any()))
          .thenAnswer((_) async => []);
      when(() => mockSideEffectDataRepository.search(any()))
          .thenAnswer((_) async => []);
      when(() => mockReferralDataRepository.search(any()))
          .thenAnswer((_) async => []);
      return householdOverviewBloc;
    },
    act: (bloc) => bloc.add(const HouseholdOverviewReloadEvent(
        projectId: RegistrationDeliveryTestConstants.testProjectId,
        projectBeneficiaryType: BeneficiaryType.individual)),
    expect: () => [
      HouseholdOverviewState(
          loading: true,
          householdMemberWrapper:
              RegistrationDeliveryTestConstants.householdMemberWrapper),
      HouseholdOverviewState(
        loading: false,
        householdMemberWrapper:
            RegistrationDeliveryTestConstants.householdMemberWrapper,
      )
    ],
  );
}
