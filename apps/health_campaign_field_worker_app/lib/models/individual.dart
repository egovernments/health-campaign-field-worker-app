// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class IndividualSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final String? dateOfBirth;
  final NameSearchModel? name;
  final Gender? gender;
  final List<IdentifierSearchModel>? identifiers;
  
  IndividualSearchModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.dateOfBirth,
    this.name,
    this.gender,
    this.identifiers,
    super.boundaryCode,
  }):  super();
}

@MappableClass()
class IndividualModel extends EntityModel implements IndividualSearchModel {
  
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
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  final int rowVersion;
  
  @override
  final NameModel name;
  final BloodGroup bloodGroup;
  final List<AddressModel> address;
  
  @override
  final Gender gender;
  
  @override
  final List<IdentifierModel> identifiers;
  

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
    required this.address,
    required this.gender,
    required this.identifiers,
    super.auditDetails,
  }):  super();
}
