import 'package:complaints/complaints.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';

class ComplaintsConstants {
  static const String clientReferenceId = '1891de8-02a2-4844-80ff-a080b7b40b70';
  static final ComplaintsDetailsModel complaintsDetailsModel =
      ComplaintsDetailsModel(
          dateOfComplaint: DateTime(2024),
          administrativeArea: "Settlement 1",
          complaintRaisedFor: "myself",
          complainantName: "Security Issues",
          complainantContactNumber: "9192939495",
          complaintDescription: "test complaint");

  static final BoundaryModel boundaryModel = BoundaryModel(
    latitude: "76",
    longitude: "88",
  );

  static const String complaintType = "Security Issues";

  static final PgrAddressModel addressModel = PgrAddressModel(
    street: "Jane",
    city: "NY",
  );
  static const String createdByUserId = '1891de8-02a2-4844-80ff-a080b7b40b70';

  static const String tenantId = 'mz';

  static var mockPgrServiceModel = PgrServiceModel(
      serviceRequestId: '1891de8-02a2-4844-80ff-a080b7b40b70',
      clientReferenceId: '1891de8-02a2-4844-80ff-a080b7b40b70',
      tenantId: 'mz',
      serviceCode: complaintType,
      description: 'test-complaint',
      applicationStatus: PgrServiceApplicationStatus.created,
      user: PgrComplainantModel(
        clientReferenceId: '1891de8-02a2-4844-80ff-a080b7b40b70',
        complaintClientReferenceId: '1891de8-02a2-4844-80ff-a080b7b40b70',
        tenantId: 'mz',
        mobileNumber: '9192939495',
        auditDetails: AuditDetails(
          createdBy: '1891de8-02a2-4844-80ff-a080b7b40b70',
          createdTime: DateTime(2024).millisecondsSinceEpoch,
        ),
      ),
      address: addressModel,
      auditDetails: AuditDetails(
        createdBy: '1891de8-02a2-4844-80ff-a080b7b40b70',
        createdTime: DateTime(2024).millisecondsSinceEpoch,
      ));
}
