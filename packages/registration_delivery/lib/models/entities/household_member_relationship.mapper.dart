// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'household_member_relationship.dart';

class HouseholdMemberRelationShipSearchModelMapper
    extends SubClassMapperBase<HouseholdMemberRelationShipSearchModel> {
  HouseholdMemberRelationShipSearchModelMapper._();

  static HouseholdMemberRelationShipSearchModelMapper? _instance;
  static HouseholdMemberRelationShipSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HouseholdMemberRelationShipSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberRelationShipSearchModel';

  static String? _$id(HouseholdMemberRelationShipSearchModel v) => v.id;
  static const Field<HouseholdMemberRelationShipSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$selfId(HouseholdMemberRelationShipSearchModel v) => v.selfId;
  static const Field<HouseholdMemberRelationShipSearchModel, String> _f$selfId =
      Field('selfId', _$selfId, opt: true);
  static String? _$selfIdClientReferenceId(
          HouseholdMemberRelationShipSearchModel v) =>
      v.selfIdClientReferenceId;
  static const Field<HouseholdMemberRelationShipSearchModel, String>
      _f$selfIdClientReferenceId =
      Field('selfIdClientReferenceId', _$selfIdClientReferenceId, opt: true);
  static String? _$relativeId(HouseholdMemberRelationShipSearchModel v) =>
      v.relativeId;
  static const Field<HouseholdMemberRelationShipSearchModel, String>
      _f$relativeId = Field('relativeId', _$relativeId, opt: true);
  static String? _$relativeClientReferenceId(
          HouseholdMemberRelationShipSearchModel v) =>
      v.relativeClientReferenceId;
  static const Field<HouseholdMemberRelationShipSearchModel, String>
      _f$relativeClientReferenceId = Field(
          'relativeClientReferenceId', _$relativeClientReferenceId,
          opt: true);
  static String? _$relationshipType(HouseholdMemberRelationShipSearchModel v) =>
      v.relationshipType;
  static const Field<HouseholdMemberRelationShipSearchModel, String>
      _f$relationshipType =
      Field('relationshipType', _$relationshipType, opt: true);
  static List<String>? _$clientReferenceIds(
          HouseholdMemberRelationShipSearchModel v) =>
      v.clientReferenceIds;
  static const Field<HouseholdMemberRelationShipSearchModel, List<String>>
      _f$clientReferenceIds =
      Field('clientReferenceIds', _$clientReferenceIds, opt: true);
  static String? _$boundaryCode(HouseholdMemberRelationShipSearchModel v) =>
      v.boundaryCode;
  static const Field<HouseholdMemberRelationShipSearchModel, String>
      _f$boundaryCode = Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(
          HouseholdMemberRelationShipSearchModel v) =>
      v.auditDetails;
  static const Field<HouseholdMemberRelationShipSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          HouseholdMemberRelationShipSearchModel v) =>
      v.additionalFields;
  static const Field<HouseholdMemberRelationShipSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HouseholdMemberRelationShipSearchModel> fields = const {
    #id: _f$id,
    #selfId: _f$selfId,
    #selfIdClientReferenceId: _f$selfIdClientReferenceId,
    #relativeId: _f$relativeId,
    #relativeClientReferenceId: _f$relativeClientReferenceId,
    #relationshipType: _f$relationshipType,
    #clientReferenceIds: _f$clientReferenceIds,
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

  static HouseholdMemberRelationShipSearchModel _instantiate(
      DecodingData data) {
    return HouseholdMemberRelationShipSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        selfId: data.dec(_f$selfId),
        selfIdClientReferenceId: data.dec(_f$selfIdClientReferenceId),
        relativeId: data.dec(_f$relativeId),
        relativeClientReferenceId: data.dec(_f$relativeClientReferenceId),
        relationshipType: data.dec(_f$relationshipType),
        clientReferenceIds: data.dec(_f$clientReferenceIds),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberRelationShipSearchModel fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<HouseholdMemberRelationShipSearchModel>(map);
  }

  static HouseholdMemberRelationShipSearchModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HouseholdMemberRelationShipSearchModel>(json);
  }
}

mixin HouseholdMemberRelationShipSearchModelMappable {
  String toJson() {
    return HouseholdMemberRelationShipSearchModelMapper.ensureInitialized()
        .encodeJson<HouseholdMemberRelationShipSearchModel>(
            this as HouseholdMemberRelationShipSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberRelationShipSearchModelMapper.ensureInitialized()
        .encodeMap<HouseholdMemberRelationShipSearchModel>(
            this as HouseholdMemberRelationShipSearchModel);
  }

  HouseholdMemberRelationShipSearchModelCopyWith<
          HouseholdMemberRelationShipSearchModel,
          HouseholdMemberRelationShipSearchModel,
          HouseholdMemberRelationShipSearchModel>
      get copyWith => _HouseholdMemberRelationShipSearchModelCopyWithImpl(
          this as HouseholdMemberRelationShipSearchModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdMemberRelationShipSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberRelationShipSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return HouseholdMemberRelationShipSearchModelMapper.ensureInitialized()
        .equalsValue(this as HouseholdMemberRelationShipSearchModel, other);
  }

  @override
  int get hashCode {
    return HouseholdMemberRelationShipSearchModelMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberRelationShipSearchModel);
  }
}

extension HouseholdMemberRelationShipSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberRelationShipSearchModel, $Out> {
  HouseholdMemberRelationShipSearchModelCopyWith<$R,
          HouseholdMemberRelationShipSearchModel, $Out>
      get $asHouseholdMemberRelationShipSearchModel => $base.as((v, t, t2) =>
          _HouseholdMemberRelationShipSearchModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberRelationShipSearchModelCopyWith<
    $R,
    $In extends HouseholdMemberRelationShipSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceIds;
  @override
  $R call(
      {String? id,
      String? selfId,
      String? selfIdClientReferenceId,
      String? relativeId,
      String? relativeClientReferenceId,
      String? relationshipType,
      List<String>? clientReferenceIds,
      String? boundaryCode});
  HouseholdMemberRelationShipSearchModelCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HouseholdMemberRelationShipSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberRelationShipSearchModel, $Out>
    implements
        HouseholdMemberRelationShipSearchModelCopyWith<$R,
            HouseholdMemberRelationShipSearchModel, $Out> {
  _HouseholdMemberRelationShipSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberRelationShipSearchModel> $mapper =
      HouseholdMemberRelationShipSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceIds => $value.clientReferenceIds != null
          ? ListCopyWith(
              $value.clientReferenceIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceIds: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? selfId = $none,
          Object? selfIdClientReferenceId = $none,
          Object? relativeId = $none,
          Object? relativeClientReferenceId = $none,
          Object? relationshipType = $none,
          Object? clientReferenceIds = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (selfId != $none) #selfId: selfId,
        if (selfIdClientReferenceId != $none)
          #selfIdClientReferenceId: selfIdClientReferenceId,
        if (relativeId != $none) #relativeId: relativeId,
        if (relativeClientReferenceId != $none)
          #relativeClientReferenceId: relativeClientReferenceId,
        if (relationshipType != $none) #relationshipType: relationshipType,
        if (clientReferenceIds != $none)
          #clientReferenceIds: clientReferenceIds,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HouseholdMemberRelationShipSearchModel $make(CopyWithData data) =>
      HouseholdMemberRelationShipSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          selfId: data.get(#selfId, or: $value.selfId),
          selfIdClientReferenceId: data.get(#selfIdClientReferenceId,
              or: $value.selfIdClientReferenceId),
          relativeId: data.get(#relativeId, or: $value.relativeId),
          relativeClientReferenceId: data.get(#relativeClientReferenceId,
              or: $value.relativeClientReferenceId),
          relationshipType:
              data.get(#relationshipType, or: $value.relationshipType),
          clientReferenceIds:
              data.get(#clientReferenceIds, or: $value.clientReferenceIds),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HouseholdMemberRelationShipSearchModelCopyWith<$R2,
      HouseholdMemberRelationShipSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HouseholdMemberRelationShipSearchModelCopyWithImpl($value, $cast, t);
}

class HouseholdMemberRelationShipModelMapper
    extends SubClassMapperBase<HouseholdMemberRelationShipModel> {
  HouseholdMemberRelationShipModelMapper._();

  static HouseholdMemberRelationShipModelMapper? _instance;
  static HouseholdMemberRelationShipModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HouseholdMemberRelationShipModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberRelationShipModel';

  static HouseholdMemberRelationShipAdditionalFields? _$additionalFields(
          HouseholdMemberRelationShipModel v) =>
      v.additionalFields;
  static const Field<HouseholdMemberRelationShipModel,
          HouseholdMemberRelationShipAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(HouseholdMemberRelationShipModel v) => v.id;
  static const Field<HouseholdMemberRelationShipModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$selfId(HouseholdMemberRelationShipModel v) => v.selfId;
  static const Field<HouseholdMemberRelationShipModel, String> _f$selfId =
      Field('selfId', _$selfId, opt: true);
  static String? _$selfClientReferenceId(HouseholdMemberRelationShipModel v) =>
      v.selfClientReferenceId;
  static const Field<HouseholdMemberRelationShipModel, String>
      _f$selfClientReferenceId =
      Field('selfClientReferenceId', _$selfClientReferenceId, opt: true);
  static String _$clientReferenceId(HouseholdMemberRelationShipModel v) =>
      v.clientReferenceId;
  static const Field<HouseholdMemberRelationShipModel, String>
      _f$clientReferenceId = Field('clientReferenceId', _$clientReferenceId);
  static String? _$relativeId(HouseholdMemberRelationShipModel v) =>
      v.relativeId;
  static const Field<HouseholdMemberRelationShipModel, String> _f$relativeId =
      Field('relativeId', _$relativeId, opt: true);
  static String? _$relativeClientReferenceId(
          HouseholdMemberRelationShipModel v) =>
      v.relativeClientReferenceId;
  static const Field<HouseholdMemberRelationShipModel, String>
      _f$relativeClientReferenceId = Field(
          'relativeClientReferenceId', _$relativeClientReferenceId,
          opt: true);
  static String? _$relationshipType(HouseholdMemberRelationShipModel v) =>
      v.relationshipType;
  static const Field<HouseholdMemberRelationShipModel, String>
      _f$relationshipType =
      Field('relationshipType', _$relationshipType, opt: true);
  static int? _$rowVersion(HouseholdMemberRelationShipModel v) => v.rowVersion;
  static const Field<HouseholdMemberRelationShipModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$tenantId(HouseholdMemberRelationShipModel v) => v.tenantId;
  static const Field<HouseholdMemberRelationShipModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static AuditDetails? _$auditDetails(HouseholdMemberRelationShipModel v) =>
      v.auditDetails;
  static const Field<HouseholdMemberRelationShipModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(
          HouseholdMemberRelationShipModel v) =>
      v.clientAuditDetails;
  static const Field<HouseholdMemberRelationShipModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HouseholdMemberRelationShipModel v) => v.isDeleted;
  static const Field<HouseholdMemberRelationShipModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HouseholdMemberRelationShipModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #selfId: _f$selfId,
    #selfClientReferenceId: _f$selfClientReferenceId,
    #clientReferenceId: _f$clientReferenceId,
    #relativeId: _f$relativeId,
    #relativeClientReferenceId: _f$relativeClientReferenceId,
    #relationshipType: _f$relationshipType,
    #rowVersion: _f$rowVersion,
    #tenantId: _f$tenantId,
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

  static HouseholdMemberRelationShipModel _instantiate(DecodingData data) {
    return HouseholdMemberRelationShipModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        selfId: data.dec(_f$selfId),
        selfClientReferenceId: data.dec(_f$selfClientReferenceId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        relativeId: data.dec(_f$relativeId),
        relativeClientReferenceId: data.dec(_f$relativeClientReferenceId),
        relationshipType: data.dec(_f$relationshipType),
        rowVersion: data.dec(_f$rowVersion),
        tenantId: data.dec(_f$tenantId),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberRelationShipModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HouseholdMemberRelationShipModel>(map);
  }

  static HouseholdMemberRelationShipModel fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HouseholdMemberRelationShipModel>(json);
  }
}

mixin HouseholdMemberRelationShipModelMappable {
  String toJson() {
    return HouseholdMemberRelationShipModelMapper.ensureInitialized()
        .encodeJson<HouseholdMemberRelationShipModel>(
            this as HouseholdMemberRelationShipModel);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberRelationShipModelMapper.ensureInitialized()
        .encodeMap<HouseholdMemberRelationShipModel>(
            this as HouseholdMemberRelationShipModel);
  }

  HouseholdMemberRelationShipModelCopyWith<HouseholdMemberRelationShipModel,
          HouseholdMemberRelationShipModel, HouseholdMemberRelationShipModel>
      get copyWith => _HouseholdMemberRelationShipModelCopyWithImpl(
          this as HouseholdMemberRelationShipModel, $identity, $identity);
  @override
  String toString() {
    return HouseholdMemberRelationShipModelMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberRelationShipModel);
  }

  @override
  bool operator ==(Object other) {
    return HouseholdMemberRelationShipModelMapper.ensureInitialized()
        .equalsValue(this as HouseholdMemberRelationShipModel, other);
  }

  @override
  int get hashCode {
    return HouseholdMemberRelationShipModelMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberRelationShipModel);
  }
}

extension HouseholdMemberRelationShipModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberRelationShipModel, $Out> {
  HouseholdMemberRelationShipModelCopyWith<$R, HouseholdMemberRelationShipModel,
          $Out>
      get $asHouseholdMemberRelationShipModel => $base.as((v, t, t2) =>
          _HouseholdMemberRelationShipModelCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberRelationShipModelCopyWith<
    $R,
    $In extends HouseholdMemberRelationShipModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  HouseholdMemberRelationShipAdditionalFieldsCopyWith<
      $R,
      HouseholdMemberRelationShipAdditionalFields,
      HouseholdMemberRelationShipAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {HouseholdMemberRelationShipAdditionalFields? additionalFields,
      String? id,
      String? selfId,
      String? selfClientReferenceId,
      String? clientReferenceId,
      String? relativeId,
      String? relativeClientReferenceId,
      String? relationshipType,
      int? rowVersion,
      String? tenantId,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HouseholdMemberRelationShipModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HouseholdMemberRelationShipModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberRelationShipModel, $Out>
    implements
        HouseholdMemberRelationShipModelCopyWith<$R,
            HouseholdMemberRelationShipModel, $Out> {
  _HouseholdMemberRelationShipModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberRelationShipModel> $mapper =
      HouseholdMemberRelationShipModelMapper.ensureInitialized();
  @override
  HouseholdMemberRelationShipAdditionalFieldsCopyWith<
          $R,
          HouseholdMemberRelationShipAdditionalFields,
          HouseholdMemberRelationShipAdditionalFields>?
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
          Object? selfId = $none,
          Object? selfClientReferenceId = $none,
          String? clientReferenceId,
          Object? relativeId = $none,
          Object? relativeClientReferenceId = $none,
          Object? relationshipType = $none,
          Object? rowVersion = $none,
          Object? tenantId = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (selfId != $none) #selfId: selfId,
        if (selfClientReferenceId != $none)
          #selfClientReferenceId: selfClientReferenceId,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (relativeId != $none) #relativeId: relativeId,
        if (relativeClientReferenceId != $none)
          #relativeClientReferenceId: relativeClientReferenceId,
        if (relationshipType != $none) #relationshipType: relationshipType,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (tenantId != $none) #tenantId: tenantId,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HouseholdMemberRelationShipModel $make(CopyWithData data) =>
      HouseholdMemberRelationShipModel(
          additionalFields: data.get(
              #additionalFields,
              or: $value.additionalFields),
          id: data.get(#id, or: $value.id),
          selfId: data.get(#selfId, or: $value.selfId),
          selfClientReferenceId:
              data.get(#selfClientReferenceId,
                  or: $value.selfClientReferenceId),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          relativeId: data.get(#relativeId, or: $value.relativeId),
          relativeClientReferenceId: data.get(#relativeClientReferenceId,
              or: $value.relativeClientReferenceId),
          relationshipType:
              data.get(#relationshipType, or: $value.relationshipType),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          clientAuditDetails:
              data.get(#clientAuditDetails, or: $value.clientAuditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HouseholdMemberRelationShipModelCopyWith<$R2,
      HouseholdMemberRelationShipModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HouseholdMemberRelationShipModelCopyWithImpl($value, $cast, t);
}

class HouseholdMemberRelationShipAdditionalFieldsMapper
    extends SubClassMapperBase<HouseholdMemberRelationShipAdditionalFields> {
  HouseholdMemberRelationShipAdditionalFieldsMapper._();

  static HouseholdMemberRelationShipAdditionalFieldsMapper? _instance;
  static HouseholdMemberRelationShipAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
          _instance = HouseholdMemberRelationShipAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HouseholdMemberRelationShipAdditionalFields';

  static String _$schema(HouseholdMemberRelationShipAdditionalFields v) =>
      v.schema;
  static const Field<HouseholdMemberRelationShipAdditionalFields, String>
      _f$schema =
      Field('schema', _$schema, opt: true, def: 'HouseholdMemberRelationShip');
  static int _$version(HouseholdMemberRelationShipAdditionalFields v) =>
      v.version;
  static const Field<HouseholdMemberRelationShipAdditionalFields, int>
      _f$version = Field('version', _$version);
  static List<AdditionalField> _$fields(
          HouseholdMemberRelationShipAdditionalFields v) =>
      v.fields;
  static const Field<HouseholdMemberRelationShipAdditionalFields,
          List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HouseholdMemberRelationShipAdditionalFields> fields =
      const {
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

  static HouseholdMemberRelationShipAdditionalFields _instantiate(
      DecodingData data) {
    return HouseholdMemberRelationShipAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HouseholdMemberRelationShipAdditionalFields fromMap(
      Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<HouseholdMemberRelationShipAdditionalFields>(map);
  }

  static HouseholdMemberRelationShipAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HouseholdMemberRelationShipAdditionalFields>(json);
  }
}

mixin HouseholdMemberRelationShipAdditionalFieldsMappable {
  String toJson() {
    return HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HouseholdMemberRelationShipAdditionalFields>(
            this as HouseholdMemberRelationShipAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HouseholdMemberRelationShipAdditionalFields>(
            this as HouseholdMemberRelationShipAdditionalFields);
  }

  HouseholdMemberRelationShipAdditionalFieldsCopyWith<
          HouseholdMemberRelationShipAdditionalFields,
          HouseholdMemberRelationShipAdditionalFields,
          HouseholdMemberRelationShipAdditionalFields>
      get copyWith => _HouseholdMemberRelationShipAdditionalFieldsCopyWithImpl(
          this as HouseholdMemberRelationShipAdditionalFields,
          $identity,
          $identity);
  @override
  String toString() {
    return HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HouseholdMemberRelationShipAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(
            this as HouseholdMemberRelationShipAdditionalFields, other);
  }

  @override
  int get hashCode {
    return HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HouseholdMemberRelationShipAdditionalFields);
  }
}

extension HouseholdMemberRelationShipAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HouseholdMemberRelationShipAdditionalFields, $Out> {
  HouseholdMemberRelationShipAdditionalFieldsCopyWith<
      $R,
      HouseholdMemberRelationShipAdditionalFields,
      $Out> get $asHouseholdMemberRelationShipAdditionalFields => $base.as((v,
          t, t2) =>
      _HouseholdMemberRelationShipAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HouseholdMemberRelationShipAdditionalFieldsCopyWith<
    $R,
    $In extends HouseholdMemberRelationShipAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HouseholdMemberRelationShipAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HouseholdMemberRelationShipAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HouseholdMemberRelationShipAdditionalFields,
        $Out>
    implements
        HouseholdMemberRelationShipAdditionalFieldsCopyWith<$R,
            HouseholdMemberRelationShipAdditionalFields, $Out> {
  _HouseholdMemberRelationShipAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HouseholdMemberRelationShipAdditionalFields>
      $mapper =
      HouseholdMemberRelationShipAdditionalFieldsMapper.ensureInitialized();
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
  HouseholdMemberRelationShipAdditionalFields $make(CopyWithData data) =>
      HouseholdMemberRelationShipAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HouseholdMemberRelationShipAdditionalFieldsCopyWith<$R2,
      HouseholdMemberRelationShipAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HouseholdMemberRelationShipAdditionalFieldsCopyWithImpl(
          $value, $cast, t);
}
