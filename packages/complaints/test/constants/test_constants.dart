import 'package:complaints/complaints.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';

class ComplaintsConstants{
  static final ComplaintsDetailsModel complaintsDetailsModel = ComplaintsDetailsModel(
      dateOfComplaint: DateTime(2024),
      administrativeArea: "abcd",
      complaintRaisedFor: "myself",
      complainantName: "test",
      complainantContactNumber: "8888888",
      complaintDescription: "test complaint"
  );

  static final BoundaryModel boundaryModel = BoundaryModel(
    latitude: "76",
    longitude: "88",
  );

  static const String complaintType = "test-type";

  static final PgrAddressModel addressModel = PgrAddressModel(
    street: "XYZ",
    city: "ABC",
  );

  static var mockPgrServiceModel = PgrServiceModel(
      clientReferenceId: '123',
      tenantId: 'abc',
      serviceCode: complaintType,
      description: 'test-complaint',
      applicationStatus: PgrServiceApplicationStatus.created,
      user: PgrComplainantModel(
        clientReferenceId: '123',
        complaintClientReferenceId: '123',
        tenantId: 'abc',
      ),
      address: addressModel
  );
}