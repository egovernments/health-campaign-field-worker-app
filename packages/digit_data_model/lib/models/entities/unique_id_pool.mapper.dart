// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'unique_id_pool.dart';

class UniqueIdPoolSearchModelMapper
    extends SubClassMapperBase<UniqueIdPoolSearchModel> {
  UniqueIdPoolSearchModelMapper._();

  static UniqueIdPoolSearchModelMapper? _instance;
  static UniqueIdPoolSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UniqueIdPoolSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UniqueIdPoolSearchModel';

  static String? _$id(UniqueIdPoolSearchModel v) => v.id;
  static const Field<UniqueIdPoolSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$status(UniqueIdPoolSearchModel v) => v.status;
  static const Field<UniqueIdPoolSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$deviceUuid(UniqueIdPoolSearchModel v) => v.deviceUuid;
  static const Field<UniqueIdPoolSearchModel, String> _f$deviceUuid =
      Field('deviceUuid', _$deviceUuid, opt: true);
  static String? _$deviceInfo(UniqueIdPoolSearchModel v) => v.deviceInfo;
  static const Field<UniqueIdPoolSearchModel, String> _f$deviceInfo =
      Field('deviceInfo', _$deviceInfo, opt: true);
  static int? _$count(UniqueIdPoolSearchModel v) => v.count;
  static const Field<UniqueIdPoolSearchModel, int> _f$count =
      Field('count', _$count, opt: true);
  static String? _$userUuid(UniqueIdPoolSearchModel v) => v.userUuid;
  static const Field<UniqueIdPoolSearchModel, String> _f$userUuid =
      Field('userUuid', _$userUuid, opt: true);
  static String? _$tenantId(UniqueIdPoolSearchModel v) => v.tenantId;
  static const Field<UniqueIdPoolSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static bool? _$fetchAllocatedIds(UniqueIdPoolSearchModel v) =>
      v.fetchAllocatedIds;
  static const Field<UniqueIdPoolSearchModel, bool> _f$fetchAllocatedIds =
      Field('fetchAllocatedIds', _$fetchAllocatedIds, opt: true);
  static String? _$boundaryCode(UniqueIdPoolSearchModel v) => v.boundaryCode;
  static const Field<UniqueIdPoolSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(UniqueIdPoolSearchModel v) =>
      v.auditDetails;
  static const Field<UniqueIdPoolSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(UniqueIdPoolSearchModel v) =>
      v.additionalFields;
  static const Field<UniqueIdPoolSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<UniqueIdPoolSearchModel> fields = const {
    #id: _f$id,
    #status: _f$status,
    #deviceUuid: _f$deviceUuid,
    #deviceInfo: _f$deviceInfo,
    #count: _f$count,
    #userUuid: _f$userUuid,
    #tenantId: _f$tenantId,
    #fetchAllocatedIds: _f$fetchAllocatedIds,
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

  static UniqueIdPoolSearchModel _instantiate(DecodingData data) {
    return UniqueIdPoolSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        status: data.dec(_f$status),
        deviceUuid: data.dec(_f$deviceUuid),
        deviceInfo: data.dec(_f$deviceInfo),
        count: data.dec(_f$count),
        userUuid: data.dec(_f$userUuid),
        tenantId: data.dec(_f$tenantId),
        fetchAllocatedIds: data.dec(_f$fetchAllocatedIds),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static UniqueIdPoolSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UniqueIdPoolSearchModel>(map);
  }

  static UniqueIdPoolSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<UniqueIdPoolSearchModel>(json);
  }
}

mixin UniqueIdPoolSearchModelMappable {
  String toJson() {
    return UniqueIdPoolSearchModelMapper.ensureInitialized()
        .encodeJson<UniqueIdPoolSearchModel>(this as UniqueIdPoolSearchModel);
  }

  Map<String, dynamic> toMap() {
    return UniqueIdPoolSearchModelMapper.ensureInitialized()
        .encodeMap<UniqueIdPoolSearchModel>(this as UniqueIdPoolSearchModel);
  }

  UniqueIdPoolSearchModelCopyWith<UniqueIdPoolSearchModel,
          UniqueIdPoolSearchModel, UniqueIdPoolSearchModel>
      get copyWith => _UniqueIdPoolSearchModelCopyWithImpl(
          this as UniqueIdPoolSearchModel, $identity, $identity);
  @override
  String toString() {
    return UniqueIdPoolSearchModelMapper.ensureInitialized()
        .stringifyValue(this as UniqueIdPoolSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return UniqueIdPoolSearchModelMapper.ensureInitialized()
        .equalsValue(this as UniqueIdPoolSearchModel, other);
  }

  @override
  int get hashCode {
    return UniqueIdPoolSearchModelMapper.ensureInitialized()
        .hashValue(this as UniqueIdPoolSearchModel);
  }
}

extension UniqueIdPoolSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UniqueIdPoolSearchModel, $Out> {
  UniqueIdPoolSearchModelCopyWith<$R, UniqueIdPoolSearchModel, $Out>
      get $asUniqueIdPoolSearchModel => $base
          .as((v, t, t2) => _UniqueIdPoolSearchModelCopyWithImpl(v, t, t2));
}

abstract class UniqueIdPoolSearchModelCopyWith<
    $R,
    $In extends UniqueIdPoolSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? status,
      String? deviceUuid,
      String? deviceInfo,
      int? count,
      String? userUuid,
      String? tenantId,
      bool? fetchAllocatedIds,
      String? boundaryCode});
  UniqueIdPoolSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UniqueIdPoolSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UniqueIdPoolSearchModel, $Out>
    implements
        UniqueIdPoolSearchModelCopyWith<$R, UniqueIdPoolSearchModel, $Out> {
  _UniqueIdPoolSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UniqueIdPoolSearchModel> $mapper =
      UniqueIdPoolSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? status = $none,
          Object? deviceUuid = $none,
          Object? deviceInfo = $none,
          Object? count = $none,
          Object? userUuid = $none,
          Object? tenantId = $none,
          Object? fetchAllocatedIds = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (status != $none) #status: status,
        if (deviceUuid != $none) #deviceUuid: deviceUuid,
        if (deviceInfo != $none) #deviceInfo: deviceInfo,
        if (count != $none) #count: count,
        if (userUuid != $none) #userUuid: userUuid,
        if (tenantId != $none) #tenantId: tenantId,
        if (fetchAllocatedIds != $none) #fetchAllocatedIds: fetchAllocatedIds,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  UniqueIdPoolSearchModel $make(CopyWithData data) =>
      UniqueIdPoolSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          status: data.get(#status, or: $value.status),
          deviceUuid: data.get(#deviceUuid, or: $value.deviceUuid),
          deviceInfo: data.get(#deviceInfo, or: $value.deviceInfo),
          count: data.get(#count, or: $value.count),
          userUuid: data.get(#userUuid, or: $value.userUuid),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          fetchAllocatedIds:
              data.get(#fetchAllocatedIds, or: $value.fetchAllocatedIds),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  UniqueIdPoolSearchModelCopyWith<$R2, UniqueIdPoolSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UniqueIdPoolSearchModelCopyWithImpl($value, $cast, t);
}

class UniqueIdPoolModelMapper extends SubClassMapperBase<UniqueIdPoolModel> {
  UniqueIdPoolModelMapper._();

  static UniqueIdPoolModelMapper? _instance;
  static UniqueIdPoolModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UniqueIdPoolModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UniqueIdPoolModel';

  static String _$id(UniqueIdPoolModel v) => v.id;
  static const Field<UniqueIdPoolModel, String> _f$id = Field('id', _$id);
  static String _$status(UniqueIdPoolModel v) => v.status;
  static const Field<UniqueIdPoolModel, String> _f$status =
      Field('status', _$status);
  static String? _$deviceUuid(UniqueIdPoolModel v) => v.deviceUuid;
  static const Field<UniqueIdPoolModel, String> _f$deviceUuid =
      Field('deviceUuid', _$deviceUuid);
  static String? _$userUuid(UniqueIdPoolModel v) => v.userUuid;
  static const Field<UniqueIdPoolModel, String> _f$userUuid =
      Field('userUuid', _$userUuid);
  static int? _$rowVersion(UniqueIdPoolModel v) => v.rowVersion;
  static const Field<UniqueIdPoolModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$tenantId(UniqueIdPoolModel v) => v.tenantId;
  static const Field<UniqueIdPoolModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static UniqueIdPoolAdditionalFields? _$additionalFields(
          UniqueIdPoolModel v) =>
      v.additionalFields;
  static const Field<UniqueIdPoolModel, UniqueIdPoolAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(UniqueIdPoolModel v) => v.auditDetails;
  static const Field<UniqueIdPoolModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(UniqueIdPoolModel v) =>
      v.clientAuditDetails;
  static const Field<UniqueIdPoolModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(UniqueIdPoolModel v) => v.isDeleted;
  static const Field<UniqueIdPoolModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<UniqueIdPoolModel> fields = const {
    #id: _f$id,
    #status: _f$status,
    #deviceUuid: _f$deviceUuid,
    #userUuid: _f$userUuid,
    #rowVersion: _f$rowVersion,
    #tenantId: _f$tenantId,
    #additionalFields: _f$additionalFields,
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

  static UniqueIdPoolModel _instantiate(DecodingData data) {
    return UniqueIdPoolModel(
        id: data.dec(_f$id),
        status: data.dec(_f$status),
        deviceUuid: data.dec(_f$deviceUuid),
        userUuid: data.dec(_f$userUuid),
        rowVersion: data.dec(_f$rowVersion),
        tenantId: data.dec(_f$tenantId),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static UniqueIdPoolModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UniqueIdPoolModel>(map);
  }

  static UniqueIdPoolModel fromJson(String json) {
    return ensureInitialized().decodeJson<UniqueIdPoolModel>(json);
  }
}

mixin UniqueIdPoolModelMappable {
  String toJson() {
    return UniqueIdPoolModelMapper.ensureInitialized()
        .encodeJson<UniqueIdPoolModel>(this as UniqueIdPoolModel);
  }

  Map<String, dynamic> toMap() {
    return UniqueIdPoolModelMapper.ensureInitialized()
        .encodeMap<UniqueIdPoolModel>(this as UniqueIdPoolModel);
  }

  UniqueIdPoolModelCopyWith<UniqueIdPoolModel, UniqueIdPoolModel,
          UniqueIdPoolModel>
      get copyWith => _UniqueIdPoolModelCopyWithImpl(
          this as UniqueIdPoolModel, $identity, $identity);
  @override
  String toString() {
    return UniqueIdPoolModelMapper.ensureInitialized()
        .stringifyValue(this as UniqueIdPoolModel);
  }

  @override
  bool operator ==(Object other) {
    return UniqueIdPoolModelMapper.ensureInitialized()
        .equalsValue(this as UniqueIdPoolModel, other);
  }

  @override
  int get hashCode {
    return UniqueIdPoolModelMapper.ensureInitialized()
        .hashValue(this as UniqueIdPoolModel);
  }
}

extension UniqueIdPoolModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UniqueIdPoolModel, $Out> {
  UniqueIdPoolModelCopyWith<$R, UniqueIdPoolModel, $Out>
      get $asUniqueIdPoolModel =>
          $base.as((v, t, t2) => _UniqueIdPoolModelCopyWithImpl(v, t, t2));
}

abstract class UniqueIdPoolModelCopyWith<$R, $In extends UniqueIdPoolModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  UniqueIdPoolAdditionalFieldsCopyWith<$R, UniqueIdPoolAdditionalFields,
      UniqueIdPoolAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {String? id,
      String? status,
      String? deviceUuid,
      String? userUuid,
      int? rowVersion,
      String? tenantId,
      UniqueIdPoolAdditionalFields? additionalFields,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  UniqueIdPoolModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UniqueIdPoolModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UniqueIdPoolModel, $Out>
    implements UniqueIdPoolModelCopyWith<$R, UniqueIdPoolModel, $Out> {
  _UniqueIdPoolModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UniqueIdPoolModel> $mapper =
      UniqueIdPoolModelMapper.ensureInitialized();
  @override
  UniqueIdPoolAdditionalFieldsCopyWith<$R, UniqueIdPoolAdditionalFields,
          UniqueIdPoolAdditionalFields>?
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
          {String? id,
          String? status,
          Object? deviceUuid = $none,
          Object? userUuid = $none,
          Object? rowVersion = $none,
          Object? tenantId = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (status != null) #status: status,
        if (deviceUuid != $none) #deviceUuid: deviceUuid,
        if (userUuid != $none) #userUuid: userUuid,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (tenantId != $none) #tenantId: tenantId,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  UniqueIdPoolModel $make(CopyWithData data) => UniqueIdPoolModel(
      id: data.get(#id, or: $value.id),
      status: data.get(#status, or: $value.status),
      deviceUuid: data.get(#deviceUuid, or: $value.deviceUuid),
      userUuid: data.get(#userUuid, or: $value.userUuid),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  UniqueIdPoolModelCopyWith<$R2, UniqueIdPoolModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UniqueIdPoolModelCopyWithImpl($value, $cast, t);
}

class UniqueIdPoolAdditionalFieldsMapper
    extends SubClassMapperBase<UniqueIdPoolAdditionalFields> {
  UniqueIdPoolAdditionalFieldsMapper._();

  static UniqueIdPoolAdditionalFieldsMapper? _instance;
  static UniqueIdPoolAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UniqueIdPoolAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UniqueIdPoolAdditionalFields';

  static String _$schema(UniqueIdPoolAdditionalFields v) => v.schema;
  static const Field<UniqueIdPoolAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'UniqueIds');
  static int _$version(UniqueIdPoolAdditionalFields v) => v.version;
  static const Field<UniqueIdPoolAdditionalFields, int> _f$version =
      Field('version', _$version, opt: true, def: 1);
  static List<AdditionalField> _$fields(UniqueIdPoolAdditionalFields v) =>
      v.fields;
  static const Field<UniqueIdPoolAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<UniqueIdPoolAdditionalFields> fields = const {
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

  static UniqueIdPoolAdditionalFields _instantiate(DecodingData data) {
    return UniqueIdPoolAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static UniqueIdPoolAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UniqueIdPoolAdditionalFields>(map);
  }

  static UniqueIdPoolAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<UniqueIdPoolAdditionalFields>(json);
  }
}

mixin UniqueIdPoolAdditionalFieldsMappable {
  String toJson() {
    return UniqueIdPoolAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<UniqueIdPoolAdditionalFields>(
            this as UniqueIdPoolAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return UniqueIdPoolAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<UniqueIdPoolAdditionalFields>(
            this as UniqueIdPoolAdditionalFields);
  }

  UniqueIdPoolAdditionalFieldsCopyWith<UniqueIdPoolAdditionalFields,
          UniqueIdPoolAdditionalFields, UniqueIdPoolAdditionalFields>
      get copyWith => _UniqueIdPoolAdditionalFieldsCopyWithImpl(
          this as UniqueIdPoolAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return UniqueIdPoolAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as UniqueIdPoolAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return UniqueIdPoolAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as UniqueIdPoolAdditionalFields, other);
  }

  @override
  int get hashCode {
    return UniqueIdPoolAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as UniqueIdPoolAdditionalFields);
  }
}

extension UniqueIdPoolAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UniqueIdPoolAdditionalFields, $Out> {
  UniqueIdPoolAdditionalFieldsCopyWith<$R, UniqueIdPoolAdditionalFields, $Out>
      get $asUniqueIdPoolAdditionalFields => $base.as(
          (v, t, t2) => _UniqueIdPoolAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class UniqueIdPoolAdditionalFieldsCopyWith<
    $R,
    $In extends UniqueIdPoolAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  UniqueIdPoolAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UniqueIdPoolAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UniqueIdPoolAdditionalFields, $Out>
    implements
        UniqueIdPoolAdditionalFieldsCopyWith<$R, UniqueIdPoolAdditionalFields,
            $Out> {
  _UniqueIdPoolAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UniqueIdPoolAdditionalFields> $mapper =
      UniqueIdPoolAdditionalFieldsMapper.ensureInitialized();
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
  UniqueIdPoolAdditionalFields $make(CopyWithData data) =>
      UniqueIdPoolAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  UniqueIdPoolAdditionalFieldsCopyWith<$R2, UniqueIdPoolAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UniqueIdPoolAdditionalFieldsCopyWithImpl($value, $cast, t);
}

class UniqueIdSearchResponseMapper
    extends SubClassMapperBase<UniqueIdSearchResponse> {
  UniqueIdSearchResponseMapper._();

  static UniqueIdSearchResponseMapper? _instance;
  static UniqueIdSearchResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UniqueIdSearchResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UniqueIdSearchResponse';

  static List<UniqueIdPoolModel> _$models(UniqueIdSearchResponse v) => v.models;
  static const Field<UniqueIdSearchResponse, List<UniqueIdPoolModel>>
      _f$models = Field('models', _$models);
  static int _$fetchLimit(UniqueIdSearchResponse v) => v.fetchLimit;
  static const Field<UniqueIdSearchResponse, int> _f$fetchLimit =
      Field('fetchLimit', _$fetchLimit);
  static int _$totalLimit(UniqueIdSearchResponse v) => v.totalLimit;
  static const Field<UniqueIdSearchResponse, int> _f$totalLimit =
      Field('totalLimit', _$totalLimit);
  static AuditDetails? _$auditDetails(UniqueIdSearchResponse v) =>
      v.auditDetails;
  static const Field<UniqueIdSearchResponse, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(UniqueIdSearchResponse v) =>
      v.clientAuditDetails;
  static const Field<UniqueIdSearchResponse, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(UniqueIdSearchResponse v) => v.isDeleted;
  static const Field<UniqueIdSearchResponse, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<UniqueIdSearchResponse> fields = const {
    #models: _f$models,
    #fetchLimit: _f$fetchLimit,
    #totalLimit: _f$totalLimit,
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

  static UniqueIdSearchResponse _instantiate(DecodingData data) {
    return UniqueIdSearchResponse(
        models: data.dec(_f$models),
        fetchLimit: data.dec(_f$fetchLimit),
        totalLimit: data.dec(_f$totalLimit),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static UniqueIdSearchResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UniqueIdSearchResponse>(map);
  }

  static UniqueIdSearchResponse fromJson(String json) {
    return ensureInitialized().decodeJson<UniqueIdSearchResponse>(json);
  }
}

mixin UniqueIdSearchResponseMappable {
  String toJson() {
    return UniqueIdSearchResponseMapper.ensureInitialized()
        .encodeJson<UniqueIdSearchResponse>(this as UniqueIdSearchResponse);
  }

  Map<String, dynamic> toMap() {
    return UniqueIdSearchResponseMapper.ensureInitialized()
        .encodeMap<UniqueIdSearchResponse>(this as UniqueIdSearchResponse);
  }

  UniqueIdSearchResponseCopyWith<UniqueIdSearchResponse, UniqueIdSearchResponse,
          UniqueIdSearchResponse>
      get copyWith => _UniqueIdSearchResponseCopyWithImpl(
          this as UniqueIdSearchResponse, $identity, $identity);
  @override
  String toString() {
    return UniqueIdSearchResponseMapper.ensureInitialized()
        .stringifyValue(this as UniqueIdSearchResponse);
  }

  @override
  bool operator ==(Object other) {
    return UniqueIdSearchResponseMapper.ensureInitialized()
        .equalsValue(this as UniqueIdSearchResponse, other);
  }

  @override
  int get hashCode {
    return UniqueIdSearchResponseMapper.ensureInitialized()
        .hashValue(this as UniqueIdSearchResponse);
  }
}

extension UniqueIdSearchResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UniqueIdSearchResponse, $Out> {
  UniqueIdSearchResponseCopyWith<$R, UniqueIdSearchResponse, $Out>
      get $asUniqueIdSearchResponse =>
          $base.as((v, t, t2) => _UniqueIdSearchResponseCopyWithImpl(v, t, t2));
}

abstract class UniqueIdSearchResponseCopyWith<
    $R,
    $In extends UniqueIdSearchResponse,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, UniqueIdPoolModel,
          UniqueIdPoolModelCopyWith<$R, UniqueIdPoolModel, UniqueIdPoolModel>>
      get models;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {List<UniqueIdPoolModel>? models,
      int? fetchLimit,
      int? totalLimit,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  UniqueIdSearchResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UniqueIdSearchResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UniqueIdSearchResponse, $Out>
    implements
        UniqueIdSearchResponseCopyWith<$R, UniqueIdSearchResponse, $Out> {
  _UniqueIdSearchResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UniqueIdSearchResponse> $mapper =
      UniqueIdSearchResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, UniqueIdPoolModel,
          UniqueIdPoolModelCopyWith<$R, UniqueIdPoolModel, UniqueIdPoolModel>>
      get models => ListCopyWith($value.models, (v, t) => v.copyWith.$chain(t),
          (v) => call(models: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {List<UniqueIdPoolModel>? models,
          int? fetchLimit,
          int? totalLimit,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (models != null) #models: models,
        if (fetchLimit != null) #fetchLimit: fetchLimit,
        if (totalLimit != null) #totalLimit: totalLimit,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  UniqueIdSearchResponse $make(CopyWithData data) => UniqueIdSearchResponse(
      models: data.get(#models, or: $value.models),
      fetchLimit: data.get(#fetchLimit, or: $value.fetchLimit),
      totalLimit: data.get(#totalLimit, or: $value.totalLimit),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  UniqueIdSearchResponseCopyWith<$R2, UniqueIdSearchResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UniqueIdSearchResponseCopyWithImpl($value, $cast, t);
}
