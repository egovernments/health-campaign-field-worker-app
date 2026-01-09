// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hf_referral_downsync.dart';

class HFReferralDownsyncSearchModelMapper
    extends SubClassMapperBase<HFReferralDownsyncSearchModel> {
  HFReferralDownsyncSearchModelMapper._();

  static HFReferralDownsyncSearchModelMapper? _instance;
  static HFReferralDownsyncSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HFReferralDownsyncSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralDownsyncSearchModel';

  static String? _$locality(HFReferralDownsyncSearchModel v) => v.locality;
  static const Field<HFReferralDownsyncSearchModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static String? _$projectId(HFReferralDownsyncSearchModel v) => v.projectId;
  static const Field<HFReferralDownsyncSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static int? _$offset(HFReferralDownsyncSearchModel v) => v.offset;
  static const Field<HFReferralDownsyncSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(HFReferralDownsyncSearchModel v) => v.limit;
  static const Field<HFReferralDownsyncSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$lastSyncedTime(HFReferralDownsyncSearchModel v) =>
      v.lastSyncedTime;
  static const Field<HFReferralDownsyncSearchModel, int> _f$lastSyncedTime =
      Field('lastSyncedTime', _$lastSyncedTime, opt: true);
  static int? _$totalCount(HFReferralDownsyncSearchModel v) => v.totalCount;
  static const Field<HFReferralDownsyncSearchModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static String? _$boundaryName(HFReferralDownsyncSearchModel v) =>
      v.boundaryName;
  static const Field<HFReferralDownsyncSearchModel, String> _f$boundaryName =
      Field('boundaryName', _$boundaryName, opt: true);
  static String? _$tenantId(HFReferralDownsyncSearchModel v) => v.tenantId;
  static const Field<HFReferralDownsyncSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(HFReferralDownsyncSearchModel v) =>
      v.boundaryCode;
  static const Field<HFReferralDownsyncSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(HFReferralDownsyncSearchModel v) =>
      v.auditDetails;
  static const Field<HFReferralDownsyncSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          HFReferralDownsyncSearchModel v) =>
      v.additionalFields;
  static const Field<HFReferralDownsyncSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<HFReferralDownsyncSearchModel> fields = const {
    #locality: _f$locality,
    #projectId: _f$projectId,
    #offset: _f$offset,
    #limit: _f$limit,
    #lastSyncedTime: _f$lastSyncedTime,
    #totalCount: _f$totalCount,
    #boundaryName: _f$boundaryName,
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

  static HFReferralDownsyncSearchModel _instantiate(DecodingData data) {
    return HFReferralDownsyncSearchModel.ignoreDeleted(
        locality: data.dec(_f$locality),
        projectId: data.dec(_f$projectId),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        lastSyncedTime: data.dec(_f$lastSyncedTime),
        totalCount: data.dec(_f$totalCount),
        boundaryName: data.dec(_f$boundaryName),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralDownsyncSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HFReferralDownsyncSearchModel>(map);
  }

  static HFReferralDownsyncSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HFReferralDownsyncSearchModel>(json);
  }
}

mixin HFReferralDownsyncSearchModelMappable {
  String toJson() {
    return HFReferralDownsyncSearchModelMapper.ensureInitialized()
        .encodeJson<HFReferralDownsyncSearchModel>(
            this as HFReferralDownsyncSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HFReferralDownsyncSearchModelMapper.ensureInitialized()
        .encodeMap<HFReferralDownsyncSearchModel>(
            this as HFReferralDownsyncSearchModel);
  }

  HFReferralDownsyncSearchModelCopyWith<HFReferralDownsyncSearchModel,
          HFReferralDownsyncSearchModel, HFReferralDownsyncSearchModel>
      get copyWith => _HFReferralDownsyncSearchModelCopyWithImpl(
          this as HFReferralDownsyncSearchModel, $identity, $identity);
  @override
  String toString() {
    return HFReferralDownsyncSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HFReferralDownsyncSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return HFReferralDownsyncSearchModelMapper.ensureInitialized()
        .equalsValue(this as HFReferralDownsyncSearchModel, other);
  }

  @override
  int get hashCode {
    return HFReferralDownsyncSearchModelMapper.ensureInitialized()
        .hashValue(this as HFReferralDownsyncSearchModel);
  }
}

extension HFReferralDownsyncSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralDownsyncSearchModel, $Out> {
  HFReferralDownsyncSearchModelCopyWith<$R, HFReferralDownsyncSearchModel, $Out>
      get $asHFReferralDownsyncSearchModel => $base.as(
          (v, t, t2) => _HFReferralDownsyncSearchModelCopyWithImpl(v, t, t2));
}

abstract class HFReferralDownsyncSearchModelCopyWith<
    $R,
    $In extends HFReferralDownsyncSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? locality,
      String? projectId,
      int? offset,
      int? limit,
      int? lastSyncedTime,
      int? totalCount,
      String? boundaryName,
      String? tenantId,
      String? boundaryCode});
  HFReferralDownsyncSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HFReferralDownsyncSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralDownsyncSearchModel, $Out>
    implements
        HFReferralDownsyncSearchModelCopyWith<$R, HFReferralDownsyncSearchModel,
            $Out> {
  _HFReferralDownsyncSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralDownsyncSearchModel> $mapper =
      HFReferralDownsyncSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? locality = $none,
          Object? projectId = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? lastSyncedTime = $none,
          Object? totalCount = $none,
          Object? boundaryName = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (locality != $none) #locality: locality,
        if (projectId != $none) #projectId: projectId,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (lastSyncedTime != $none) #lastSyncedTime: lastSyncedTime,
        if (totalCount != $none) #totalCount: totalCount,
        if (boundaryName != $none) #boundaryName: boundaryName,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  HFReferralDownsyncSearchModel $make(CopyWithData data) =>
      HFReferralDownsyncSearchModel.ignoreDeleted(
          locality: data.get(#locality, or: $value.locality),
          projectId: data.get(#projectId, or: $value.projectId),
          offset: data.get(#offset, or: $value.offset),
          limit: data.get(#limit, or: $value.limit),
          lastSyncedTime: data.get(#lastSyncedTime, or: $value.lastSyncedTime),
          totalCount: data.get(#totalCount, or: $value.totalCount),
          boundaryName: data.get(#boundaryName, or: $value.boundaryName),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  HFReferralDownsyncSearchModelCopyWith<$R2, HFReferralDownsyncSearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HFReferralDownsyncSearchModelCopyWithImpl($value, $cast, t);
}

class HFReferralDownsyncModelMapper
    extends SubClassMapperBase<HFReferralDownsyncModel> {
  HFReferralDownsyncModelMapper._();

  static HFReferralDownsyncModelMapper? _instance;
  static HFReferralDownsyncModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HFReferralDownsyncModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralDownsyncModel';

  static HFReferralDownsyncAdditionalFields? _$additionalFields(
          HFReferralDownsyncModel v) =>
      v.additionalFields;
  static const Field<HFReferralDownsyncModel,
          HFReferralDownsyncAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$locality(HFReferralDownsyncModel v) => v.locality;
  static const Field<HFReferralDownsyncModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static String? _$projectId(HFReferralDownsyncModel v) => v.projectId;
  static const Field<HFReferralDownsyncModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static int? _$offset(HFReferralDownsyncModel v) => v.offset;
  static const Field<HFReferralDownsyncModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(HFReferralDownsyncModel v) => v.limit;
  static const Field<HFReferralDownsyncModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$lastSyncedTime(HFReferralDownsyncModel v) => v.lastSyncedTime;
  static const Field<HFReferralDownsyncModel, int> _f$lastSyncedTime =
      Field('lastSyncedTime', _$lastSyncedTime, opt: true);
  static int? _$totalCount(HFReferralDownsyncModel v) => v.totalCount;
  static const Field<HFReferralDownsyncModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static String? _$boundaryName(HFReferralDownsyncModel v) => v.boundaryName;
  static const Field<HFReferralDownsyncModel, String> _f$boundaryName =
      Field('boundaryName', _$boundaryName, opt: true);
  static bool? _$nonRecoverableError(HFReferralDownsyncModel v) =>
      v.nonRecoverableError;
  static const Field<HFReferralDownsyncModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static String? _$tenantId(HFReferralDownsyncModel v) => v.tenantId;
  static const Field<HFReferralDownsyncModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(HFReferralDownsyncModel v) => v.rowVersion;
  static const Field<HFReferralDownsyncModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(HFReferralDownsyncModel v) =>
      v.auditDetails;
  static const Field<HFReferralDownsyncModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HFReferralDownsyncModel v) =>
      v.clientAuditDetails;
  static const Field<HFReferralDownsyncModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HFReferralDownsyncModel v) => v.isDeleted;
  static const Field<HFReferralDownsyncModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HFReferralDownsyncModel> fields = const {
    #additionalFields: _f$additionalFields,
    #locality: _f$locality,
    #projectId: _f$projectId,
    #offset: _f$offset,
    #limit: _f$limit,
    #lastSyncedTime: _f$lastSyncedTime,
    #totalCount: _f$totalCount,
    #boundaryName: _f$boundaryName,
    #nonRecoverableError: _f$nonRecoverableError,
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

  static HFReferralDownsyncModel _instantiate(DecodingData data) {
    return HFReferralDownsyncModel(
        additionalFields: data.dec(_f$additionalFields),
        locality: data.dec(_f$locality),
        projectId: data.dec(_f$projectId),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        lastSyncedTime: data.dec(_f$lastSyncedTime),
        totalCount: data.dec(_f$totalCount),
        boundaryName: data.dec(_f$boundaryName),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralDownsyncModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HFReferralDownsyncModel>(map);
  }

  static HFReferralDownsyncModel fromJson(String json) {
    return ensureInitialized().decodeJson<HFReferralDownsyncModel>(json);
  }
}

mixin HFReferralDownsyncModelMappable {
  String toJson() {
    return HFReferralDownsyncModelMapper.ensureInitialized()
        .encodeJson<HFReferralDownsyncModel>(this as HFReferralDownsyncModel);
  }

  Map<String, dynamic> toMap() {
    return HFReferralDownsyncModelMapper.ensureInitialized()
        .encodeMap<HFReferralDownsyncModel>(this as HFReferralDownsyncModel);
  }

  HFReferralDownsyncModelCopyWith<HFReferralDownsyncModel,
          HFReferralDownsyncModel, HFReferralDownsyncModel>
      get copyWith => _HFReferralDownsyncModelCopyWithImpl(
          this as HFReferralDownsyncModel, $identity, $identity);
  @override
  String toString() {
    return HFReferralDownsyncModelMapper.ensureInitialized()
        .stringifyValue(this as HFReferralDownsyncModel);
  }

  @override
  bool operator ==(Object other) {
    return HFReferralDownsyncModelMapper.ensureInitialized()
        .equalsValue(this as HFReferralDownsyncModel, other);
  }

  @override
  int get hashCode {
    return HFReferralDownsyncModelMapper.ensureInitialized()
        .hashValue(this as HFReferralDownsyncModel);
  }
}

extension HFReferralDownsyncModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralDownsyncModel, $Out> {
  HFReferralDownsyncModelCopyWith<$R, HFReferralDownsyncModel, $Out>
      get $asHFReferralDownsyncModel => $base
          .as((v, t, t2) => _HFReferralDownsyncModelCopyWithImpl(v, t, t2));
}

abstract class HFReferralDownsyncModelCopyWith<
    $R,
    $In extends HFReferralDownsyncModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  HFReferralDownsyncAdditionalFieldsCopyWith<
      $R,
      HFReferralDownsyncAdditionalFields,
      HFReferralDownsyncAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {HFReferralDownsyncAdditionalFields? additionalFields,
      String? locality,
      String? projectId,
      int? offset,
      int? limit,
      int? lastSyncedTime,
      int? totalCount,
      String? boundaryName,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HFReferralDownsyncModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HFReferralDownsyncModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralDownsyncModel, $Out>
    implements
        HFReferralDownsyncModelCopyWith<$R, HFReferralDownsyncModel, $Out> {
  _HFReferralDownsyncModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralDownsyncModel> $mapper =
      HFReferralDownsyncModelMapper.ensureInitialized();
  @override
  HFReferralDownsyncAdditionalFieldsCopyWith<
          $R,
          HFReferralDownsyncAdditionalFields,
          HFReferralDownsyncAdditionalFields>?
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
          Object? locality = $none,
          Object? projectId = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? lastSyncedTime = $none,
          Object? totalCount = $none,
          Object? boundaryName = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (locality != $none) #locality: locality,
        if (projectId != $none) #projectId: projectId,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (lastSyncedTime != $none) #lastSyncedTime: lastSyncedTime,
        if (totalCount != $none) #totalCount: totalCount,
        if (boundaryName != $none) #boundaryName: boundaryName,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HFReferralDownsyncModel $make(CopyWithData data) => HFReferralDownsyncModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      locality: data.get(#locality, or: $value.locality),
      projectId: data.get(#projectId, or: $value.projectId),
      offset: data.get(#offset, or: $value.offset),
      limit: data.get(#limit, or: $value.limit),
      lastSyncedTime: data.get(#lastSyncedTime, or: $value.lastSyncedTime),
      totalCount: data.get(#totalCount, or: $value.totalCount),
      boundaryName: data.get(#boundaryName, or: $value.boundaryName),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HFReferralDownsyncModelCopyWith<$R2, HFReferralDownsyncModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HFReferralDownsyncModelCopyWithImpl($value, $cast, t);
}

class HFReferralDownsyncAdditionalFieldsMapper
    extends SubClassMapperBase<HFReferralDownsyncAdditionalFields> {
  HFReferralDownsyncAdditionalFieldsMapper._();

  static HFReferralDownsyncAdditionalFieldsMapper? _instance;
  static HFReferralDownsyncAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HFReferralDownsyncAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HFReferralDownsyncAdditionalFields';

  static String _$schema(HFReferralDownsyncAdditionalFields v) => v.schema;
  static const Field<HFReferralDownsyncAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'HFReferralDownsync');
  static int _$version(HFReferralDownsyncAdditionalFields v) => v.version;
  static const Field<HFReferralDownsyncAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HFReferralDownsyncAdditionalFields v) =>
      v.fields;
  static const Field<HFReferralDownsyncAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HFReferralDownsyncAdditionalFields> fields = const {
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

  static HFReferralDownsyncAdditionalFields _instantiate(DecodingData data) {
    return HFReferralDownsyncAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HFReferralDownsyncAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<HFReferralDownsyncAdditionalFields>(map);
  }

  static HFReferralDownsyncAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<HFReferralDownsyncAdditionalFields>(json);
  }
}

mixin HFReferralDownsyncAdditionalFieldsMappable {
  String toJson() {
    return HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HFReferralDownsyncAdditionalFields>(
            this as HFReferralDownsyncAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HFReferralDownsyncAdditionalFields>(
            this as HFReferralDownsyncAdditionalFields);
  }

  HFReferralDownsyncAdditionalFieldsCopyWith<
          HFReferralDownsyncAdditionalFields,
          HFReferralDownsyncAdditionalFields,
          HFReferralDownsyncAdditionalFields>
      get copyWith => _HFReferralDownsyncAdditionalFieldsCopyWithImpl(
          this as HFReferralDownsyncAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HFReferralDownsyncAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as HFReferralDownsyncAdditionalFields, other);
  }

  @override
  int get hashCode {
    return HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HFReferralDownsyncAdditionalFields);
  }
}

extension HFReferralDownsyncAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HFReferralDownsyncAdditionalFields, $Out> {
  HFReferralDownsyncAdditionalFieldsCopyWith<$R,
          HFReferralDownsyncAdditionalFields, $Out>
      get $asHFReferralDownsyncAdditionalFields => $base.as((v, t, t2) =>
          _HFReferralDownsyncAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HFReferralDownsyncAdditionalFieldsCopyWith<
    $R,
    $In extends HFReferralDownsyncAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HFReferralDownsyncAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HFReferralDownsyncAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HFReferralDownsyncAdditionalFields, $Out>
    implements
        HFReferralDownsyncAdditionalFieldsCopyWith<$R,
            HFReferralDownsyncAdditionalFields, $Out> {
  _HFReferralDownsyncAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HFReferralDownsyncAdditionalFields> $mapper =
      HFReferralDownsyncAdditionalFieldsMapper.ensureInitialized();
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
  HFReferralDownsyncAdditionalFields $make(CopyWithData data) =>
      HFReferralDownsyncAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HFReferralDownsyncAdditionalFieldsCopyWith<$R2,
      HFReferralDownsyncAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HFReferralDownsyncAdditionalFieldsCopyWithImpl($value, $cast, t);
}
