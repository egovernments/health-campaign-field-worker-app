// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'individual.dart';

class IndividualSearchModelMapper
    extends SubClassMapperBase<IndividualSearchModel> {
  IndividualSearchModelMapper._();

  static IndividualSearchModelMapper? _instance;
  static IndividualSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IndividualSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IndividualSearchModel';

  static List<String>? _$id(IndividualSearchModel v) => v.id;
  static const Field<IndividualSearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$userUuid(IndividualSearchModel v) => v.userUuid;
  static const Field<IndividualSearchModel, List<String>> _f$userUuid =
      Field('userUuid', _$userUuid, opt: true);
  static String? _$dateOfBirth(IndividualSearchModel v) => v.dateOfBirth;
  static const Field<IndividualSearchModel, String> _f$dateOfBirth =
      Field('dateOfBirth', _$dateOfBirth, opt: true);
  static int? _$limit(IndividualSearchModel v) => v.limit;
  static const Field<IndividualSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$offset(IndividualSearchModel v) => v.offset;
  static const Field<IndividualSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static List<String>? _$clientReferenceId(IndividualSearchModel v) =>
      v.clientReferenceId;
  static const Field<IndividualSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(IndividualSearchModel v) => v.tenantId;
  static const Field<IndividualSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static NameSearchModel? _$name(IndividualSearchModel v) => v.name;
  static const Field<IndividualSearchModel, NameSearchModel> _f$name =
      Field('name', _$name, opt: true);
  static Gender? _$gender(IndividualSearchModel v) => v.gender;
  static const Field<IndividualSearchModel, Gender> _f$gender =
      Field('gender', _$gender, opt: true);
  static List<IdentifierSearchModel>? _$identifiers(IndividualSearchModel v) =>
      v.identifiers;
  static const Field<IndividualSearchModel, List<IdentifierSearchModel>>
      _f$identifiers = Field('identifiers', _$identifiers, opt: true);
  static String? _$boundaryCode(IndividualSearchModel v) => v.boundaryCode;
  static const Field<IndividualSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(IndividualSearchModel v) =>
      v.auditDetails;
  static const Field<IndividualSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(IndividualSearchModel v) =>
      v.additionalFields;
  static const Field<IndividualSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<IndividualSearchModel> fields = const {
    #id: _f$id,
    #userUuid: _f$userUuid,
    #dateOfBirth: _f$dateOfBirth,
    #limit: _f$limit,
    #offset: _f$offset,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #name: _f$name,
    #gender: _f$gender,
    #identifiers: _f$identifiers,
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

  static IndividualSearchModel _instantiate(DecodingData data) {
    return IndividualSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        userUuid: data.dec(_f$userUuid),
        dateOfBirth: data.dec(_f$dateOfBirth),
        limit: data.dec(_f$limit),
        offset: data.dec(_f$offset),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        name: data.dec(_f$name),
        gender: data.dec(_f$gender),
        identifiers: data.dec(_f$identifiers),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static IndividualSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IndividualSearchModel>(map);
  }

  static IndividualSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<IndividualSearchModel>(json);
  }
}

mixin IndividualSearchModelMappable {
  String toJson() {
    return IndividualSearchModelMapper.ensureInitialized()
        .encodeJson<IndividualSearchModel>(this as IndividualSearchModel);
  }

  Map<String, dynamic> toMap() {
    return IndividualSearchModelMapper.ensureInitialized()
        .encodeMap<IndividualSearchModel>(this as IndividualSearchModel);
  }

  IndividualSearchModelCopyWith<IndividualSearchModel, IndividualSearchModel,
          IndividualSearchModel>
      get copyWith => _IndividualSearchModelCopyWithImpl(
          this as IndividualSearchModel, $identity, $identity);
  @override
  String toString() {
    return IndividualSearchModelMapper.ensureInitialized()
        .stringifyValue(this as IndividualSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IndividualSearchModelMapper.ensureInitialized()
                .isValueEqual(this as IndividualSearchModel, other));
  }

  @override
  int get hashCode {
    return IndividualSearchModelMapper.ensureInitialized()
        .hashValue(this as IndividualSearchModel);
  }
}

extension IndividualSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IndividualSearchModel, $Out> {
  IndividualSearchModelCopyWith<$R, IndividualSearchModel, $Out>
      get $asIndividualSearchModel =>
          $base.as((v, t, t2) => _IndividualSearchModelCopyWithImpl(v, t, t2));
}

abstract class IndividualSearchModelCopyWith<
    $R,
    $In extends IndividualSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get userUuid;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  NameSearchModelCopyWith<$R, NameSearchModel, NameSearchModel>? get name;
  ListCopyWith<
      $R,
      IdentifierSearchModel,
      IdentifierSearchModelCopyWith<$R, IdentifierSearchModel,
          IdentifierSearchModel>>? get identifiers;
  @override
  $R call(
      {List<String>? id,
      List<String>? userUuid,
      String? dateOfBirth,
      int? limit,
      int? offset,
      List<String>? clientReferenceId,
      String? tenantId,
      NameSearchModel? name,
      Gender? gender,
      List<IdentifierSearchModel>? identifiers,
      String? boundaryCode});
  IndividualSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IndividualSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IndividualSearchModel, $Out>
    implements IndividualSearchModelCopyWith<$R, IndividualSearchModel, $Out> {
  _IndividualSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IndividualSearchModel> $mapper =
      IndividualSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get userUuid =>
      $value.userUuid != null
          ? ListCopyWith(
              $value.userUuid!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(userUuid: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  NameSearchModelCopyWith<$R, NameSearchModel, NameSearchModel>? get name =>
      $value.name?.copyWith.$chain((v) => call(name: v));
  @override
  ListCopyWith<
      $R,
      IdentifierSearchModel,
      IdentifierSearchModelCopyWith<$R, IdentifierSearchModel,
          IdentifierSearchModel>>? get identifiers => $value.identifiers != null
      ? ListCopyWith($value.identifiers!, (v, t) => v.copyWith.$chain(t),
          (v) => call(identifiers: v))
      : null;
  @override
  $R call(
          {Object? id = $none,
          Object? userUuid = $none,
          Object? dateOfBirth = $none,
          Object? limit = $none,
          Object? offset = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? name = $none,
          Object? gender = $none,
          Object? identifiers = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userUuid != $none) #userUuid: userUuid,
        if (dateOfBirth != $none) #dateOfBirth: dateOfBirth,
        if (limit != $none) #limit: limit,
        if (offset != $none) #offset: offset,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (name != $none) #name: name,
        if (gender != $none) #gender: gender,
        if (identifiers != $none) #identifiers: identifiers,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  IndividualSearchModel $make(CopyWithData data) =>
      IndividualSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          userUuid: data.get(#userUuid, or: $value.userUuid),
          dateOfBirth: data.get(#dateOfBirth, or: $value.dateOfBirth),
          limit: data.get(#limit, or: $value.limit),
          offset: data.get(#offset, or: $value.offset),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          name: data.get(#name, or: $value.name),
          gender: data.get(#gender, or: $value.gender),
          identifiers: data.get(#identifiers, or: $value.identifiers),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  IndividualSearchModelCopyWith<$R2, IndividualSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IndividualSearchModelCopyWithImpl($value, $cast, t);
}

class IndividualModelMapper extends SubClassMapperBase<IndividualModel> {
  IndividualModelMapper._();

  static IndividualModelMapper? _instance;
  static IndividualModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IndividualModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IndividualModel';

  static IndividualAdditionalFields? _$additionalFields(IndividualModel v) =>
      v.additionalFields;
  static const Field<IndividualModel, IndividualAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(IndividualModel v) => v.id;
  static const Field<IndividualModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$individualId(IndividualModel v) => v.individualId;
  static const Field<IndividualModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$userId(IndividualModel v) => v.userId;
  static const Field<IndividualModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static String? _$userUuid(IndividualModel v) => v.userUuid;
  static const Field<IndividualModel, String> _f$userUuid =
      Field('userUuid', _$userUuid, opt: true);
  static String? _$dateOfBirth(IndividualModel v) => v.dateOfBirth;
  static const Field<IndividualModel, String> _f$dateOfBirth =
      Field('dateOfBirth', _$dateOfBirth, opt: true);
  static String? _$mobileNumber(IndividualModel v) => v.mobileNumber;
  static const Field<IndividualModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static String? _$altContactNumber(IndividualModel v) => v.altContactNumber;
  static const Field<IndividualModel, String> _f$altContactNumber =
      Field('altContactNumber', _$altContactNumber, opt: true);
  static String? _$email(IndividualModel v) => v.email;
  static const Field<IndividualModel, String> _f$email =
      Field('email', _$email, opt: true);
  static String? _$fatherName(IndividualModel v) => v.fatherName;
  static const Field<IndividualModel, String> _f$fatherName =
      Field('fatherName', _$fatherName, opt: true);
  static String? _$husbandName(IndividualModel v) => v.husbandName;
  static const Field<IndividualModel, String> _f$husbandName =
      Field('husbandName', _$husbandName, opt: true);
  static String? _$photo(IndividualModel v) => v.photo;
  static const Field<IndividualModel, String> _f$photo =
      Field('photo', _$photo, opt: true);
  static bool? _$nonRecoverableError(IndividualModel v) =>
      v.nonRecoverableError;
  static const Field<IndividualModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(IndividualModel v) => v.clientReferenceId;
  static const Field<IndividualModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(IndividualModel v) => v.tenantId;
  static const Field<IndividualModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(IndividualModel v) => v.rowVersion;
  static const Field<IndividualModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static NameModel? _$name(IndividualModel v) => v.name;
  static const Field<IndividualModel, NameModel> _f$name =
      Field('name', _$name, opt: true);
  static BloodGroup? _$bloodGroup(IndividualModel v) => v.bloodGroup;
  static const Field<IndividualModel, BloodGroup> _f$bloodGroup =
      Field('bloodGroup', _$bloodGroup, opt: true);
  static List<AddressModel>? _$address(IndividualModel v) => v.address;
  static const Field<IndividualModel, List<AddressModel>> _f$address =
      Field('address', _$address, opt: true);
  static Gender? _$gender(IndividualModel v) => v.gender;
  static const Field<IndividualModel, Gender> _f$gender =
      Field('gender', _$gender, opt: true);
  static List<IdentifierModel>? _$identifiers(IndividualModel v) =>
      v.identifiers;
  static const Field<IndividualModel, List<IdentifierModel>> _f$identifiers =
      Field('identifiers', _$identifiers, opt: true);
  static AuditDetails? _$auditDetails(IndividualModel v) => v.auditDetails;
  static const Field<IndividualModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(IndividualModel v) =>
      v.clientAuditDetails;
  static const Field<IndividualModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(IndividualModel v) => v.isDeleted;
  static const Field<IndividualModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<IndividualModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #individualId: _f$individualId,
    #userId: _f$userId,
    #userUuid: _f$userUuid,
    #dateOfBirth: _f$dateOfBirth,
    #mobileNumber: _f$mobileNumber,
    #altContactNumber: _f$altContactNumber,
    #email: _f$email,
    #fatherName: _f$fatherName,
    #husbandName: _f$husbandName,
    #photo: _f$photo,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #name: _f$name,
    #bloodGroup: _f$bloodGroup,
    #address: _f$address,
    #gender: _f$gender,
    #identifiers: _f$identifiers,
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

  static IndividualModel _instantiate(DecodingData data) {
    return IndividualModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        individualId: data.dec(_f$individualId),
        userId: data.dec(_f$userId),
        userUuid: data.dec(_f$userUuid),
        dateOfBirth: data.dec(_f$dateOfBirth),
        mobileNumber: data.dec(_f$mobileNumber),
        altContactNumber: data.dec(_f$altContactNumber),
        email: data.dec(_f$email),
        fatherName: data.dec(_f$fatherName),
        husbandName: data.dec(_f$husbandName),
        photo: data.dec(_f$photo),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        name: data.dec(_f$name),
        bloodGroup: data.dec(_f$bloodGroup),
        address: data.dec(_f$address),
        gender: data.dec(_f$gender),
        identifiers: data.dec(_f$identifiers),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static IndividualModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IndividualModel>(map);
  }

  static IndividualModel fromJson(String json) {
    return ensureInitialized().decodeJson<IndividualModel>(json);
  }
}

mixin IndividualModelMappable {
  String toJson() {
    return IndividualModelMapper.ensureInitialized()
        .encodeJson<IndividualModel>(this as IndividualModel);
  }

  Map<String, dynamic> toMap() {
    return IndividualModelMapper.ensureInitialized()
        .encodeMap<IndividualModel>(this as IndividualModel);
  }

  IndividualModelCopyWith<IndividualModel, IndividualModel, IndividualModel>
      get copyWith => _IndividualModelCopyWithImpl(
          this as IndividualModel, $identity, $identity);
  @override
  String toString() {
    return IndividualModelMapper.ensureInitialized()
        .stringifyValue(this as IndividualModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IndividualModelMapper.ensureInitialized()
                .isValueEqual(this as IndividualModel, other));
  }

  @override
  int get hashCode {
    return IndividualModelMapper.ensureInitialized()
        .hashValue(this as IndividualModel);
  }
}

extension IndividualModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IndividualModel, $Out> {
  IndividualModelCopyWith<$R, IndividualModel, $Out> get $asIndividualModel =>
      $base.as((v, t, t2) => _IndividualModelCopyWithImpl(v, t, t2));
}

abstract class IndividualModelCopyWith<$R, $In extends IndividualModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  IndividualAdditionalFieldsCopyWith<$R, IndividualAdditionalFields,
      IndividualAdditionalFields>? get additionalFields;
  NameModelCopyWith<$R, NameModel, NameModel>? get name;
  ListCopyWith<$R, AddressModel,
      AddressModelCopyWith<$R, AddressModel, AddressModel>>? get address;
  ListCopyWith<$R, IdentifierModel,
          IdentifierModelCopyWith<$R, IdentifierModel, IdentifierModel>>?
      get identifiers;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {IndividualAdditionalFields? additionalFields,
      String? id,
      String? individualId,
      String? userId,
      String? userUuid,
      String? dateOfBirth,
      String? mobileNumber,
      String? altContactNumber,
      String? email,
      String? fatherName,
      String? husbandName,
      String? photo,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      NameModel? name,
      BloodGroup? bloodGroup,
      List<AddressModel>? address,
      Gender? gender,
      List<IdentifierModel>? identifiers,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  IndividualModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IndividualModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IndividualModel, $Out>
    implements IndividualModelCopyWith<$R, IndividualModel, $Out> {
  _IndividualModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IndividualModel> $mapper =
      IndividualModelMapper.ensureInitialized();
  @override
  IndividualAdditionalFieldsCopyWith<$R, IndividualAdditionalFields,
          IndividualAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  NameModelCopyWith<$R, NameModel, NameModel>? get name =>
      $value.name?.copyWith.$chain((v) => call(name: v));
  @override
  ListCopyWith<$R, AddressModel,
          AddressModelCopyWith<$R, AddressModel, AddressModel>>?
      get address => $value.address != null
          ? ListCopyWith($value.address!, (v, t) => v.copyWith.$chain(t),
              (v) => call(address: v))
          : null;
  @override
  ListCopyWith<$R, IdentifierModel,
          IdentifierModelCopyWith<$R, IdentifierModel, IdentifierModel>>?
      get identifiers => $value.identifiers != null
          ? ListCopyWith($value.identifiers!, (v, t) => v.copyWith.$chain(t),
              (v) => call(identifiers: v))
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
          Object? individualId = $none,
          Object? userId = $none,
          Object? userUuid = $none,
          Object? dateOfBirth = $none,
          Object? mobileNumber = $none,
          Object? altContactNumber = $none,
          Object? email = $none,
          Object? fatherName = $none,
          Object? husbandName = $none,
          Object? photo = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? name = $none,
          Object? bloodGroup = $none,
          Object? address = $none,
          Object? gender = $none,
          Object? identifiers = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (individualId != $none) #individualId: individualId,
        if (userId != $none) #userId: userId,
        if (userUuid != $none) #userUuid: userUuid,
        if (dateOfBirth != $none) #dateOfBirth: dateOfBirth,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (altContactNumber != $none) #altContactNumber: altContactNumber,
        if (email != $none) #email: email,
        if (fatherName != $none) #fatherName: fatherName,
        if (husbandName != $none) #husbandName: husbandName,
        if (photo != $none) #photo: photo,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (name != $none) #name: name,
        if (bloodGroup != $none) #bloodGroup: bloodGroup,
        if (address != $none) #address: address,
        if (gender != $none) #gender: gender,
        if (identifiers != $none) #identifiers: identifiers,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  IndividualModel $make(CopyWithData data) => IndividualModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      individualId: data.get(#individualId, or: $value.individualId),
      userId: data.get(#userId, or: $value.userId),
      userUuid: data.get(#userUuid, or: $value.userUuid),
      dateOfBirth: data.get(#dateOfBirth, or: $value.dateOfBirth),
      mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
      altContactNumber:
          data.get(#altContactNumber, or: $value.altContactNumber),
      email: data.get(#email, or: $value.email),
      fatherName: data.get(#fatherName, or: $value.fatherName),
      husbandName: data.get(#husbandName, or: $value.husbandName),
      photo: data.get(#photo, or: $value.photo),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      name: data.get(#name, or: $value.name),
      bloodGroup: data.get(#bloodGroup, or: $value.bloodGroup),
      address: data.get(#address, or: $value.address),
      gender: data.get(#gender, or: $value.gender),
      identifiers: data.get(#identifiers, or: $value.identifiers),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  IndividualModelCopyWith<$R2, IndividualModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IndividualModelCopyWithImpl($value, $cast, t);
}

class IndividualAdditionalFieldsMapper
    extends SubClassMapperBase<IndividualAdditionalFields> {
  IndividualAdditionalFieldsMapper._();

  static IndividualAdditionalFieldsMapper? _instance;
  static IndividualAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = IndividualAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IndividualAdditionalFields';

  static String _$schema(IndividualAdditionalFields v) => v.schema;
  static const Field<IndividualAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Individual');
  static int _$version(IndividualAdditionalFields v) => v.version;
  static const Field<IndividualAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(IndividualAdditionalFields v) =>
      v.fields;
  static const Field<IndividualAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<IndividualAdditionalFields> fields = const {
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

  static IndividualAdditionalFields _instantiate(DecodingData data) {
    return IndividualAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static IndividualAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IndividualAdditionalFields>(map);
  }

  static IndividualAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<IndividualAdditionalFields>(json);
  }
}

mixin IndividualAdditionalFieldsMappable {
  String toJson() {
    return IndividualAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<IndividualAdditionalFields>(
            this as IndividualAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return IndividualAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<IndividualAdditionalFields>(
            this as IndividualAdditionalFields);
  }

  IndividualAdditionalFieldsCopyWith<IndividualAdditionalFields,
          IndividualAdditionalFields, IndividualAdditionalFields>
      get copyWith => _IndividualAdditionalFieldsCopyWithImpl(
          this as IndividualAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return IndividualAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as IndividualAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IndividualAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as IndividualAdditionalFields, other));
  }

  @override
  int get hashCode {
    return IndividualAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as IndividualAdditionalFields);
  }
}

extension IndividualAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IndividualAdditionalFields, $Out> {
  IndividualAdditionalFieldsCopyWith<$R, IndividualAdditionalFields, $Out>
      get $asIndividualAdditionalFields => $base
          .as((v, t, t2) => _IndividualAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class IndividualAdditionalFieldsCopyWith<
    $R,
    $In extends IndividualAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  IndividualAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IndividualAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IndividualAdditionalFields, $Out>
    implements
        IndividualAdditionalFieldsCopyWith<$R, IndividualAdditionalFields,
            $Out> {
  _IndividualAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IndividualAdditionalFields> $mapper =
      IndividualAdditionalFieldsMapper.ensureInitialized();
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
  IndividualAdditionalFields $make(CopyWithData data) =>
      IndividualAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  IndividualAdditionalFieldsCopyWith<$R2, IndividualAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IndividualAdditionalFieldsCopyWithImpl($value, $cast, t);
}
