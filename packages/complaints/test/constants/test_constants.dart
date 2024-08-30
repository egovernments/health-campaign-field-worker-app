import 'package:complaints/complaints.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';

class ComplaintsConstants{
  static final ComplaintsDetailsModel complaintsDetailsModel = ComplaintsDetailsModel(
      dateOfComplaint: DateTime(2024),
      administrativeArea: "Settlement 1",
      complaintRaisedFor: "myself",
      complainantName: "Security Issues",
      complainantContactNumber: "9192939495",
      complaintDescription: "test complaint"
  );

  static final BoundaryModel boundaryModel = BoundaryModel(
    latitude: "76",
    longitude: "88",
  );

  static const String complaintType = "Security Issues";

  static final PgrAddressModel addressModel = PgrAddressModel(
    street: "Jane",
    city: "NY",
  );
  static const String createdByUserId = "123456789";

  static var mockPgrServiceModel = PgrServiceModel(
      clientReferenceId: '123',
      tenantId: 'mz',
      serviceCode: complaintType,
      description: 'test-complaint',
      applicationStatus: PgrServiceApplicationStatus.created,
      user: const PgrComplainantModel(
        clientReferenceId: '123',
        complaintClientReferenceId: '123',
        tenantId: 'mz',
      ),
      address: addressModel
  );
}