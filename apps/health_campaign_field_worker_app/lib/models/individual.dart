import 'package:dart_mappable/dart_mappable.dart';

import 'address.dart';
import 'gender.dart';
import 'data_model.dart';

@MappableClass()
class IndividualRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? clientReferenceId;
  final String? name;
  final String? dateOfBirth;
  final int? rowVersion;
  
  final AddressRequestModel? address;
  final Gender? gender;
  
  
  IndividualRequestModel({
    this.id,
    this.tenantId,
    this.clientReferenceId,
    this.name,
    this.dateOfBirth,
    this.rowVersion,
    this.address,
    this.gender,
    super.auditDetails,
  }):  super();

  
}

@MappableClass()
class IndividualModel extends DataModel implements IndividualRequestModel {
  
  @override
  final String id;
  
  @override
  final String tenantId;
  
  @override
  final String clientReferenceId;
  
  @override
  final String name;
  
  @override
  final String dateOfBirth;
  
  @override
  final int rowVersion;
  
  
  @override
  final AddressRequestModel address;
  
  @override
  final Gender gender;
  
  

  IndividualModel({
    required this.id,
    required this.tenantId,
    required this.clientReferenceId,
    required this.name,
    required this.dateOfBirth,
    required this.rowVersion,
    required this.address,
    required this.gender,
    super.auditDetails,
  }):  super();

  
}
