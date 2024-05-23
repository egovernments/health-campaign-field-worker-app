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

class MockIndividualDataRepository extends Mock
    implements IndividualDataRepository {}

class MockHouseholdDataRepository extends Mock
    implements HouseholdDataRepository {}

class MockHouseholdMemberDataRepository extends Mock
    implements HouseholdMemberDataRepository {}

class MockProjectBeneficiaryDataRepository extends Mock
    implements ProjectBeneficiaryDataRepository {}

void main() {
  late MockIndividualDataRepository mockIndividualDataRepository;
  late MockHouseholdDataRepository mockHouseholdDataRepository;
  late MockHouseholdMemberDataRepository mockHouseholdMemberDataRepository;
  late MockProjectBeneficiaryDataRepository
      mockProjectBeneficiaryDataRepository;
  late BeneficiaryRegistrationBloc beneficiaryRegistrationBloc;
  var dateOfRegistration = DateTime.monday;
  const testProjectId = '1d2e3f4g5h6i7j8k9l0m';
  const testUserUuid = '1a2b3c4d5e6f7g8h9i0j';
  var testBoundary = BoundaryModel(code: 'BAN005', name: 'HSR');
  var registrationDate = DateTime.utc(2024, 5, 20);
  var mockAddress = AddressModel(
    addressLine1: '123, 4th Cross',
    addressLine2: '5th Main',
    city: 'Bangalore',
    pincode: '560102',
  );
  var mockAddress1 = AddressModel(
    addressLine1: '12, 4th Cross',
    addressLine2: '5th Main',
    city: 'Bangalore',
    pincode: '560102',
  );
  var mockHousehold = HouseholdModel(
    clientReferenceId: '123',
    address: mockAddress,
  );
  var mockHouseholdMember = HouseholdMemberModel(
    clientReferenceId: '123',
    isHeadOfHousehold: true,
  );
  var mockIndividual = IndividualModel(
    clientReferenceId: '123',
    address: [mockAddress],
  );
  var mockProjectBeneficiary = ProjectBeneficiaryModel(
    clientReferenceId: '123',
    dateOfRegistration: DateTime.monday,
  );

  setUpAll(() {
    registerFallbackValue(AddressModel());
    registerFallbackValue(HouseholdModel(clientReferenceId: '123'));
    registerFallbackValue(HouseholdMemberModel(
        clientReferenceId: '123', isHeadOfHousehold: true));
    registerFallbackValue(IndividualModel(clientReferenceId: '123'));
    registerFallbackValue(ProjectBeneficiaryModel(
        clientReferenceId: '123', dateOfRegistration: dateOfRegistration));
  });

  setUp(() {
    mockIndividualDataRepository = MockIndividualDataRepository();
    mockHouseholdDataRepository = MockHouseholdDataRepository();
    mockHouseholdMemberDataRepository = MockHouseholdMemberDataRepository();
    mockProjectBeneficiaryDataRepository =
        MockProjectBeneficiaryDataRepository();
    beneficiaryRegistrationBloc = BeneficiaryRegistrationBloc(
      const BeneficiaryRegistrationState.create(),
      individualRepository: mockIndividualDataRepository,
      householdRepository: mockHouseholdDataRepository,
      householdMemberRepository: mockHouseholdMemberDataRepository,
      projectBeneficiaryRepository: mockProjectBeneficiaryDataRepository,
      beneficiaryType: BeneficiaryType.individual,
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
      act: (bloc) =>
          bloc.add(BeneficiaryRegistrationSaveAddressEvent(mockAddress)),
      expect: () => [
        BeneficiaryRegistrationState.create(
          addressModel: mockAddress,
        ),
      ],
    );

    // Test case for _handleSaveAddress in editHousehold state
    blocTest<BeneficiaryRegistrationBloc, BeneficiaryRegistrationState>(
      'emits [BeneficiaryRegistrationState with addressModel] when _handleSaveAddress is called in editHousehold state',
      build: () {
        beneficiaryRegistrationBloc.emit(
          BeneficiaryRegistrationState.editHousehold(
            addressModel: mockAddress,
            householdModel: mockHousehold,
            individualModel: [mockIndividual],
            registrationDate: registrationDate,
          ),
        );
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) =>
          bloc.add(BeneficiaryRegistrationSaveAddressEvent(mockAddress1)),
      expect: () => [
        BeneficiaryRegistrationState.editHousehold(
          addressModel: mockAddress1,
          householdModel: mockHousehold,
          individualModel: [mockIndividual],
          registrationDate: registrationDate,
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
        model: mockIndividual,
      )),
      expect: () => [
        BeneficiaryRegistrationState.create(individualModel: mockIndividual)
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
            return mockIndividual;
          }
        });
        when(() => mockHouseholdDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final householdModel =
              invocation.positionalArguments[0] as HouseholdModel;
          if (householdModel.clientReferenceId == '123') {
            return householdModel;
          } else {
            return mockHousehold;
          }
        });
        when(() => mockHouseholdMemberDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final householdMemberModel =
              invocation.positionalArguments[0] as HouseholdMemberModel;
          if (householdMemberModel.clientReferenceId == '123') {
            return householdMemberModel;
          } else {
            return mockHouseholdMember;
          }
        });
        when(() => mockProjectBeneficiaryDataRepository.create(any()))
            .thenAnswer((invocation) async {
          final projectBeneficiaryModel =
              invocation.positionalArguments[0] as ProjectBeneficiaryModel;
          if (projectBeneficiaryModel.clientReferenceId == '123') {
            return projectBeneficiaryModel;
          } else {
            return mockProjectBeneficiary;
          }
        });
        return beneficiaryRegistrationBloc;
      },
      act: (bloc) {
        bloc.emit(BeneficiaryRegistrationState.create(
          householdModel: mockHousehold,
          individualModel: mockIndividual,
          addressModel: mockAddress,
          isHeadOfHousehold: true,
          registrationDate: registrationDate,
        ));
      },
      expect: () => [
        BeneficiaryRegistrationState.create(
          householdModel: mockHousehold,
          individualModel: mockIndividual,
          addressModel: mockAddress,
          isHeadOfHousehold: true,
          registrationDate: registrationDate,
          loading: false,
        ),
      ],
    );
  });
}
