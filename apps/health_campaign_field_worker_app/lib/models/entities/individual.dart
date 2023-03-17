// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class IndividualSearchModel extends EntitySearchModel {
  final String? id;
  final String? dateOfBirth;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final NameSearchModel? name;
  final Gender? gender;
  final List<IdentifierSearchModel>? identifiers;
  
  IndividualSearchModel({
    this.id,
    this.dateOfBirth,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    this.name,
    this.gender,
    this.identifiers,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class IndividualModel extends EntityModel {

  static const schemaName = 'Individual';

  final String? id;
  final String? userId;
  final String? dateOfBirth;
  final String? mobileNumber;
  final String? altContactNumber;
  final String? email;
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  final String clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  final int? rowVersion;
  final NameModel? name;
  final BloodGroup? bloodGroup;
  final List<AddressModel>? address;
  final Gender? gender;
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
    this.tenantId,
    this.isDeleted,
    this.rowVersion,
    this.name,
    this.bloodGroup,
    this.address,
    this.gender,
    this.identifiers,
    super.auditDetails,
    IndividualAdditionalFields? additionalFields,
  }):  super(additionalFields: additionalFields);

  IndividualCompanion get companion {
    return IndividualCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toString()),
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
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      bloodGroup: Value(bloodGroup),
      gender: Value(gender),
      );
  }
}

class IndividualAdditionalFields extends AdditionalFields {
  IndividualAdditionalFields({
    super.schema = 'Individual',
    required super.version,
    super.fields,
  });
}
