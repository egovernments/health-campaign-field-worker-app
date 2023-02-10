// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualSearchModel extends EntitySearchModel {
  final String? id;
  final String? dateOfBirth;
  final String? clientReferenceId;
  final String? tenantId;
  final NameSearchModel? name;
  final Gender? gender;
  final List<IdentifierSearchModel>? identifiers;
  
  IndividualSearchModel({
    this.id,
    this.dateOfBirth,
    this.clientReferenceId,
    this.tenantId,
    this.name,
    this.gender,
    this.identifiers,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualModel extends EntityModel implements IndividualSearchModel {
  
  @override
  final String? id;
  final String? userId;
  
  @override
  final String? dateOfBirth;
  final String? mobileNumber;
  final String? altContactNumber;
  final String? email;
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  
  @override
  final String clientReferenceId;
  
  @override
  final String tenantId;
  final int rowVersion;
  
  @override
  final NameModel? name;
  final BloodGroup? bloodGroup;
  final List<AddressModel>? address;
  
  @override
  final Gender? gender;
  
  @override
  final List<IdentifierModel>? identifiers;
  

  IndividualModel({
    this.id,
    this.userId,
    this.dateOfBirth,
    this.mobileNumber,
    this.altContactNumber,
    this.email,
    this.fatherName,
    this.husbandName,
    this.photo,
    required this.clientReferenceId,
    required this.tenantId,
    required this.rowVersion,
    this.name,
    this.bloodGroup,
    this.address,
    this.gender,
    this.identifiers,
    super.auditDetails,
  }):  super();

  IndividualCompanion get companion {
    return IndividualCompanion(
      id: Value(id),
      userId: Value(userId),
      dateOfBirth: Value(dateOfBirth),
      mobileNumber: Value(mobileNumber),
      altContactNumber: Value(altContactNumber),
      email: Value(email),
      fatherName: Value(fatherName),
      husbandName: Value(husbandName),
      photo: Value(photo),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      rowVersion: Value(rowVersion),
      bloodGroup: Value(bloodGroup),
      gender: Value(gender),
      );
  }
}
