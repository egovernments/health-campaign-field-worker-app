// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'household_member.dart';

class HouseholdMemberSearchModelMapper
    extends SubClassMapperBase<HouseholdMemberSearchModel> {
  HouseholdMemberSearchModelMapper._();

  static HouseholdMemberSearchModelMapper? _instance;
  static HouseholdMemberSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HouseholdMemberSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberSearchModel';

  static String? _$id(HouseholdMemberSearchModel v) => v.id;
  static const Field<HouseholdMemberSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$individualClientReferenceIds(
          HouseholdMemberSearchModel v) =>
      v.individualClientReferenceIds;
  static const Field<HouseholdMemberSearchModel, List<String>>
      _f$individualClientReferenceIds = Field(
          'individualClientReferenceIds', _$individualClientReferenceIds,
          opt: true);
  static List<String>? _$householdClientReferenceIds(
          HouseholdMemberSearchModel v) =>
      v.householdClientReferenceIds;
  static const Field<HouseholdMemberSearchModel, List<String>>
      _f$householdClientReferenceIds = Field(
          'householdClientReferenceIds', _$householdClientReferenceIds,
          opt: true);
  static String? _$householdId(HouseholdMemberSearchModel v) => v.householdId;
  static const Field<HouseholdMemberSearchModel, String> _f$householdId =
      Field('householdId', _$householdId, opt: true);
  static String? _$householdClientReferenceId(HouseholdMemberSearchModel v) =>
      v.householdClientReferenceId;
  static const Field<HouseholdMemberSearchModel, String>
      _f$householdClientReferenceId = Field(
          'householdClientReferenceId', _$householdClientReferenceId,
          opt: true);
  static String? _$individualId(HouseholdMemberSearchModel v) => v.individualId;
  static const Field<HouseholdMemberSearchModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$individualClientReferenceId(HouseholdMemberSearchModel v) =>
      v.individualClientReferenceId;
  static const Field<HouseholdMemberSearchModel, String>
      _f$individualClientReferenceId = Field(
          'individualClientReferenceId', _$individualClientReferenceId,
          opt: true);
  static bool? _$isHeadOfHousehold(HouseholdMemberSearchModel v) =>
      v.isHeadOfHousehold;
  static const Field<HouseholdMemberSearchModel, bool> _f$isHeadOfHousehold =
      Field('isHeadOfHousehold', _$isHeadOfHousehold, opt: true);
  static List<String>? _$clientReferenceId(HouseholdMemberSearchModel v) =>
      v.clientReferenceId;
  static const Field<HouseholdMemberSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(HouseholdMemberSearchModel v) => v.tenantId;
  static const Field<HouseholdMemberSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(HouseholdMemberSearchModel v) => v.boundaryCode;
  static const Field<HouseholdMemberSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HouseholdMemberSearchModel v) =>
      v.auditDetails;
  static const Field<HouseholdMemberSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(HouseholdMemberSearchModel v) =>
      v.additionalFields;
  static const Field<HouseholdMemberSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HouseholdMemberSearchModel> fields = const {
    #id: _f$id,
    #individualClientReferenceIds: _f$individualClientReferenceIds,
    #householdClientReferenceIds: _f$householdClientReferenceIds,
    #householdId: _f$householdId,
    #householdClientReferenceId: _f$householdClientReferenceId,
    #individualId: _f$individualId,
    #individualClientReferenceId: _f$individualClientReferenceId,
    #isHeadOfHousehold: _f$isHeadOfHousehold,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
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

  static HouseholdMemberSearchModel _instantiate(DecodingData data) {
    return HouseholdMemberSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        individualClientReferenceIds: data.dec(_f$individualClientReferenceIds),
        householdClientReferenceIds: data.dec(_f$householdClientReferenceIds),
        householdId: data.dec(_f$householdId),
        householdClientReferenceId: data.dec(_f$householdClientReferenceId),
        individualId: data.dec(_f$individualId),
        individualClientReferenceId: data.dec(_f$individualClientReferenceId),
        isHeadOfHousehold: data.dec(_f$isHeadOfHousehold),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdMemberSearchModel>(map);
  }

  static HouseholdMemberSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HouseholdMemberSearchModel>(json);
  }
}

mixin HouseholdMemberSearchModelMappable {
  String toJson() {
    return HouseholdMemberSearchModelMapper.ensureInitialized()
        .encodeJson<HouseholdMemberSearchModel>(
            this as HouseholdMemberSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberSearchModelMapper.ensureInitialized()
        .encodeMap<HouseholdMemberSearchModel>(
            this as HouseholdMemberSearchModel);
  }

  HouseholdMemberSearchModelCopyWith<HouseholdMemberSearchModel,
          HouseholdMemberSearchModel, HouseholdMemberSearchModel>
      get copyWith => _HouseholdMemberSearchModelCopyWithImpl(
          this as HouseholdMemberSearchModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdMemberSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdMemberSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HouseholdMemberSearchModel, other));
  }

  @override
  int get hashCode {
    return HouseholdMemberSearchModelMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberSearchModel);
  }
}

extension HouseholdMemberSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberSearchModel, $Out> {
  HouseholdMemberSearchModelCopyWith<$R, HouseholdMemberSearchModel, $Out>
      get $asHouseholdMemberSearchModel => $base
          .as((v, t, t2) => _HouseholdMemberSearchModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberSearchModelCopyWith<
    $R,
    $In extends HouseholdMemberSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get individualClientReferenceIds;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get householdClientReferenceIds;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      List<String>? individualClientReferenceIds,
      List<String>? householdClientReferenceIds,
      String? householdId,
      String? householdClientReferenceId,
      String? individualId,
      String? individualClientReferenceId,
      bool? isHeadOfHousehold,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  HouseholdMemberSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdMemberSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberSearchModel, $Out>
    implements
        HouseholdMemberSearchModelCopyWith<$R, HouseholdMemberSearchModel,
            $Out> {
  _HouseholdMemberSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberSearchModel> $mapper =
      HouseholdMemberSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get individualClientReferenceIds =>
          $value.individualClientReferenceIds != null
              ? ListCopyWith(
                  $value.individualClientReferenceIds!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(individualClientReferenceIds: v))
              : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get householdClientReferenceIds =>
          $value.householdClientReferenceIds != null
              ? ListCopyWith(
                  $value.householdClientReferenceIds!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(householdClientReferenceIds: v))
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
  $R call(
          {Object? id = $none,
          Object? individualClientReferenceIds = $none,
          Object? householdClientReferenceIds = $none,
          Object? householdId = $none,
          Object? householdClientReferenceId = $none,
          Object? individualId = $none,
          Object? individualClientReferenceId = $none,
          Object? isHeadOfHousehold = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (individualClientReferenceIds != $none)
          #individualClientReferenceIds: individualClientReferenceIds,
        if (householdClientReferenceIds != $none)
          #householdClientReferenceIds: householdClientReferenceIds,
        if (householdId != $none) #householdId: householdId,
        if (householdClientReferenceId != $none)
          #householdClientReferenceId: householdClientReferenceId,
        if (individualId != $none) #individualId: individualId,
        if (individualClientReferenceId != $none)
          #individualClientReferenceId: individualClientReferenceId,
        if (isHeadOfHousehold != $none) #isHeadOfHousehold: isHeadOfHousehold,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HouseholdMemberSearchModel $make(CopyWithData data) =>
      HouseholdMemberSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          individualClientReferenceIds: data.get(#individualClientReferenceIds,
              or: $value.individualClientReferenceIds),
          householdClientReferenceIds: data.get(#householdClientReferenceIds,
              or: $value.householdClientReferenceIds),
          householdId: data.get(#householdId, or: $value.householdId),
          householdClientReferenceId: data.get(#householdClientReferenceId,
              or: $value.householdClientReferenceId),
          individualId: data.get(#individualId, or: $value.individualId),
          individualClientReferenceId: data.get(#individualClientReferenceId,
              or: $value.individualClientReferenceId),
          isHeadOfHousehold:
              data.get(#isHeadOfHousehold, or: $value.isHeadOfHousehold),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HouseholdMemberSearchModelCopyWith<$R2, HouseholdMemberSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HouseholdMemberSearchModelCopyWithImpl($value, $cast, t);
}

class HouseholdMemberModelMapper
    extends SubClassMapperBase<HouseholdMemberModel> {
  HouseholdMemberModelMapper._();

  static HouseholdMemberModelMapper? _instance;
  static HouseholdMemberModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HouseholdMemberModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberModel';

  static HouseholdMemberAdditionalFields? _$additionalFields(
          HouseholdMemberModel v) =>
      v.additionalFields;
  static const Field<HouseholdMemberModel, HouseholdMemberAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(HouseholdMemberModel v) => v.id;
  static const Field<HouseholdMemberModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$householdId(HouseholdMemberModel v) => v.householdId;
  static const Field<HouseholdMemberModel, String> _f$householdId =
      Field('householdId', _$householdId, opt: true);
  static String? _$householdClientReferenceId(HouseholdMemberModel v) =>
      v.householdClientReferenceId;
  static const Field<HouseholdMemberModel, String>
      _f$householdClientReferenceId = Field(
          'householdClientReferenceId', _$householdClientReferenceId,
          opt: true);
  static String? _$individualId(HouseholdMemberModel v) => v.individualId;
  static const Field<HouseholdMemberModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$individualClientReferenceId(HouseholdMemberModel v) =>
      v.individualClientReferenceId;
  static const Field<HouseholdMemberModel, String>
      _f$individualClientReferenceId = Field(
          'individualClientReferenceId', _$individualClientReferenceId,
          opt: true);
  static bool _$isHeadOfHousehold(HouseholdMemberModel v) =>
      v.isHeadOfHousehold;
  static const Field<HouseholdMemberModel, bool> _f$isHeadOfHousehold =
      Field('isHeadOfHousehold', _$isHeadOfHousehold);
  static bool? _$nonRecoverableError(HouseholdMemberModel v) =>
      v.nonRecoverableError;
  static const Field<HouseholdMemberModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(HouseholdMemberModel v) =>
      v.clientReferenceId;
  static const Field<HouseholdMemberModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(HouseholdMemberModel v) => v.tenantId;
  static const Field<HouseholdMemberModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(HouseholdMemberModel v) => v.rowVersion;
  static const Field<HouseholdMemberModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(HouseholdMemberModel v) => v.auditDetails;
  static const Field<HouseholdMemberModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HouseholdMemberModel v) =>
      v.clientAuditDetails;
  static const Field<HouseholdMemberModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HouseholdMemberModel v) => v.isDeleted;
  static const Field<HouseholdMemberModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HouseholdMemberModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #householdId: _f$householdId,
    #householdClientReferenceId: _f$householdClientReferenceId,
    #individualId: _f$individualId,
    #individualClientReferenceId: _f$individualClientReferenceId,
    #isHeadOfHousehold: _f$isHeadOfHousehold,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
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

  static HouseholdMemberModel _instantiate(DecodingData data) {
    return HouseholdMemberModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        householdId: data.dec(_f$householdId),
        householdClientReferenceId: data.dec(_f$householdClientReferenceId),
        individualId: data.dec(_f$individualId),
        individualClientReferenceId: data.dec(_f$individualClientReferenceId),
        isHeadOfHousehold: data.dec(_f$isHeadOfHousehold),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdMemberModel>(map);
  }

  static HouseholdMemberModel fromJson(String json) {
    return ensureInitialized().decodeJson<HouseholdMemberModel>(json);
  }
}

mixin HouseholdMemberModelMappable {
  String toJson() {
    return HouseholdMemberModelMapper.ensureInitialized()
        .encodeJson<HouseholdMemberModel>(this as HouseholdMemberModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberModelMapper.ensureInitialized()
        .encodeMap<HouseholdMemberModel>(this as HouseholdMemberModel);
  }

  HouseholdMemberModelCopyWith<HouseholdMemberModel, HouseholdMemberModel,
          HouseholdMemberModel>
      get copyWith => _HouseholdMemberModelCopyWithImpl(
          this as HouseholdMemberModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdMemberModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdMemberModelMapper.ensureInitialized()
                .isValueEqual(this as HouseholdMemberModel, other));
  }

  @override
  int get hashCode {
    return HouseholdMemberModelMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberModel);
  }
}

extension HouseholdMemberModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberModel, $Out> {
  HouseholdMemberModelCopyWith<$R, HouseholdMemberModel, $Out>
      get $asHouseholdMemberModel =>
          $base.as((v, t, t2) => _HouseholdMemberModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberModelCopyWith<
    $R,
    $In extends HouseholdMemberModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  HouseholdMemberAdditionalFieldsCopyWith<$R, HouseholdMemberAdditionalFields,
      HouseholdMemberAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {HouseholdMemberAdditionalFields? additionalFields,
      String? id,
      String? householdId,
      String? householdClientReferenceId,
      String? individualId,
      String? individualClientReferenceId,
      bool? isHeadOfHousehold,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HouseholdMemberModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdMemberModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberModel, $Out>
    implements HouseholdMemberModelCopyWith<$R, HouseholdMemberModel, $Out> {
  _HouseholdMemberModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberModel> $mapper =
      HouseholdMemberModelMapper.ensureInitialized();
  @override
  HouseholdMemberAdditionalFieldsCopyWith<$R, HouseholdMemberAdditionalFields,
          HouseholdMemberAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
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
          Object? householdId = $none,
          Object? householdClientReferenceId = $none,
          Object? individualId = $none,
          Object? individualClientReferenceId = $none,
          bool? isHeadOfHousehold,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (householdId != $none) #householdId: householdId,
        if (householdClientReferenceId != $none)
          #householdClientReferenceId: householdClientReferenceId,
        if (individualId != $none) #individualId: individualId,
        if (individualClientReferenceId != $none)
          #individualClientReferenceId: individualClientReferenceId,
        if (isHeadOfHousehold != null) #isHeadOfHousehold: isHeadOfHousehold,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HouseholdMemberModel $make(CopyWithData data) => HouseholdMemberModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      householdId: data.get(#householdId, or: $value.householdId),
      householdClientReferenceId: data.get(#householdClientReferenceId,
          or: $value.householdClientReferenceId),
      individualId: data.get(#individualId, or: $value.individualId),
      individualClientReferenceId: data.get(#individualClientReferenceId,
          or: $value.individualClientReferenceId),
      isHeadOfHousehold:
          data.get(#isHeadOfHousehold, or: $value.isHeadOfHousehold),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HouseholdMemberModelCopyWith<$R2, HouseholdMemberModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HouseholdMemberModelCopyWithImpl($value, $cast, t);
}

class HouseholdMemberAdditionalFieldsMapper
    extends SubClassMapperBase<HouseholdMemberAdditionalFields> {
  HouseholdMemberAdditionalFieldsMapper._();

  static HouseholdMemberAdditionalFieldsMapper? _instance;
  static HouseholdMemberAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HouseholdMemberAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberAdditionalFields';

  static String _$schema(HouseholdMemberAdditionalFields v) => v.schema;
  static const Field<HouseholdMemberAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'HouseholdMember');
  static int _$version(HouseholdMemberAdditionalFields v) => v.version;
  static const Field<HouseholdMemberAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HouseholdMemberAdditionalFields v) =>
      v.fields;
  static const Field<HouseholdMemberAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HouseholdMemberAdditionalFields> fields = const {
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

  static HouseholdMemberAdditionalFields _instantiate(DecodingData data) {
    return HouseholdMemberAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdMemberAdditionalFields>(map);
  }

  static HouseholdMemberAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HouseholdMemberAdditionalFields>(json);
  }
}

mixin HouseholdMemberAdditionalFieldsMappable {
  String toJson() {
    return HouseholdMemberAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HouseholdMemberAdditionalFields>(
            this as HouseholdMemberAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HouseholdMemberAdditionalFields>(
            this as HouseholdMemberAdditionalFields);
  }

  HouseholdMemberAdditionalFieldsCopyWith<HouseholdMemberAdditionalFields,
          HouseholdMemberAdditionalFields, HouseholdMemberAdditionalFields>
      get copyWith => _HouseholdMemberAdditionalFieldsCopyWithImpl(
          this as HouseholdMemberAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HouseholdMemberAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HouseholdMemberAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as HouseholdMemberAdditionalFields, other));
  }

  @override
  int get hashCode {
    return HouseholdMemberAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberAdditionalFields);
  }
}

extension HouseholdMemberAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberAdditionalFields, $Out> {
  HouseholdMemberAdditionalFieldsCopyWith<$R, HouseholdMemberAdditionalFields,
          $Out>
      get $asHouseholdMemberAdditionalFields => $base.as(
          (v, t, t2) => _HouseholdMemberAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberAdditionalFieldsCopyWith<
    $R,
    $In extends HouseholdMemberAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HouseholdMemberAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdMemberAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberAdditionalFields, $Out>
    implements
        HouseholdMemberAdditionalFieldsCopyWith<$R,
            HouseholdMemberAdditionalFields, $Out> {
  _HouseholdMemberAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberAdditionalFields> $mapper =
      HouseholdMemberAdditionalFieldsMapper.ensureInitialized();
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
  HouseholdMemberAdditionalFields $make(CopyWithData data) =>
      HouseholdMemberAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HouseholdMemberAdditionalFieldsCopyWith<$R2, HouseholdMemberAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HouseholdMemberAdditionalFieldsCopyWithImpl($value, $cast, t);
}
