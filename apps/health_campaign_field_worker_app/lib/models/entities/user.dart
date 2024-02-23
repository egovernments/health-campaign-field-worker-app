// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

part 'user.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserSearchModel extends EntitySearchModel with UserSearchModelMappable {
  final String? id;
  final String? userName;
  final List<String>? uuid;
  
  UserSearchModel({
    this.id,
    this.userName,
    this.uuid,
    super.boundaryCode,
    super.isDeleted,
  }):  super();

  @MappableConstructor()
  UserSearchModel.ignoreDeleted({
    this.id,
    this.userName,
    this.uuid,
    super.boundaryCode,
  }):  super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserModel extends EntityModel with UserModelMappable {

  static const schemaName = 'User';

  final String? id;
  final String? userName;
  final String? salutation;
  final String? name;
  final String? gender;
  final String? mobileNumber;
  final String? emailId;
  final String? altContactNumber;
  final String? pan;
  final String? aadhaarNumber;
  final String? permanentAddress;
  final String? permanentCity;
  final String? permanentPinCode;
  final String? correspondenceAddress;
  final String? correspondenceCity;
  final String? correspondencePinCode;
  final String? alternatemobilenumber;
  final bool? active;
  final String? locale;
  final String? type;
  final bool? accountLocked;
  final int? accountLockedDate;
  final String? fatherOrHusbandName;
  final String? relationship;
  final String? signature;
  final String? bloodGroup;
  final String? photo;
  final String? identificationMark;
  final int? createdBy;
  final String? lastModifiedBy;
  final String? tenantId;
  final List<String>? uuid;
  final String? createdDate;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final UserAdditionalFields? additionalFields;

  UserModel({
    this.additionalFields,
    this.id,
    this.userName,
    this.salutation,
    this.name,
    this.gender,
    this.mobileNumber,
    this.emailId,
    this.altContactNumber,
    this.pan,
    this.aadhaarNumber,
    this.permanentAddress,
    this.permanentCity,
    this.permanentPinCode,
    this.correspondenceAddress,
    this.correspondenceCity,
    this.correspondencePinCode,
    this.alternatemobilenumber,
    this.active,
    this.locale,
    this.type,
    this.accountLocked,
    this.accountLockedDate,
    this.fatherOrHusbandName,
    this.relationship,
    this.signature,
    this.bloodGroup,
    this.photo,
    this.identificationMark,
    this.createdBy,
    this.lastModifiedBy,
    this.tenantId,
    this.uuid,
    this.createdDate,
    this.nonRecoverableError = false,
    this.rowVersion,
    super.auditDetails,super.clientAuditDetails,
    super.isDeleted = false,
  }): super();

  UserCompanion get companion {
    return UserCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      clientCreatedTime: Value(clientAuditDetails?.createdTime),
      clientModifiedTime: Value(clientAuditDetails?.lastModifiedTime),
      clientCreatedBy: Value(clientAuditDetails?.createdBy),
      clientModifiedBy: Value(clientAuditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
      id: Value(id),
      userName: Value(userName),
      salutation: Value(salutation),
      name: Value(name),
      gender: Value(gender),
      mobileNumber: Value(mobileNumber),
      emailId: Value(emailId),
      altContactNumber: Value(altContactNumber),
      pan: Value(pan),
      aadhaarNumber: Value(aadhaarNumber),
      permanentAddress: Value(permanentAddress),
      permanentCity: Value(permanentCity),
      permanentPinCode: Value(permanentPinCode),
      correspondenceAddress: Value(correspondenceAddress),
      correspondenceCity: Value(correspondenceCity),
      correspondencePinCode: Value(correspondencePinCode),
      alternatemobilenumber: Value(alternatemobilenumber),
      active: Value(active),
      locale: Value(locale),
      type: Value(type),
      accountLocked: Value(accountLocked),
      accountLockedDate: Value(accountLockedDate),
      fatherOrHusbandName: Value(fatherOrHusbandName),
      relationship: Value(relationship),
      signature: Value(signature),
      bloodGroup: Value(bloodGroup),
      photo: Value(photo),
      identificationMark: Value(identificationMark),
      createdBy: Value(createdBy),
      lastModifiedBy: Value(lastModifiedBy),
      tenantId: Value(tenantId),
      uuid: Value(uuid?.toString()),
      createdDate: Value(createdDate),
      nonRecoverableError: Value(nonRecoverableError),
      rowVersion: Value(rowVersion),
      );
  }
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserAdditionalFields extends AdditionalFields with UserAdditionalFieldsMappable {
  UserAdditionalFields({
    super.schema = 'User',
    required super.version,
    super.fields,
  });
}

