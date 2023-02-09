// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';
import 'data_model.dart';

@MappableClass(ignoreNull: true)
class IndividualSearchModel extends EntitySearchModel {
  final String? id;
  final String? tenantId;
  final String? dateOfBirth;
  final String? clientReferenceId;
  final NameSearchModel? name;
  final Gender? gender;
  final List<IdentifierSearchModel>? identifiers;
  
  IndividualSearchModel({
    this.id,
    this.tenantId,
    this.dateOfBirth,
    this.clientReferenceId,
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
  
  @override
  final String? tenantId;
  final String? userId;
  
  @override
  final String? dateOfBirth;
  final String? mobileNumber;
  final String? altContactNumber;
  final String? email;
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  final int? rowVersion;
  
  @override
  final String clientReferenceId;
  
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
    this.tenantId,
    this.userId,
    this.dateOfBirth,
    this.mobileNumber,
    this.altContactNumber,
    this.email,
    this.fatherName,
    this.husbandName,
    this.photo,
    this.rowVersion,
    required this.clientReferenceId,
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
      tenantId: Value(tenantId),
      userId: Value(userId),
      dateOfBirth: Value(dateOfBirth),
      mobileNumber: Value(mobileNumber),
      altContactNumber: Value(altContactNumber),
      email: Value(email),
      fatherName: Value(fatherName),
      husbandName: Value(husbandName),
      photo: Value(photo),
      rowVersion: Value(rowVersion),
      clientReferenceId: Value(clientReferenceId),
      bloodGroup: Value(bloodGroup),
      gender: Value(gender),
      );
  }
}
