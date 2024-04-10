// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_staff.dart';

class ProjectStaffSearchModelMapper
    extends SubClassMapperBase<ProjectStaffSearchModel> {
  ProjectStaffSearchModelMapper._();

  static ProjectStaffSearchModelMapper? _instance;
  static ProjectStaffSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectStaffSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectStaffSearchModel';

  static String? _$id(ProjectStaffSearchModel v) => v.id;
  static const Field<ProjectStaffSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$staffId(ProjectStaffSearchModel v) => v.staffId;
  static const Field<ProjectStaffSearchModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$userId(ProjectStaffSearchModel v) => v.userId;
  static const Field<ProjectStaffSearchModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static String? _$projectId(ProjectStaffSearchModel v) => v.projectId;
  static const Field<ProjectStaffSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ProjectStaffSearchModel v) => v.tenantId;
  static const Field<ProjectStaffSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$startDate(ProjectStaffSearchModel v) => v.startDate;
  static const Field<ProjectStaffSearchModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectStaffSearchModel v) => v.endDate;
  static const Field<ProjectStaffSearchModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$boundaryCode(ProjectStaffSearchModel v) => v.boundaryCode;
  static const Field<ProjectStaffSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(ProjectStaffSearchModel v) =>
      v.auditDetails;
  static const Field<ProjectStaffSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(ProjectStaffSearchModel v) =>
      v.additionalFields;
  static const Field<ProjectStaffSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);
  static DateTime? _$startDateTime(ProjectStaffSearchModel v) =>
      v.startDateTime;
  static const Field<ProjectStaffSearchModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectStaffSearchModel v) => v.endDateTime;
  static const Field<ProjectStaffSearchModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectStaffSearchModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #userId: _f$userId,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
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

  static ProjectStaffSearchModel _instantiate(DecodingData data) {
    return ProjectStaffSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        userId: data.dec(_f$userId),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectStaffSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectStaffSearchModel>(map);
  }

  static ProjectStaffSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectStaffSearchModel>(json);
  }
}

mixin ProjectStaffSearchModelMappable {
  String toJson() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectStaffSearchModel>(this as ProjectStaffSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectStaffSearchModel>(this as ProjectStaffSearchModel);
  }

  ProjectStaffSearchModelCopyWith<ProjectStaffSearchModel,
          ProjectStaffSearchModel, ProjectStaffSearchModel>
      get copyWith => _ProjectStaffSearchModelCopyWithImpl(
          this as ProjectStaffSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectStaffSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectStaffSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectStaffSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectStaffSearchModel);
  }
}

extension ProjectStaffSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectStaffSearchModel, $Out> {
  ProjectStaffSearchModelCopyWith<$R, ProjectStaffSearchModel, $Out>
      get $asProjectStaffSearchModel => $base
          .as((v, t, t2) => _ProjectStaffSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectStaffSearchModelCopyWith<
    $R,
    $In extends ProjectStaffSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? staffId,
      String? userId,
      String? projectId,
      String? tenantId,
      int? startDate,
      int? endDate,
      String? boundaryCode});
  ProjectStaffSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectStaffSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectStaffSearchModel, $Out>
    implements
        ProjectStaffSearchModelCopyWith<$R, ProjectStaffSearchModel, $Out> {
  _ProjectStaffSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectStaffSearchModel> $mapper =
      ProjectStaffSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? staffId = $none,
          Object? userId = $none,
          Object? projectId = $none,
          Object? tenantId = $none,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (userId != $none) #userId: userId,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  ProjectStaffSearchModel $make(CopyWithData data) =>
      ProjectStaffSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          staffId: data.get(#staffId, or: $value.staffId),
          userId: data.get(#userId, or: $value.userId),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  ProjectStaffSearchModelCopyWith<$R2, ProjectStaffSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectStaffSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectStaffModelMapper extends SubClassMapperBase<ProjectStaffModel> {
  ProjectStaffModelMapper._();

  static ProjectStaffModelMapper? _instance;
  static ProjectStaffModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectStaffModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectStaffModel';

  static ProjectStaffAdditionalFields? _$additionalFields(
          ProjectStaffModel v) =>
      v.additionalFields;
  static const Field<ProjectStaffModel, ProjectStaffAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$id(ProjectStaffModel v) => v.id;
  static const Field<ProjectStaffModel, String> _f$id = Field('id', _$id);
  static String? _$staffId(ProjectStaffModel v) => v.staffId;
  static const Field<ProjectStaffModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$userId(ProjectStaffModel v) => v.userId;
  static const Field<ProjectStaffModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static String? _$projectId(ProjectStaffModel v) => v.projectId;
  static const Field<ProjectStaffModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$channel(ProjectStaffModel v) => v.channel;
  static const Field<ProjectStaffModel, String> _f$channel =
      Field('channel', _$channel, opt: true);
  static bool? _$nonRecoverableError(ProjectStaffModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectStaffModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectStaffModel v) => v.tenantId;
  static const Field<ProjectStaffModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectStaffModel v) => v.rowVersion;
  static const Field<ProjectStaffModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int? _$startDate(ProjectStaffModel v) => v.startDate;
  static const Field<ProjectStaffModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectStaffModel v) => v.endDate;
  static const Field<ProjectStaffModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static AuditDetails? _$auditDetails(ProjectStaffModel v) => v.auditDetails;
  static const Field<ProjectStaffModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectStaffModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectStaffModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectStaffModel v) => v.isDeleted;
  static const Field<ProjectStaffModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static DateTime? _$startDateTime(ProjectStaffModel v) => v.startDateTime;
  static const Field<ProjectStaffModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectStaffModel v) => v.endDateTime;
  static const Field<ProjectStaffModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectStaffModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #staffId: _f$staffId,
    #userId: _f$userId,
    #projectId: _f$projectId,
    #channel: _f$channel,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
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

  static ProjectStaffModel _instantiate(DecodingData data) {
    return ProjectStaffModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        userId: data.dec(_f$userId),
        projectId: data.dec(_f$projectId),
        channel: data.dec(_f$channel),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectStaffModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectStaffModel>(map);
  }

  static ProjectStaffModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectStaffModel>(json);
  }
}

mixin ProjectStaffModelMappable {
  String toJson() {
    return ProjectStaffModelMapper.ensureInitialized()
        .encodeJson<ProjectStaffModel>(this as ProjectStaffModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectStaffModelMapper.ensureInitialized()
        .encodeMap<ProjectStaffModel>(this as ProjectStaffModel);
  }

  ProjectStaffModelCopyWith<ProjectStaffModel, ProjectStaffModel,
          ProjectStaffModel>
      get copyWith => _ProjectStaffModelCopyWithImpl(
          this as ProjectStaffModel, $identity, $identity);
  @override
  String toString() {
    return ProjectStaffModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectStaffModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectStaffModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectStaffModel, other));
  }

  @override
  int get hashCode {
    return ProjectStaffModelMapper.ensureInitialized()
        .hashValue(this as ProjectStaffModel);
  }
}

extension ProjectStaffModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectStaffModel, $Out> {
  ProjectStaffModelCopyWith<$R, ProjectStaffModel, $Out>
      get $asProjectStaffModel =>
          $base.as((v, t, t2) => _ProjectStaffModelCopyWithImpl(v, t, t2));
}

abstract class ProjectStaffModelCopyWith<$R, $In extends ProjectStaffModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectStaffAdditionalFieldsCopyWith<$R, ProjectStaffAdditionalFields,
      ProjectStaffAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectStaffAdditionalFields? additionalFields,
      String? id,
      String? staffId,
      String? userId,
      String? projectId,
      String? channel,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      int? startDate,
      int? endDate,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectStaffModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectStaffModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectStaffModel, $Out>
    implements ProjectStaffModelCopyWith<$R, ProjectStaffModel, $Out> {
  _ProjectStaffModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectStaffModel> $mapper =
      ProjectStaffModelMapper.ensureInitialized();
  @override
  ProjectStaffAdditionalFieldsCopyWith<$R, ProjectStaffAdditionalFields,
          ProjectStaffAdditionalFields>?
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
          String? id,
          Object? staffId = $none,
          Object? userId = $none,
          Object? projectId = $none,
          Object? channel = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != null) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (userId != $none) #userId: userId,
        if (projectId != $none) #projectId: projectId,
        if (channel != $none) #channel: channel,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectStaffModel $make(CopyWithData data) => ProjectStaffModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      staffId: data.get(#staffId, or: $value.staffId),
      userId: data.get(#userId, or: $value.userId),
      projectId: data.get(#projectId, or: $value.projectId),
      channel: data.get(#channel, or: $value.channel),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectStaffModelCopyWith<$R2, ProjectStaffModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectStaffModelCopyWithImpl($value, $cast, t);
}

class ProjectStaffAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectStaffAdditionalFields> {
  ProjectStaffAdditionalFieldsMapper._();

  static ProjectStaffAdditionalFieldsMapper? _instance;
  static ProjectStaffAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectStaffAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectStaffAdditionalFields';

  static String _$schema(ProjectStaffAdditionalFields v) => v.schema;
  static const Field<ProjectStaffAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectStaff');
  static int _$version(ProjectStaffAdditionalFields v) => v.version;
  static const Field<ProjectStaffAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectStaffAdditionalFields v) =>
      v.fields;
  static const Field<ProjectStaffAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectStaffAdditionalFields> fields = const {
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

  static ProjectStaffAdditionalFields _instantiate(DecodingData data) {
    return ProjectStaffAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectStaffAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectStaffAdditionalFields>(map);
  }

  static ProjectStaffAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectStaffAdditionalFields>(json);
  }
}

mixin ProjectStaffAdditionalFieldsMappable {
  String toJson() {
    return ProjectStaffAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectStaffAdditionalFields>(
            this as ProjectStaffAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectStaffAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectStaffAdditionalFields>(
            this as ProjectStaffAdditionalFields);
  }

  ProjectStaffAdditionalFieldsCopyWith<ProjectStaffAdditionalFields,
          ProjectStaffAdditionalFields, ProjectStaffAdditionalFields>
      get copyWith => _ProjectStaffAdditionalFieldsCopyWithImpl(
          this as ProjectStaffAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectStaffAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectStaffAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectStaffAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as ProjectStaffAdditionalFields, other));
  }

  @override
  int get hashCode {
    return ProjectStaffAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectStaffAdditionalFields);
  }
}

extension ProjectStaffAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectStaffAdditionalFields, $Out> {
  ProjectStaffAdditionalFieldsCopyWith<$R, ProjectStaffAdditionalFields, $Out>
      get $asProjectStaffAdditionalFields => $base.as(
          (v, t, t2) => _ProjectStaffAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectStaffAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectStaffAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectStaffAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectStaffAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectStaffAdditionalFields, $Out>
    implements
        ProjectStaffAdditionalFieldsCopyWith<$R, ProjectStaffAdditionalFields,
            $Out> {
  _ProjectStaffAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectStaffAdditionalFields> $mapper =
      ProjectStaffAdditionalFieldsMapper.ensureInitialized();
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
  ProjectStaffAdditionalFields $make(CopyWithData data) =>
      ProjectStaffAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectStaffAdditionalFieldsCopyWith<$R2, ProjectStaffAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectStaffAdditionalFieldsCopyWithImpl($value, $cast, t);
}
