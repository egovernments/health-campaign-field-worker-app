// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualRequestModel extends DataModel {
  final String? fatherName;
  
  IndividualRequestModel({
    this.fatherName,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class IndividualModel extends DataModel implements IndividualRequestModel {
  final String? id;
  final String tenantId;
  final String clientReferenceId;
  final String? userId;
  final String dateOfBirth;
  final String mobileNumber;
  final String? altContactNumber;
  final String? email;
  
  @override
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  final int rowVersion;
  final NameRequestModel name;
  final BloodGroup bloodGroup;
  final AddressRequestModel? address;
  final Gender gender;
  final List<IdentifierRequestModel> identifiers;
  

  IndividualModel({
    this.id,
    required this.tenantId,
    required this.clientReferenceId,
    this.userId,
    required this.dateOfBirth,
    required this.mobileNumber,
    this.altContactNumber,
    this.email,
    this.fatherName,
    this.husbandName,
    this.photo,
    required this.rowVersion,
    required this.name,
    required this.bloodGroup,
    this.address,
    required this.gender,
    required this.identifiers,
    super.auditDetails,
  }):  super();
}
