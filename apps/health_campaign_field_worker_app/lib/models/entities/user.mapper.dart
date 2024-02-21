// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class UserSearchModelMapper extends SubClassMapperBase<UserSearchModel> {
  UserSearchModelMapper._();

  static UserSearchModelMapper? _instance;
  static UserSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchModel';

  static String? _$id(UserSearchModel v) => v.id;
  static const Field<UserSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$userName(UserSearchModel v) => v.userName;
  static const Field<UserSearchModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static List<String>? _$uuid(UserSearchModel v) => v.uuid;
  static const Field<UserSearchModel, List<String>> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static String? _$boundaryCode(UserSearchModel v) => v.boundaryCode;
  static const Field<UserSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(UserSearchModel v) => v.auditDetails;
  static const Field<UserSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(UserSearchModel v) =>
      v.additionalFields;
  static const Field<UserSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<UserSearchModel> fields = const {
    #id: _f$id,
    #userName: _f$userName,
    #uuid: _f$uuid,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntitySearchModelMapper.ensureInitialized();

  static UserSearchModel _instantiate(DecodingData data) {
    return UserSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        userName: data.dec(_f$userName),
        uuid: data.dec(_f$uuid),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchModel>(map);
  }

  static UserSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchModel>(json);
  }
}

mixin UserSearchModelMappable {
  String toJson() {
    return UserSearchModelMapper.ensureInitialized()
        .encodeJson<UserSearchModel>(this as UserSearchModel);
  }

  Map<String, dynamic> toMap() {
    return UserSearchModelMapper.ensureInitialized()
        .encodeMap<UserSearchModel>(this as UserSearchModel);
  }

  UserSearchModelCopyWith<UserSearchModel, UserSearchModel, UserSearchModel>
      get copyWith => _UserSearchModelCopyWithImpl(
          this as UserSearchModel, $identity, $identity);
  @override
  String toString() {
    return UserSearchModelMapper.ensureInitialized()
        .stringifyValue(this as UserSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserSearchModelMapper.ensureInitialized()
                .isValueEqual(this as UserSearchModel, other));
  }

  @override
  int get hashCode {
    return UserSearchModelMapper.ensureInitialized()
        .hashValue(this as UserSearchModel);
  }
}

extension UserSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchModel, $Out> {
  UserSearchModelCopyWith<$R, UserSearchModel, $Out> get $asUserSearchModel =>
      $base.as((v, t, t2) => _UserSearchModelCopyWithImpl(v, t, t2));
}

abstract class UserSearchModelCopyWith<$R, $In extends UserSearchModel, $Out>
    implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid;
  @override
  $R call(
      {String? id, String? userName, List<String>? uuid, String? boundaryCode});
  UserSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchModel, $Out>
    implements UserSearchModelCopyWith<$R, UserSearchModel, $Out> {
  _UserSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchModel> $mapper =
      UserSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid =>
      $value.uuid != null
          ? ListCopyWith($value.uuid!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(uuid: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? userName = $none,
          Object? uuid = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userName != $none) #userName: userName,
        if (uuid != $none) #uuid: uuid,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  UserSearchModel $make(CopyWithData data) => UserSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      userName: data.get(#userName, or: $value.userName),
      uuid: data.get(#uuid, or: $value.uuid),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  UserSearchModelCopyWith<$R2, UserSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchModelCopyWithImpl($value, $cast, t);
}

class UserModelMapper extends SubClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static UserAdditionalFields? _$additionalFields(UserModel v) =>
      v.additionalFields;
  static const Field<UserModel, UserAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(UserModel v) => v.id;
  static const Field<UserModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$userName(UserModel v) => v.userName;
  static const Field<UserModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$salutation(UserModel v) => v.salutation;
  static const Field<UserModel, String> _f$salutation =
      Field('salutation', _$salutation, opt: true);
  static String? _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$gender(UserModel v) => v.gender;
  static const Field<UserModel, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$mobileNumber(UserModel v) => v.mobileNumber;
  static const Field<UserModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static String? _$emailId(UserModel v) => v.emailId;
  static const Field<UserModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static String? _$altContactNumber(UserModel v) => v.altContactNumber;
  static const Field<UserModel, String> _f$altContactNumber =
      Field('altContactNumber', _$altContactNumber, opt: true);
  static String? _$pan(UserModel v) => v.pan;
  static const Field<UserModel, String> _f$pan = Field('pan', _$pan, opt: true);
  static String? _$aadhaarNumber(UserModel v) => v.aadhaarNumber;
  static const Field<UserModel, String> _f$aadhaarNumber =
      Field('aadhaarNumber', _$aadhaarNumber, opt: true);
  static String? _$permanentAddress(UserModel v) => v.permanentAddress;
  static const Field<UserModel, String> _f$permanentAddress =
      Field('permanentAddress', _$permanentAddress, opt: true);
  static String? _$permanentCity(UserModel v) => v.permanentCity;
  static const Field<UserModel, String> _f$permanentCity =
      Field('permanentCity', _$permanentCity, opt: true);
  static String? _$permanentPinCode(UserModel v) => v.permanentPinCode;
  static const Field<UserModel, String> _f$permanentPinCode =
      Field('permanentPinCode', _$permanentPinCode, opt: true);
  static String? _$correspondenceAddress(UserModel v) =>
      v.correspondenceAddress;
  static const Field<UserModel, String> _f$correspondenceAddress =
      Field('correspondenceAddress', _$correspondenceAddress, opt: true);
  static String? _$correspondenceCity(UserModel v) => v.correspondenceCity;
  static const Field<UserModel, String> _f$correspondenceCity =
      Field('correspondenceCity', _$correspondenceCity, opt: true);
  static String? _$correspondencePinCode(UserModel v) =>
      v.correspondencePinCode;
  static const Field<UserModel, String> _f$correspondencePinCode =
      Field('correspondencePinCode', _$correspondencePinCode, opt: true);
  static String? _$alternatemobilenumber(UserModel v) =>
      v.alternatemobilenumber;
  static const Field<UserModel, String> _f$alternatemobilenumber =
      Field('alternatemobilenumber', _$alternatemobilenumber, opt: true);
  static bool? _$active(UserModel v) => v.active;
  static const Field<UserModel, bool> _f$active =
      Field('active', _$active, opt: true);
  static String? _$locale(UserModel v) => v.locale;
  static const Field<UserModel, String> _f$locale =
      Field('locale', _$locale, opt: true);
  static String? _$type(UserModel v) => v.type;
  static const Field<UserModel, String> _f$type =
      Field('type', _$type, opt: true);
  static bool? _$accountLocked(UserModel v) => v.accountLocked;
  static const Field<UserModel, bool> _f$accountLocked =
      Field('accountLocked', _$accountLocked, opt: true);
  static int? _$accountLockedDate(UserModel v) => v.accountLockedDate;
  static const Field<UserModel, int> _f$accountLockedDate =
      Field('accountLockedDate', _$accountLockedDate, opt: true);
  static String? _$fatherOrHusbandName(UserModel v) => v.fatherOrHusbandName;
  static const Field<UserModel, String> _f$fatherOrHusbandName =
      Field('fatherOrHusbandName', _$fatherOrHusbandName, opt: true);
  static String? _$relationship(UserModel v) => v.relationship;
  static const Field<UserModel, String> _f$relationship =
      Field('relationship', _$relationship, opt: true);
  static String? _$signature(UserModel v) => v.signature;
  static const Field<UserModel, String> _f$signature =
      Field('signature', _$signature, opt: true);
  static String? _$bloodGroup(UserModel v) => v.bloodGroup;
  static const Field<UserModel, String> _f$bloodGroup =
      Field('bloodGroup', _$bloodGroup, opt: true);
  static String? _$photo(UserModel v) => v.photo;
  static const Field<UserModel, String> _f$photo =
      Field('photo', _$photo, opt: true);
  static String? _$identificationMark(UserModel v) => v.identificationMark;
  static const Field<UserModel, String> _f$identificationMark =
      Field('identificationMark', _$identificationMark, opt: true);
  static int? _$createdBy(UserModel v) => v.createdBy;
  static const Field<UserModel, int> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static String? _$lastModifiedBy(UserModel v) => v.lastModifiedBy;
  static const Field<UserModel, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static String? _$tenantId(UserModel v) => v.tenantId;
  static const Field<UserModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static List<String>? _$uuid(UserModel v) => v.uuid;
  static const Field<UserModel, List<String>> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static String? _$createdDate(UserModel v) => v.createdDate;
  static const Field<UserModel, String> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static bool? _$nonRecoverableError(UserModel v) => v.nonRecoverableError;
  static const Field<UserModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(UserModel v) => v.rowVersion;
  static const Field<UserModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(UserModel v) => v.auditDetails;
  static const Field<UserModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(UserModel v) =>
      v.clientAuditDetails;
  static const Field<UserModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(UserModel v) => v.isDeleted;
  static const Field<UserModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<UserModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #userName: _f$userName,
    #salutation: _f$salutation,
    #name: _f$name,
    #gender: _f$gender,
    #mobileNumber: _f$mobileNumber,
    #emailId: _f$emailId,
    #altContactNumber: _f$altContactNumber,
    #pan: _f$pan,
    #aadhaarNumber: _f$aadhaarNumber,
    #permanentAddress: _f$permanentAddress,
    #permanentCity: _f$permanentCity,
    #permanentPinCode: _f$permanentPinCode,
    #correspondenceAddress: _f$correspondenceAddress,
    #correspondenceCity: _f$correspondenceCity,
    #correspondencePinCode: _f$correspondencePinCode,
    #alternatemobilenumber: _f$alternatemobilenumber,
    #active: _f$active,
    #locale: _f$locale,
    #type: _f$type,
    #accountLocked: _f$accountLocked,
    #accountLockedDate: _f$accountLockedDate,
    #fatherOrHusbandName: _f$fatherOrHusbandName,
    #relationship: _f$relationship,
    #signature: _f$signature,
    #bloodGroup: _f$bloodGroup,
    #photo: _f$photo,
    #identificationMark: _f$identificationMark,
    #createdBy: _f$createdBy,
    #lastModifiedBy: _f$lastModifiedBy,
    #tenantId: _f$tenantId,
    #uuid: _f$uuid,
    #createdDate: _f$createdDate,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        userName: data.dec(_f$userName),
        salutation: data.dec(_f$salutation),
        name: data.dec(_f$name),
        gender: data.dec(_f$gender),
        mobileNumber: data.dec(_f$mobileNumber),
        emailId: data.dec(_f$emailId),
        altContactNumber: data.dec(_f$altContactNumber),
        pan: data.dec(_f$pan),
        aadhaarNumber: data.dec(_f$aadhaarNumber),
        permanentAddress: data.dec(_f$permanentAddress),
        permanentCity: data.dec(_f$permanentCity),
        permanentPinCode: data.dec(_f$permanentPinCode),
        correspondenceAddress: data.dec(_f$correspondenceAddress),
        correspondenceCity: data.dec(_f$correspondenceCity),
        correspondencePinCode: data.dec(_f$correspondencePinCode),
        alternatemobilenumber: data.dec(_f$alternatemobilenumber),
        active: data.dec(_f$active),
        locale: data.dec(_f$locale),
        type: data.dec(_f$type),
        accountLocked: data.dec(_f$accountLocked),
        accountLockedDate: data.dec(_f$accountLockedDate),
        fatherOrHusbandName: data.dec(_f$fatherOrHusbandName),
        relationship: data.dec(_f$relationship),
        signature: data.dec(_f$signature),
        bloodGroup: data.dec(_f$bloodGroup),
        photo: data.dec(_f$photo),
        identificationMark: data.dec(_f$identificationMark),
        createdBy: data.dec(_f$createdBy),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        tenantId: data.dec(_f$tenantId),
        uuid: data.dec(_f$uuid),
        createdDate: data.dec(_f$createdDate),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl(this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserModelMapper.ensureInitialized()
                .isValueEqual(this as UserModel, other));
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  UserAdditionalFieldsCopyWith<$R, UserAdditionalFields, UserAdditionalFields>?
      get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {UserAdditionalFields? additionalFields,
      String? id,
      String? userName,
      String? salutation,
      String? name,
      String? gender,
      String? mobileNumber,
      String? emailId,
      String? altContactNumber,
      String? pan,
      String? aadhaarNumber,
      String? permanentAddress,
      String? permanentCity,
      String? permanentPinCode,
      String? correspondenceAddress,
      String? correspondenceCity,
      String? correspondencePinCode,
      String? alternatemobilenumber,
      bool? active,
      String? locale,
      String? type,
      bool? accountLocked,
      int? accountLockedDate,
      String? fatherOrHusbandName,
      String? relationship,
      String? signature,
      String? bloodGroup,
      String? photo,
      String? identificationMark,
      int? createdBy,
      String? lastModifiedBy,
      String? tenantId,
      List<String>? uuid,
      String? createdDate,
      bool? nonRecoverableError,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  UserAdditionalFieldsCopyWith<$R, UserAdditionalFields, UserAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid =>
      $value.uuid != null
          ? ListCopyWith($value.uuid!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(uuid: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? userName = $none,
          Object? salutation = $none,
          Object? name = $none,
          Object? gender = $none,
          Object? mobileNumber = $none,
          Object? emailId = $none,
          Object? altContactNumber = $none,
          Object? pan = $none,
          Object? aadhaarNumber = $none,
          Object? permanentAddress = $none,
          Object? permanentCity = $none,
          Object? permanentPinCode = $none,
          Object? correspondenceAddress = $none,
          Object? correspondenceCity = $none,
          Object? correspondencePinCode = $none,
          Object? alternatemobilenumber = $none,
          Object? active = $none,
          Object? locale = $none,
          Object? type = $none,
          Object? accountLocked = $none,
          Object? accountLockedDate = $none,
          Object? fatherOrHusbandName = $none,
          Object? relationship = $none,
          Object? signature = $none,
          Object? bloodGroup = $none,
          Object? photo = $none,
          Object? identificationMark = $none,
          Object? createdBy = $none,
          Object? lastModifiedBy = $none,
          Object? tenantId = $none,
          Object? uuid = $none,
          Object? createdDate = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (userName != $none) #userName: userName,
        if (salutation != $none) #salutation: salutation,
        if (name != $none) #name: name,
        if (gender != $none) #gender: gender,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (emailId != $none) #emailId: emailId,
        if (altContactNumber != $none) #altContactNumber: altContactNumber,
        if (pan != $none) #pan: pan,
        if (aadhaarNumber != $none) #aadhaarNumber: aadhaarNumber,
        if (permanentAddress != $none) #permanentAddress: permanentAddress,
        if (permanentCity != $none) #permanentCity: permanentCity,
        if (permanentPinCode != $none) #permanentPinCode: permanentPinCode,
        if (correspondenceAddress != $none)
          #correspondenceAddress: correspondenceAddress,
        if (correspondenceCity != $none)
          #correspondenceCity: correspondenceCity,
        if (correspondencePinCode != $none)
          #correspondencePinCode: correspondencePinCode,
        if (alternatemobilenumber != $none)
          #alternatemobilenumber: alternatemobilenumber,
        if (active != $none) #active: active,
        if (locale != $none) #locale: locale,
        if (type != $none) #type: type,
        if (accountLocked != $none) #accountLocked: accountLocked,
        if (accountLockedDate != $none) #accountLockedDate: accountLockedDate,
        if (fatherOrHusbandName != $none)
          #fatherOrHusbandName: fatherOrHusbandName,
        if (relationship != $none) #relationship: relationship,
        if (signature != $none) #signature: signature,
        if (bloodGroup != $none) #bloodGroup: bloodGroup,
        if (photo != $none) #photo: photo,
        if (identificationMark != $none)
          #identificationMark: identificationMark,
        if (createdBy != $none) #createdBy: createdBy,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (tenantId != $none) #tenantId: tenantId,
        if (uuid != $none) #uuid: uuid,
        if (createdDate != $none) #createdDate: createdDate,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      userName: data.get(#userName, or: $value.userName),
      salutation: data.get(#salutation, or: $value.salutation),
      name: data.get(#name, or: $value.name),
      gender: data.get(#gender, or: $value.gender),
      mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
      emailId: data.get(#emailId, or: $value.emailId),
      altContactNumber:
          data.get(#altContactNumber, or: $value.altContactNumber),
      pan: data.get(#pan, or: $value.pan),
      aadhaarNumber: data.get(#aadhaarNumber, or: $value.aadhaarNumber),
      permanentAddress:
          data.get(#permanentAddress, or: $value.permanentAddress),
      permanentCity: data.get(#permanentCity, or: $value.permanentCity),
      permanentPinCode:
          data.get(#permanentPinCode, or: $value.permanentPinCode),
      correspondenceAddress:
          data.get(#correspondenceAddress, or: $value.correspondenceAddress),
      correspondenceCity:
          data.get(#correspondenceCity, or: $value.correspondenceCity),
      correspondencePinCode:
          data.get(#correspondencePinCode, or: $value.correspondencePinCode),
      alternatemobilenumber:
          data.get(#alternatemobilenumber, or: $value.alternatemobilenumber),
      active: data.get(#active, or: $value.active),
      locale: data.get(#locale, or: $value.locale),
      type: data.get(#type, or: $value.type),
      accountLocked: data.get(#accountLocked, or: $value.accountLocked),
      accountLockedDate:
          data.get(#accountLockedDate, or: $value.accountLockedDate),
      fatherOrHusbandName:
          data.get(#fatherOrHusbandName, or: $value.fatherOrHusbandName),
      relationship: data.get(#relationship, or: $value.relationship),
      signature: data.get(#signature, or: $value.signature),
      bloodGroup: data.get(#bloodGroup, or: $value.bloodGroup),
      photo: data.get(#photo, or: $value.photo),
      identificationMark:
          data.get(#identificationMark, or: $value.identificationMark),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      uuid: data.get(#uuid, or: $value.uuid),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl($value, $cast, t);
}

class UserAdditionalFieldsMapper
    extends SubClassMapperBase<UserAdditionalFields> {
  UserAdditionalFieldsMapper._();

  static UserAdditionalFieldsMapper? _instance;
  static UserAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserAdditionalFields';

  static String _$schema(UserAdditionalFields v) => v.schema;
  static const Field<UserAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'User');
  static int _$version(UserAdditionalFields v) => v.version;
  static const Field<UserAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(UserAdditionalFields v) => v.fields;
  static const Field<UserAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<UserAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static UserAdditionalFields _instantiate(DecodingData data) {
    return UserAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static UserAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserAdditionalFields>(map);
  }

  static UserAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<UserAdditionalFields>(json);
  }
}

mixin UserAdditionalFieldsMappable {
  String toJson() {
    return UserAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<UserAdditionalFields>(this as UserAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return UserAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<UserAdditionalFields>(this as UserAdditionalFields);
  }

  UserAdditionalFieldsCopyWith<UserAdditionalFields, UserAdditionalFields,
          UserAdditionalFields>
      get copyWith => _UserAdditionalFieldsCopyWithImpl(
          this as UserAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return UserAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as UserAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as UserAdditionalFields, other));
  }

  @override
  int get hashCode {
    return UserAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as UserAdditionalFields);
  }
}

extension UserAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserAdditionalFields, $Out> {
  UserAdditionalFieldsCopyWith<$R, UserAdditionalFields, $Out>
      get $asUserAdditionalFields =>
          $base.as((v, t, t2) => _UserAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class UserAdditionalFieldsCopyWith<
    $R,
    $In extends UserAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  UserAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserAdditionalFields, $Out>
    implements UserAdditionalFieldsCopyWith<$R, UserAdditionalFields, $Out> {
  _UserAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserAdditionalFields> $mapper =
      UserAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  UserAdditionalFields $make(CopyWithData data) => UserAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  UserAdditionalFieldsCopyWith<$R2, UserAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UserAdditionalFieldsCopyWithImpl($value, $cast, t);
}
