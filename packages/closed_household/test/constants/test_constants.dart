import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/address_type.dart';
import 'package:registration_delivery/registration_delivery.dart';

class ClosedHouseholdConstants {
  static const String clientReferenceId = '1891de8-02a2-4844-80ff-a080b7b40b70';
  static const int dateOfRegistration = 1739868953;
  static const String loggedInUserUuid = '1891de8-02a2-4844-80ff-a080b7b40b70';
  static const String projectId = '1891de8-02a2-4844-80ff-a080b7b40b70';

  static const double latitude = 12.34;
  static const double longitude = 56.78;
  static const double locationAccuracy = 2.0;

  static const String householdHeadName = 'test-head';

  static final AddressModel mockAddress = AddressModel(
    latitude: latitude,
    longitude: longitude,
    locationAccuracy: locationAccuracy,
    type: AddressType.correspondence,
  );

  static final HouseholdModel mockHousehold = HouseholdModel(
    clientReferenceId: clientReferenceId,
    address: mockAddress,
  );

  static final IndividualModel mockIndividual = IndividualModel(
      clientReferenceId: clientReferenceId,
      name: mockName,
      address: [mockAddress],
      identifiers: [identifierModel]);

  static final NameModel mockName = NameModel(
    givenName: householdHeadName,
    individualClientReferenceId: clientReferenceId,
  );

  static final IdentifierModel identifierModel =
      IdentifierModel(clientReferenceId: clientReferenceId);

  static final ProjectBeneficiaryModel mockProjectBeneficiary =
      ProjectBeneficiaryModel(
          clientReferenceId: clientReferenceId,
          dateOfRegistration: dateOfRegistration);

  static final HouseholdMemberModel mockHouseholdMemberModel =
      HouseholdMemberModel(
    isHeadOfHousehold: true,
    clientReferenceId: clientReferenceId,
    householdClientReferenceId: clientReferenceId,
    individualClientReferenceId: clientReferenceId,
  );

  static final TaskModel mockTaskModel = TaskModel(
      clientReferenceId: clientReferenceId,
      projectBeneficiaryClientReferenceId: clientReferenceId,
      address: mockAddress);
}
