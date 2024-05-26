// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'side_effect.dart';

class SideEffectSearchModelMapper
    extends SubClassMapperBase<SideEffectSearchModel> {
  SideEffectSearchModelMapper._();

  static SideEffectSearchModelMapper? _instance;
  static SideEffectSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SideEffectSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SideEffectSearchModel';

  static String? _$id(SideEffectSearchModel v) => v.id;
  static const Field<SideEffectSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$taskClientReferenceId(SideEffectSearchModel v) =>
      v.taskClientReferenceId;
  static const Field<SideEffectSearchModel, List<String>>
      _f$taskClientReferenceId =
      Field('taskClientReferenceId', _$taskClientReferenceId, opt: true);
  static String? _$projectId(SideEffectSearchModel v) => v.projectId;
  static const Field<SideEffectSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static int? _$reAttempts(SideEffectSearchModel v) => v.reAttempts;
  static const Field<SideEffectSearchModel, int> _f$reAttempts =
      Field('reAttempts', _$reAttempts, opt: true);
  static List<String>? _$symptoms(SideEffectSearchModel v) => v.symptoms;
  static const Field<SideEffectSearchModel, List<String>> _f$symptoms =
      Field('symptoms', _$symptoms, opt: true);
  static List<String>? _$clientReferenceId(SideEffectSearchModel v) =>
      v.clientReferenceId;
  static const Field<SideEffectSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(SideEffectSearchModel v) => v.tenantId;
  static const Field<SideEffectSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(SideEffectSearchModel v) => v.boundaryCode;
  static const Field<SideEffectSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(SideEffectSearchModel v) =>
      v.auditDetails;
  static const Field<SideEffectSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(SideEffectSearchModel v) =>
      v.additionalFields;
  static const Field<SideEffectSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<SideEffectSearchModel> fields = const {
    #id: _f$id,
    #taskClientReferenceId: _f$taskClientReferenceId,
    #projectId: _f$projectId,
    #reAttempts: _f$reAttempts,
    #symptoms: _f$symptoms,
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

  static SideEffectSearchModel _instantiate(DecodingData data) {
    return SideEffectSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        taskClientReferenceId: data.dec(_f$taskClientReferenceId),
        projectId: data.dec(_f$projectId),
        reAttempts: data.dec(_f$reAttempts),
        symptoms: data.dec(_f$symptoms),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static SideEffectSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SideEffectSearchModel>(map);
  }

  static SideEffectSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<SideEffectSearchModel>(json);
  }
}

mixin SideEffectSearchModelMappable {
  String toJson() {
    return SideEffectSearchModelMapper.ensureInitialized()
        .encodeJson<SideEffectSearchModel>(this as SideEffectSearchModel);
  }

  Map<String, dynamic> toMap() {
    return SideEffectSearchModelMapper.ensureInitialized()
        .encodeMap<SideEffectSearchModel>(this as SideEffectSearchModel);
  }

  SideEffectSearchModelCopyWith<SideEffectSearchModel, SideEffectSearchModel,
          SideEffectSearchModel>
      get copyWith => _SideEffectSearchModelCopyWithImpl(
          this as SideEffectSearchModel, $identity, $identity);
  @override
  String toString() {
    return SideEffectSearchModelMapper.ensureInitialized()
        .stringifyValue(this as SideEffectSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SideEffectSearchModelMapper.ensureInitialized()
                .isValueEqual(this as SideEffectSearchModel, other));
  }

  @override
  int get hashCode {
    return SideEffectSearchModelMapper.ensureInitialized()
        .hashValue(this as SideEffectSearchModel);
  }
}

extension SideEffectSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SideEffectSearchModel, $Out> {
  SideEffectSearchModelCopyWith<$R, SideEffectSearchModel, $Out>
      get $asSideEffectSearchModel =>
          $base.as((v, t, t2) => _SideEffectSearchModelCopyWithImpl(v, t, t2));
}

abstract class SideEffectSearchModelCopyWith<
    $R,
    $In extends SideEffectSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskClientReferenceId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get symptoms;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      List<String>? taskClientReferenceId,
      String? projectId,
      int? reAttempts,
      List<String>? symptoms,
      List<String>? clientReferenceId,
      String? tenantId,
      String? boundaryCode});
  SideEffectSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SideEffectSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SideEffectSearchModel, $Out>
    implements SideEffectSearchModelCopyWith<$R, SideEffectSearchModel, $Out> {
  _SideEffectSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SideEffectSearchModel> $mapper =
      SideEffectSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskClientReferenceId => $value.taskClientReferenceId != null
          ? ListCopyWith(
              $value.taskClientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(taskClientReferenceId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get symptoms =>
      $value.symptoms != null
          ? ListCopyWith(
              $value.symptoms!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(symptoms: v))
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
          Object? taskClientReferenceId = $none,
          Object? projectId = $none,
          Object? reAttempts = $none,
          Object? symptoms = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (taskClientReferenceId != $none)
          #taskClientReferenceId: taskClientReferenceId,
        if (projectId != $none) #projectId: projectId,
        if (reAttempts != $none) #reAttempts: reAttempts,
        if (symptoms != $none) #symptoms: symptoms,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  SideEffectSearchModel $make(
          CopyWithData data) =>
      SideEffectSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          taskClientReferenceId: data.get(#taskClientReferenceId,
              or: $value.taskClientReferenceId),
          projectId: data.get(#projectId, or: $value.projectId),
          reAttempts: data.get(#reAttempts, or: $value.reAttempts),
          symptoms: data.get(#symptoms, or: $value.symptoms),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  SideEffectSearchModelCopyWith<$R2, SideEffectSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SideEffectSearchModelCopyWithImpl($value, $cast, t);
}

class SideEffectModelMapper extends SubClassMapperBase<SideEffectModel> {
  SideEffectModelMapper._();

  static SideEffectModelMapper? _instance;
  static SideEffectModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SideEffectModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SideEffectModel';

  static SideEffectAdditionalFields? _$additionalFields(SideEffectModel v) =>
      v.additionalFields;
  static const Field<SideEffectModel, SideEffectAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(SideEffectModel v) => v.id;
  static const Field<SideEffectModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(SideEffectModel v) => v.projectId;
  static const Field<SideEffectModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$taskClientReferenceId(SideEffectModel v) =>
      v.taskClientReferenceId;
  static const Field<SideEffectModel, String> _f$taskClientReferenceId =
      Field('taskClientReferenceId', _$taskClientReferenceId, opt: true);
  static int? _$reAttempts(SideEffectModel v) => v.reAttempts;
  static const Field<SideEffectModel, int> _f$reAttempts =
      Field('reAttempts', _$reAttempts, opt: true);
  static List<String>? _$symptoms(SideEffectModel v) => v.symptoms;
  static const Field<SideEffectModel, List<String>> _f$symptoms =
      Field('symptoms', _$symptoms, opt: true);
  static bool? _$nonRecoverableError(SideEffectModel v) =>
      v.nonRecoverableError;
  static const Field<SideEffectModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(SideEffectModel v) => v.clientReferenceId;
  static const Field<SideEffectModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(SideEffectModel v) => v.tenantId;
  static const Field<SideEffectModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(SideEffectModel v) => v.rowVersion;
  static const Field<SideEffectModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(SideEffectModel v) => v.auditDetails;
  static const Field<SideEffectModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(SideEffectModel v) =>
      v.clientAuditDetails;
  static const Field<SideEffectModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(SideEffectModel v) => v.isDeleted;
  static const Field<SideEffectModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<SideEffectModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #taskClientReferenceId: _f$taskClientReferenceId,
    #reAttempts: _f$reAttempts,
    #symptoms: _f$symptoms,
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

  static SideEffectModel _instantiate(DecodingData data) {
    return SideEffectModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        taskClientReferenceId: data.dec(_f$taskClientReferenceId),
        reAttempts: data.dec(_f$reAttempts),
        symptoms: data.dec(_f$symptoms),
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

  static SideEffectModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SideEffectModel>(map);
  }

  static SideEffectModel fromJson(String json) {
    return ensureInitialized().decodeJson<SideEffectModel>(json);
  }
}

mixin SideEffectModelMappable {
  String toJson() {
    return SideEffectModelMapper.ensureInitialized()
        .encodeJson<SideEffectModel>(this as SideEffectModel);
  }

  Map<String, dynamic> toMap() {
    return SideEffectModelMapper.ensureInitialized()
        .encodeMap<SideEffectModel>(this as SideEffectModel);
  }

  SideEffectModelCopyWith<SideEffectModel, SideEffectModel, SideEffectModel>
      get copyWith => _SideEffectModelCopyWithImpl(
          this as SideEffectModel, $identity, $identity);
  @override
  String toString() {
    return SideEffectModelMapper.ensureInitialized()
        .stringifyValue(this as SideEffectModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SideEffectModelMapper.ensureInitialized()
                .isValueEqual(this as SideEffectModel, other));
  }

  @override
  int get hashCode {
    return SideEffectModelMapper.ensureInitialized()
        .hashValue(this as SideEffectModel);
  }
}

extension SideEffectModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SideEffectModel, $Out> {
  SideEffectModelCopyWith<$R, SideEffectModel, $Out> get $asSideEffectModel =>
      $base.as((v, t, t2) => _SideEffectModelCopyWithImpl(v, t, t2));
}

abstract class SideEffectModelCopyWith<$R, $In extends SideEffectModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  SideEffectAdditionalFieldsCopyWith<$R, SideEffectAdditionalFields,
      SideEffectAdditionalFields>? get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get symptoms;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {SideEffectAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      String? taskClientReferenceId,
      int? reAttempts,
      List<String>? symptoms,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  SideEffectModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SideEffectModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SideEffectModel, $Out>
    implements SideEffectModelCopyWith<$R, SideEffectModel, $Out> {
  _SideEffectModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SideEffectModel> $mapper =
      SideEffectModelMapper.ensureInitialized();
  @override
  SideEffectAdditionalFieldsCopyWith<$R, SideEffectAdditionalFields,
          SideEffectAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get symptoms =>
      $value.symptoms != null
          ? ListCopyWith(
              $value.symptoms!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(symptoms: v))
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
          Object? projectId = $none,
          Object? taskClientReferenceId = $none,
          Object? reAttempts = $none,
          Object? symptoms = $none,
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
        if (projectId != $none) #projectId: projectId,
        if (taskClientReferenceId != $none)
          #taskClientReferenceId: taskClientReferenceId,
        if (reAttempts != $none) #reAttempts: reAttempts,
        if (symptoms != $none) #symptoms: symptoms,
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
  SideEffectModel $make(CopyWithData data) => SideEffectModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      taskClientReferenceId:
          data.get(#taskClientReferenceId, or: $value.taskClientReferenceId),
      reAttempts: data.get(#reAttempts, or: $value.reAttempts),
      symptoms: data.get(#symptoms, or: $value.symptoms),
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
  SideEffectModelCopyWith<$R2, SideEffectModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SideEffectModelCopyWithImpl($value, $cast, t);
}

class SideEffectAdditionalFieldsMapper
    extends SubClassMapperBase<SideEffectAdditionalFields> {
  SideEffectAdditionalFieldsMapper._();

  static SideEffectAdditionalFieldsMapper? _instance;
  static SideEffectAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SideEffectAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SideEffectAdditionalFields';

  static String _$schema(SideEffectAdditionalFields v) => v.schema;
  static const Field<SideEffectAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'SideEffect');
  static int _$version(SideEffectAdditionalFields v) => v.version;
  static const Field<SideEffectAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(SideEffectAdditionalFields v) =>
      v.fields;
  static const Field<SideEffectAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<SideEffectAdditionalFields> fields = const {
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

  static SideEffectAdditionalFields _instantiate(DecodingData data) {
    return SideEffectAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static SideEffectAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SideEffectAdditionalFields>(map);
  }

  static SideEffectAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<SideEffectAdditionalFields>(json);
  }
}

mixin SideEffectAdditionalFieldsMappable {
  String toJson() {
    return SideEffectAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<SideEffectAdditionalFields>(
            this as SideEffectAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return SideEffectAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<SideEffectAdditionalFields>(
            this as SideEffectAdditionalFields);
  }

  SideEffectAdditionalFieldsCopyWith<SideEffectAdditionalFields,
          SideEffectAdditionalFields, SideEffectAdditionalFields>
      get copyWith => _SideEffectAdditionalFieldsCopyWithImpl(
          this as SideEffectAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return SideEffectAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as SideEffectAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SideEffectAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as SideEffectAdditionalFields, other));
  }

  @override
  int get hashCode {
    return SideEffectAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as SideEffectAdditionalFields);
  }
}

extension SideEffectAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SideEffectAdditionalFields, $Out> {
  SideEffectAdditionalFieldsCopyWith<$R, SideEffectAdditionalFields, $Out>
      get $asSideEffectAdditionalFields => $base
          .as((v, t, t2) => _SideEffectAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class SideEffectAdditionalFieldsCopyWith<
    $R,
    $In extends SideEffectAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  SideEffectAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SideEffectAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SideEffectAdditionalFields, $Out>
    implements
        SideEffectAdditionalFieldsCopyWith<$R, SideEffectAdditionalFields,
            $Out> {
  _SideEffectAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SideEffectAdditionalFields> $mapper =
      SideEffectAdditionalFieldsMapper.ensureInitialized();
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
  SideEffectAdditionalFields $make(CopyWithData data) =>
      SideEffectAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  SideEffectAdditionalFieldsCopyWith<$R2, SideEffectAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SideEffectAdditionalFieldsCopyWithImpl($value, $cast, t);
}
