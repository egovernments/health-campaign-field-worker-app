// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final String? dateOfBirth;
  final String? fatherName;
  final Gender? gender;
  
  IndividualRequestModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.dateOfBirth,
    this.fatherName,
    this.gender,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualModel extends DataModel implements IndividualRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String clientReferenceId;
  final String? userId;
  
  @override
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
  
  @override
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
