import 'package:bloc_test/bloc_test.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/project_beneficiary.dart';
import 'package:registration_delivery/utils/typedefs.dart';

import 'constants/test_constants.dart';

class MockIndividualDataRepository extends Mock
    implements IndividualDataRepository {}

class MockHouseholdDataRepository extends Mock
    implements HouseholdDataRepository {}

class MockHouseholdMemberDataRepository extends Mock
    implements HouseholdMemberDataRepository {}

class MockProjectBeneficiaryDataRepository extends Mock
    implements ProjectBeneficiaryDataRepository {}

class MockTaskDataRepository extends Mock implements TaskDataRepository {}

void main() {
  late MockIndividualDataRepository mockIndividualDataRepository;
  late MockHouseholdDataRepository mockHouseholdDataRepository;
  late MockHouseholdMemberDataRepository mockHouseholdMemberDataRepository;
  late MockProjectBeneficiaryDataRepository
      mockProjectBeneficiaryDataRepository;
  late MockTaskDataRepository mockTaskDataRepository;
  late BeneficiaryRegistrationBloc beneficiaryRegistrationBloc;

  setUpAll(() {
    registerFallbackValue(RegistrationDeliveryTestConstants.mockAddress);
    registerFallbackValue(RegistrationDeliveryTestConstants.mockAddress1);
    registerFallbackValue(RegistrationDeliveryTestConstants.mockHousehold);
    registerFallbackValue(
        RegistrationDeliveryTestConstants.mockHouseholdMember);
    registerFallbackValue(RegistrationDeliveryTestConstants.mockIndividual);
    registerFallbackValue(
        RegistrationDeliveryTestConstants.mockProjectBeneficiary);
  });

  setUp(() {
    mockIndividualDataRepository = MockIndividualDataRepository();
    mockHouseholdDataRepository = MockHouseholdDataRepository();
    mockHouseholdMemberDataRepository = MockHouseholdMemberDataRepository();
    mockProjectBeneficiaryDataRepository =
        MockProjectBeneficiaryDataRepository();
    mockTaskDataRepository = MockTaskDataRepository();
    beneficiaryRegistrationBloc = BeneficiaryRegistrationBloc(
      const BeneficiaryRegistrationState.create(),
      individualRepository: mockIndividualDataRepository,
      householdRepository: mockHouseholdDataRepository,
      householdMemberRepository: mockHouseholdMemberDataRepository,
      projectBeneficiaryRepository: mockProjectBeneficiaryDataRepository,
      beneficiaryType: BeneficiaryType.individual,
      taskDataRepository: mockTaskDataRepository,
    );
  });

  group('BeneficiaryRegistrationBloc', () {
    // Testing the initial state.
    test('initial state is BeneficiaryRegistrationState', () {
      expect(beneficiaryRegistrationBloc.state,
          equals(const BeneficiaryRegistrationState.create()));
    });

    // Test case for _handleSaveAddress in create state
    blocTest<BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
      'emits [BeneficiaryRegistrationState with addressModel] when _handleSaveAddress is called in create state',
      build: () {
        when(() => mockHouseholdDataRepository.create(any()))
            .thenAnswer((_) async => HouseholdModel(clientReferenceId: '123'));
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) => bloc.add(BeneficiaryRegistrationSaveAddressEvent(
          RegistrationDeliveryTestConstants.mockAddress)),
      expect: () => [
        BeneficiaryRegistrationState.create(
          addressModel: RegistrationDeliveryTestConstants.mockAddress,
        ),
      ],
    );

    // Test case for _handleSaveAddress in editHousehold state
    blocTest<BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
      'emits [BeneficiaryRegistrationState with addressModel] when _handleSaveAddress is called in editHousehold state',
      build: () {
        beneficiaryRegistrationBloc.emit(
          BeneficiaryRegistrationState.editHousehold(
            addressModel: RegistrationDeliveryTestConstants.mockAddress,
            householdModel: RegistrationDeliveryTestConstants.mockHousehold,
            individualModel: [RegistrationDeliveryTestConstants.mockIndividual],
            registrationDate:
                RegistrationDeliveryTestConstants.registrationDate,
          ),
        );
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) => bloc.add(BeneficiaryRegistrationSaveAddressEvent(
          RegistrationDeliveryTestConstants.mockAddress1)),
      expect: () => [
        BeneficiaryRegistrationState.editHousehold(
          addressModel: RegistrationDeliveryTestConstants.mockAddress1,
          householdModel: RegistrationDeliveryTestConstants.mockHousehold,
          individualModel: [RegistrationDeliveryTestConstants.mockIndividual],
          registrationDate: RegistrationDeliveryTestConstants.registrationDate,
        ),
      ],
    );

    // Test case for _handleSaveIndividualDetails
    blocTest<BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
      'emits [BeneficiaryRegistrationState with loading true, BeneficiaryRegistrationState with empty beneficiary] when _handleSaveIndividualDetails results in no match',
      build: () {
        when(() => mockIndividualDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final individualModel =
              invocation.positionalArguments[0] as IndividualModel;
          if (individualModel.clientReferenceId == '123') {
            return individualModel;
          } else {
            return IndividualModel(clientReferenceId: '');
          }
        });
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) =>
          bloc.add(BeneficiaryRegistrationEvent.saveIndividualDetails(
        model: RegistrationDeliveryTestConstants.mockIndividual,
      )),
      expect: () => [
        BeneficiaryRegistrationState.create(
            individualModel: RegistrationDeliveryTestConstants.mockIndividual)
      ],
    );

    // Test case for BeneficiaryRegistrationCreateEvent.
    blocTest<BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
      'emits [BeneficiaryRegistrationState with loading true, BeneficiaryRegistrationState with empty beneficiary] when BeneficiaryRegistrationCreateEvent results in no match',
      build: () {
        when(() => mockIndividualDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final individualModel =
              invocation.positionalArguments[0] as IndividualModel;
          if (individualModel.clientReferenceId == '123') {
            return individualModel;
          } else {
            return RegistrationDeliveryTestConstants.mockIndividual;
          }
        });
        when(() => mockHouseholdDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final householdModel =
              invocation.positionalArguments[0] as HouseholdModel;
          if (householdModel.clientReferenceId == '123') {
            return householdModel;
          } else {
            return RegistrationDeliveryTestConstants.mockHousehold;
          }
        });
        when(() => mockHouseholdMemberDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final householdMemberModel =
              invocation.positionalArguments[0] as HouseholdMemberModel;
          if (householdMemberModel.clientReferenceId == '123') {
            return householdMemberModel;
          } else {
            return RegistrationDeliveryTestConstants.mockHouseholdMember;
          }
        });
        when(() => mockProjectBeneficiaryDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final projectBeneficiaryModel =
              invocation.positionalArguments[0] as ProjectBeneficiaryModel;
          if (projectBeneficiaryModel.clientReferenceId == '123') {
            return projectBeneficiaryModel;
          } else {
            return RegistrationDeliveryTestConstants.mockProjectBeneficiary;
          }
        });
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) {
        bloc.emit(BeneficiaryRegistrationState.create(
          householdModel: RegistrationDeliveryTestConstants.mockHousehold,
          individualModel: RegistrationDeliveryTestConstants.mockIndividual,
          addressModel: RegistrationDeliveryTestConstants.mockAddress,
          isHeadOfHousehold: true,
          registrationDate: RegistrationDeliveryTestConstants.registrationDate,
        ));
      },
      expect: () => [
        BeneficiaryRegistrationState.create(
          householdModel: RegistrationDeliveryTestConstants.mockHousehold,
          individualModel: RegistrationDeliveryTestConstants.mockIndividual,
          addressModel: RegistrationDeliveryTestConstants.mockAddress,
          isHeadOfHousehold: true,
          registrationDate: RegistrationDeliveryTestConstants.registrationDate,
          loading: false,
        ),
      ],
    );
  });
}
