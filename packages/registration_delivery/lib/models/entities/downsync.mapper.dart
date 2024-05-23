// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'downsync.dart';

class DownsyncSearchModelMapper
    extends SubClassMapperBase<DownsyncSearchModel> {
  DownsyncSearchModelMapper._();

  static DownsyncSearchModelMapper? _instance;
  static DownsyncSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DownsyncSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DownsyncSearchModel';

  static String? _$locality(DownsyncSearchModel v) => v.locality;
  static const Field<DownsyncSearchModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static String? _$projectId(DownsyncSearchModel v) => v.projectId;
  static const Field<DownsyncSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static int? _$offset(DownsyncSearchModel v) => v.offset;
  static const Field<DownsyncSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(DownsyncSearchModel v) => v.limit;
  static const Field<DownsyncSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$lastSyncedTime(DownsyncSearchModel v) => v.lastSyncedTime;
  static const Field<DownsyncSearchModel, int> _f$lastSyncedTime =
      Field('lastSyncedTime', _$lastSyncedTime, opt: true);
  static int? _$totalCount(DownsyncSearchModel v) => v.totalCount;
  static const Field<DownsyncSearchModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static String? _$boundaryName(DownsyncSearchModel v) => v.boundaryName;
  static const Field<DownsyncSearchModel, String> _f$boundaryName =
      Field('boundaryName', _$boundaryName, opt: true);
  static String? _$tenantId(DownsyncSearchModel v) => v.tenantId;
  static const Field<DownsyncSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(DownsyncSearchModel v) => v.boundaryCode;
  static const Field<DownsyncSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(DownsyncSearchModel v) => v.auditDetails;
  static const Field<DownsyncSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(DownsyncSearchModel v) =>
      v.additionalFields;
  static const Field<DownsyncSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<DownsyncSearchModel> fields = const {
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

  static DownsyncSearchModel _instantiate(DecodingData data) {
    return DownsyncSearchModel.ignoreDeleted(
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

  static DownsyncSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownsyncSearchModel>(map);
  }

  static DownsyncSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<DownsyncSearchModel>(json);
  }
}

mixin DownsyncSearchModelMappable {
  String toJson() {
    return DownsyncSearchModelMapper.ensureInitialized()
        .encodeJson<DownsyncSearchModel>(this as DownsyncSearchModel);
  }

  Map<String, dynamic> toMap() {
    return DownsyncSearchModelMapper.ensureInitialized()
        .encodeMap<DownsyncSearchModel>(this as DownsyncSearchModel);
  }

  DownsyncSearchModelCopyWith<DownsyncSearchModel, DownsyncSearchModel,
          DownsyncSearchModel>
      get copyWith => _DownsyncSearchModelCopyWithImpl(
          this as DownsyncSearchModel, $identity, $identity);
  @override
  String toString() {
    return DownsyncSearchModelMapper.ensureInitialized()
        .stringifyValue(this as DownsyncSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DownsyncSearchModelMapper.ensureInitialized()
                .isValueEqual(this as DownsyncSearchModel, other));
  }

  @override
  int get hashCode {
    return DownsyncSearchModelMapper.ensureInitialized()
        .hashValue(this as DownsyncSearchModel);
  }
}

extension DownsyncSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownsyncSearchModel, $Out> {
  DownsyncSearchModelCopyWith<$R, DownsyncSearchModel, $Out>
      get $asDownsyncSearchModel =>
          $base.as((v, t, t2) => _DownsyncSearchModelCopyWithImpl(v, t, t2));
}

abstract class DownsyncSearchModelCopyWith<$R, $In extends DownsyncSearchModel,
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
  DownsyncSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownsyncSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownsyncSearchModel, $Out>
    implements DownsyncSearchModelCopyWith<$R, DownsyncSearchModel, $Out> {
  _DownsyncSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownsyncSearchModel> $mapper =
      DownsyncSearchModelMapper.ensureInitialized();
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
  DownsyncSearchModel $make(CopyWithData data) =>
      DownsyncSearchModel.ignoreDeleted(
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
  DownsyncSearchModelCopyWith<$R2, DownsyncSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownsyncSearchModelCopyWithImpl($value, $cast, t);
}

class DownsyncModelMapper extends SubClassMapperBase<DownsyncModel> {
  DownsyncModelMapper._();

  static DownsyncModelMapper? _instance;
  static DownsyncModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DownsyncModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DownsyncModel';

  static DownsyncAdditionalFields? _$additionalFields(DownsyncModel v) =>
      v.additionalFields;
  static const Field<DownsyncModel, DownsyncAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$locality(DownsyncModel v) => v.locality;
  static const Field<DownsyncModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static String? _$projectId(DownsyncModel v) => v.projectId;
  static const Field<DownsyncModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static int? _$offset(DownsyncModel v) => v.offset;
  static const Field<DownsyncModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(DownsyncModel v) => v.limit;
  static const Field<DownsyncModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$lastSyncedTime(DownsyncModel v) => v.lastSyncedTime;
  static const Field<DownsyncModel, int> _f$lastSyncedTime =
      Field('lastSyncedTime', _$lastSyncedTime, opt: true);
  static int? _$totalCount(DownsyncModel v) => v.totalCount;
  static const Field<DownsyncModel, int> _f$totalCount =
      Field('totalCount', _$totalCount, opt: true);
  static String? _$boundaryName(DownsyncModel v) => v.boundaryName;
  static const Field<DownsyncModel, String> _f$boundaryName =
      Field('boundaryName', _$boundaryName, opt: true);
  static bool? _$nonRecoverableError(DownsyncModel v) => v.nonRecoverableError;
  static const Field<DownsyncModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(DownsyncModel v) => v.tenantId;
  static const Field<DownsyncModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(DownsyncModel v) => v.rowVersion;
  static const Field<DownsyncModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(DownsyncModel v) => v.auditDetails;
  static const Field<DownsyncModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(DownsyncModel v) =>
      v.clientAuditDetails;
  static const Field<DownsyncModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(DownsyncModel v) => v.isDeleted;
  static const Field<DownsyncModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<DownsyncModel> fields = const {
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

  static DownsyncModel _instantiate(DecodingData data) {
    return DownsyncModel(
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

  static DownsyncModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownsyncModel>(map);
  }

  static DownsyncModel fromJson(String json) {
    return ensureInitialized().decodeJson<DownsyncModel>(json);
  }
}

mixin DownsyncModelMappable {
  String toJson() {
    return DownsyncModelMapper.ensureInitialized()
        .encodeJson<DownsyncModel>(this as DownsyncModel);
  }

  Map<String, dynamic> toMap() {
    return DownsyncModelMapper.ensureInitialized()
        .encodeMap<DownsyncModel>(this as DownsyncModel);
  }

  DownsyncModelCopyWith<DownsyncModel, DownsyncModel, DownsyncModel>
      get copyWith => _DownsyncModelCopyWithImpl(
          this as DownsyncModel, $identity, $identity);
  @override
  String toString() {
    return DownsyncModelMapper.ensureInitialized()
        .stringifyValue(this as DownsyncModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DownsyncModelMapper.ensureInitialized()
                .isValueEqual(this as DownsyncModel, other));
  }

  @override
  int get hashCode {
    return DownsyncModelMapper.ensureInitialized()
        .hashValue(this as DownsyncModel);
  }
}

extension DownsyncModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownsyncModel, $Out> {
  DownsyncModelCopyWith<$R, DownsyncModel, $Out> get $asDownsyncModel =>
      $base.as((v, t, t2) => _DownsyncModelCopyWithImpl(v, t, t2));
}

abstract class DownsyncModelCopyWith<$R, $In extends DownsyncModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  DownsyncAdditionalFieldsCopyWith<$R, DownsyncAdditionalFields,
      DownsyncAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {DownsyncAdditionalFields? additionalFields,
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
  DownsyncModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DownsyncModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownsyncModel, $Out>
    implements DownsyncModelCopyWith<$R, DownsyncModel, $Out> {
  _DownsyncModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownsyncModel> $mapper =
      DownsyncModelMapper.ensureInitialized();
  @override
  DownsyncAdditionalFieldsCopyWith<$R, DownsyncAdditionalFields,
          DownsyncAdditionalFields>?
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
  DownsyncModel $make(CopyWithData data) => DownsyncModel(
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
  DownsyncModelCopyWith<$R2, DownsyncModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DownsyncModelCopyWithImpl($value, $cast, t);
}

class DownsyncAdditionalFieldsMapper
    extends SubClassMapperBase<DownsyncAdditionalFields> {
  DownsyncAdditionalFieldsMapper._();

  static DownsyncAdditionalFieldsMapper? _instance;
  static DownsyncAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownsyncAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DownsyncAdditionalFields';

  static String _$schema(DownsyncAdditionalFields v) => v.schema;
  static const Field<DownsyncAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Downsync');
  static int _$version(DownsyncAdditionalFields v) => v.version;
  static const Field<DownsyncAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(DownsyncAdditionalFields v) => v.fields;
  static const Field<DownsyncAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<DownsyncAdditionalFields> fields = const {
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

  static DownsyncAdditionalFields _instantiate(DecodingData data) {
    return DownsyncAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static DownsyncAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownsyncAdditionalFields>(map);
  }

  static DownsyncAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<DownsyncAdditionalFields>(json);
  }
}

mixin DownsyncAdditionalFieldsMappable {
  String toJson() {
    return DownsyncAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<DownsyncAdditionalFields>(this as DownsyncAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return DownsyncAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<DownsyncAdditionalFields>(this as DownsyncAdditionalFields);
  }

  DownsyncAdditionalFieldsCopyWith<DownsyncAdditionalFields,
          DownsyncAdditionalFields, DownsyncAdditionalFields>
      get copyWith => _DownsyncAdditionalFieldsCopyWithImpl(
          this as DownsyncAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return DownsyncAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as DownsyncAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DownsyncAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as DownsyncAdditionalFields, other));
  }

  @override
  int get hashCode {
    return DownsyncAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as DownsyncAdditionalFields);
  }
}

extension DownsyncAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownsyncAdditionalFields, $Out> {
  DownsyncAdditionalFieldsCopyWith<$R, DownsyncAdditionalFields, $Out>
      get $asDownsyncAdditionalFields => $base
          .as((v, t, t2) => _DownsyncAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class DownsyncAdditionalFieldsCopyWith<
    $R,
    $In extends DownsyncAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  DownsyncAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownsyncAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownsyncAdditionalFields, $Out>
    implements
        DownsyncAdditionalFieldsCopyWith<$R, DownsyncAdditionalFields, $Out> {
  _DownsyncAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownsyncAdditionalFields> $mapper =
      DownsyncAdditionalFieldsMapper.ensureInitialized();
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
  DownsyncAdditionalFields $make(CopyWithData data) => DownsyncAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  DownsyncAdditionalFieldsCopyWith<$R2, DownsyncAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownsyncAdditionalFieldsCopyWithImpl($value, $cast, t);
}
