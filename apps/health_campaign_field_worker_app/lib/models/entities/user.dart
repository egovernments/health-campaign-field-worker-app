// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class UserSearchModel extends EntitySearchModel {
  final String? userName;
  final List<String>? uuid;

  UserSearchModel({
    this.userName,
    this.uuid,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  UserSearchModel.ignoreDeleted({
    this.userName,
    this.uuid,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true)
class UserModel extends EntityModel {
  static const schemaName = 'User';

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
  final String? uuid;
  final String? createdDate;
  final int? rowVersion;
  final UserAdditionalFields? additionalFields;

  UserModel({
    this.additionalFields,
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
    this.rowVersion,
    super.auditDetails,
    super.isDeleted = false,
  }) : super();

  UserCompanion get companion {
    return UserCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      additionalFields: Value(additionalFields?.toJson()),
      isDeleted: Value(isDeleted),
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
      rowVersion: Value(rowVersion),
    );
  }
}

@MappableClass(ignoreNull: true)
class UserAdditionalFields extends AdditionalFields {
  UserAdditionalFields({
    super.schema = 'User',
    required super.version,
    super.fields,
  });
}
