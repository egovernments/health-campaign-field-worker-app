import 'package:digit_data_model/data_model.dart';
import 'package:registration/blocs/search_households/search_households.dart';
import 'package:registration/models/entities/household.dart';
import 'package:registration/models/entities/household_member.dart';
import 'package:registration/models/entities/project_beneficiary.dart';

class RegistrationDeliveryTestConstants {
  static var dateOfRegistration = DateTime.monday;
  static const testProjectId = '1d2e3f4g5h6i7j8k9l0m';
  static const testUserUuid = '1a2b3c4d5e6f7g8h9i0j';
  static var testBoundary = BoundaryModel(code: 'BAN005', name: 'HSR');
  static var registrationDate = DateTime.utc(2024, 5, 20);
  static var mockAddress = AddressModel(
    addressLine1: '123, 4th Cross',
    addressLine2: '5th Main',
    city: 'Bangalore',
    pincode: '560102',
  );
  static var mockAddress1 = AddressModel(
    addressLine1: '12, 4th Cross',
    addressLine2: '5th Main',
    city: 'Bangalore',
    pincode: '560102',
  );
  static var mockHousehold = HouseholdModel(
    clientReferenceId: '1ce2-3f4g-5h6i-7j8k-9l0m',
    address: mockAddress,
  );
  static var mockHouseholdMember = HouseholdMemberModel(
    clientReferenceId: '4fwq-3f4g-5h6i-7j8k-9l0m',
    isHeadOfHousehold: true,
  );
  static var mockIndividual = IndividualModel(
    clientReferenceId: '7fwq-3f4g-5h6i-7j8k-9l0m',
    address: [mockAddress],
  );
  static var mockProjectBeneficiary = ProjectBeneficiaryModel(
    clientReferenceId: '1ce2-3f4g-5h6i-7j8k-9l0m',
    dateOfRegistration: DateTime.monday,
  );

  static int lastDose = 1;
  static int lastCycle = 1;

  static ProjectTypeModel projectTypeModel =
      ProjectTypeModel(id: 'a1de321d3', name: 'Individual');

  static IndividualModel individualModel = IndividualModel(
    clientReferenceId: '1ce2-3f4g-5h6i-7j8k-9l0m',
    name: NameModel(givenName: 'test'),
    address: [mockAddress],
  );

  static ProjectCycle projectCycle = ProjectCycle(
      id: 1,
      startDate: DateTime.now().day - 2,
      endDate: DateTime.now().day + 2);

  static HouseholdMemberWrapper householdMemberWrapper = HouseholdMemberWrapper(
    household: mockHousehold,
    headOfHousehold: mockIndividual,
    members: [individualModel],
    projectBeneficiaries: [mockProjectBeneficiary],
  );
}
