// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_type.dart';

class ProjectTypeModelMapper extends SubClassMapperBase<ProjectTypeModel> {
  ProjectTypeModelMapper._();

  static ProjectTypeModelMapper? _instance;
  static ProjectTypeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectTypeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectTypeModel';

  static ProjectTypeAdditionalFields? _$additionalFields(ProjectTypeModel v) =>
      v.additionalFields;
  static const Field<ProjectTypeModel, ProjectTypeAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(ProjectTypeModel v) => v.id;
  static const Field<ProjectTypeModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$name(ProjectTypeModel v) => v.name;
  static const Field<ProjectTypeModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$code(ProjectTypeModel v) => v.code;
  static const Field<ProjectTypeModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$group(ProjectTypeModel v) => v.group;
  static const Field<ProjectTypeModel, String> _f$group =
      Field('group', _$group, opt: true);
  static int? _$validMinAge(ProjectTypeModel v) => v.validMinAge;
  static const Field<ProjectTypeModel, int> _f$validMinAge =
      Field('validMinAge', _$validMinAge, opt: true);
  static int? _$validMaxAge(ProjectTypeModel v) => v.validMaxAge;
  static const Field<ProjectTypeModel, int> _f$validMaxAge =
      Field('validMaxAge', _$validMaxAge, opt: true);
  static BeneficiaryType? _$beneficiaryType(ProjectTypeModel v) =>
      v.beneficiaryType;
  static const Field<ProjectTypeModel, BeneficiaryType> _f$beneficiaryType =
      Field('beneficiaryType', _$beneficiaryType, opt: true);
  static List<String>? _$eligibilityCriteria(ProjectTypeModel v) =>
      v.eligibilityCriteria;
  static const Field<ProjectTypeModel, List<String>> _f$eligibilityCriteria =
      Field('eligibilityCriteria', _$eligibilityCriteria, opt: true);
  static List<ProjectCycle>? _$cycles(ProjectTypeModel v) => v.cycles;
  static const Field<ProjectTypeModel, List<ProjectCycle>> _f$cycles =
      Field('cycles', _$cycles, opt: true);
  static List<String>? _$taskProcedure(ProjectTypeModel v) => v.taskProcedure;
  static const Field<ProjectTypeModel, List<String>> _f$taskProcedure =
      Field('taskProcedure', _$taskProcedure, opt: true);
  static bool? _$nonRecoverableError(ProjectTypeModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectTypeModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectTypeModel v) => v.tenantId;
  static const Field<ProjectTypeModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectTypeModel v) => v.rowVersion;
  static const Field<ProjectTypeModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<ProjectProductVariantModel>? _$resources(ProjectTypeModel v) =>
      v.resources;
  static const Field<ProjectTypeModel, List<ProjectProductVariantModel>>
      _f$resources = Field('resources', _$resources, opt: true);
  static AuditDetails? _$auditDetails(ProjectTypeModel v) => v.auditDetails;
  static const Field<ProjectTypeModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(ProjectTypeModel v) =>
      v.clientAuditDetails;
  static const Field<ProjectTypeModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(ProjectTypeModel v) => v.isDeleted;
  static const Field<ProjectTypeModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<ProjectTypeModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #name: _f$name,
    #code: _f$code,
    #group: _f$group,
    #validMinAge: _f$validMinAge,
    #validMaxAge: _f$validMaxAge,
    #beneficiaryType: _f$beneficiaryType,
    #eligibilityCriteria: _f$eligibilityCriteria,
    #cycles: _f$cycles,
    #taskProcedure: _f$taskProcedure,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #resources: _f$resources,
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

  static ProjectTypeModel _instantiate(DecodingData data) {
    return ProjectTypeModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        code: data.dec(_f$code),
        group: data.dec(_f$group),
        validMinAge: data.dec(_f$validMinAge),
        validMaxAge: data.dec(_f$validMaxAge),
        beneficiaryType: data.dec(_f$beneficiaryType),
        eligibilityCriteria: data.dec(_f$eligibilityCriteria),
        cycles: data.dec(_f$cycles),
        taskProcedure: data.dec(_f$taskProcedure),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        resources: data.dec(_f$resources),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectTypeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectTypeModel>(map);
  }

  static ProjectTypeModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectTypeModel>(json);
  }
}

mixin ProjectTypeModelMappable {
  String toJson() {
    return ProjectTypeModelMapper.ensureInitialized()
        .encodeJson<ProjectTypeModel>(this as ProjectTypeModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectTypeModelMapper.ensureInitialized()
        .encodeMap<ProjectTypeModel>(this as ProjectTypeModel);
  }

  ProjectTypeModelCopyWith<ProjectTypeModel, ProjectTypeModel, ProjectTypeModel>
      get copyWith => _ProjectTypeModelCopyWithImpl(
          this as ProjectTypeModel, $identity, $identity);
  @override
  String toString() {
    return ProjectTypeModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectTypeModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectTypeModelMapper.ensureInitialized()
        .equalsValue(this as ProjectTypeModel, other);
  }

  @override
  int get hashCode {
    return ProjectTypeModelMapper.ensureInitialized()
        .hashValue(this as ProjectTypeModel);
  }
}

extension ProjectTypeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectTypeModel, $Out> {
  ProjectTypeModelCopyWith<$R, ProjectTypeModel, $Out>
      get $asProjectTypeModel =>
          $base.as((v, t, t2) => _ProjectTypeModelCopyWithImpl(v, t, t2));
}

abstract class ProjectTypeModelCopyWith<$R, $In extends ProjectTypeModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
      ProjectTypeAdditionalFields>? get additionalFields;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get eligibilityCriteria;
  ListCopyWith<$R, ProjectCycle,
      ProjectCycleCopyWith<$R, ProjectCycle, ProjectCycle>>? get cycles;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskProcedure;
  ListCopyWith<
      $R,
      ProjectProductVariantModel,
      ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
          ProjectProductVariantModel>>? get resources;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {ProjectTypeAdditionalFields? additionalFields,
      String? id,
      String? name,
      String? code,
      String? group,
      int? validMinAge,
      int? validMaxAge,
      BeneficiaryType? beneficiaryType,
      List<String>? eligibilityCriteria,
      List<ProjectCycle>? cycles,
      List<String>? taskProcedure,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      List<ProjectProductVariantModel>? resources,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  ProjectTypeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectTypeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectTypeModel, $Out>
    implements ProjectTypeModelCopyWith<$R, ProjectTypeModel, $Out> {
  _ProjectTypeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectTypeModel> $mapper =
      ProjectTypeModelMapper.ensureInitialized();
  @override
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
          ProjectTypeAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get eligibilityCriteria => $value.eligibilityCriteria != null
          ? ListCopyWith(
              $value.eligibilityCriteria!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(eligibilityCriteria: v))
          : null;
  @override
  ListCopyWith<$R, ProjectCycle,
          ProjectCycleCopyWith<$R, ProjectCycle, ProjectCycle>>?
      get cycles => $value.cycles != null
          ? ListCopyWith($value.cycles!, (v, t) => v.copyWith.$chain(t),
              (v) => call(cycles: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get taskProcedure => $value.taskProcedure != null
          ? ListCopyWith(
              $value.taskProcedure!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(taskProcedure: v))
          : null;
  @override
  ListCopyWith<
      $R,
      ProjectProductVariantModel,
      ProjectProductVariantModelCopyWith<$R, ProjectProductVariantModel,
          ProjectProductVariantModel>>? get resources =>
      $value.resources != null
          ? ListCopyWith($value.resources!, (v, t) => v.copyWith.$chain(t),
              (v) => call(resources: v))
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
          Object? name = $none,
          Object? code = $none,
          Object? group = $none,
          Object? validMinAge = $none,
          Object? validMaxAge = $none,
          Object? beneficiaryType = $none,
          Object? eligibilityCriteria = $none,
          Object? cycles = $none,
          Object? taskProcedure = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? resources = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (name != $none) #name: name,
        if (code != $none) #code: code,
        if (group != $none) #group: group,
        if (validMinAge != $none) #validMinAge: validMinAge,
        if (validMaxAge != $none) #validMaxAge: validMaxAge,
        if (beneficiaryType != $none) #beneficiaryType: beneficiaryType,
        if (eligibilityCriteria != $none)
          #eligibilityCriteria: eligibilityCriteria,
        if (cycles != $none) #cycles: cycles,
        if (taskProcedure != $none) #taskProcedure: taskProcedure,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (resources != $none) #resources: resources,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  ProjectTypeModel $make(CopyWithData data) => ProjectTypeModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      code: data.get(#code, or: $value.code),
      group: data.get(#group, or: $value.group),
      validMinAge: data.get(#validMinAge, or: $value.validMinAge),
      validMaxAge: data.get(#validMaxAge, or: $value.validMaxAge),
      beneficiaryType: data.get(#beneficiaryType, or: $value.beneficiaryType),
      eligibilityCriteria:
          data.get(#eligibilityCriteria, or: $value.eligibilityCriteria),
      cycles: data.get(#cycles, or: $value.cycles),
      taskProcedure: data.get(#taskProcedure, or: $value.taskProcedure),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      resources: data.get(#resources, or: $value.resources),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  ProjectTypeModelCopyWith<$R2, ProjectTypeModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectTypeModelCopyWithImpl($value, $cast, t);
}

class ProjectTypeAdditionalFieldsMapper
    extends SubClassMapperBase<ProjectTypeAdditionalFields> {
  ProjectTypeAdditionalFieldsMapper._();

  static ProjectTypeAdditionalFieldsMapper? _instance;
  static ProjectTypeAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectTypeAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectTypeAdditionalFields';

  static String _$schema(ProjectTypeAdditionalFields v) => v.schema;
  static const Field<ProjectTypeAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'ProjectType');
  static int _$version(ProjectTypeAdditionalFields v) => v.version;
  static const Field<ProjectTypeAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(ProjectTypeAdditionalFields v) =>
      v.fields;
  static const Field<ProjectTypeAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<ProjectTypeAdditionalFields> fields = const {
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

  static ProjectTypeAdditionalFields _instantiate(DecodingData data) {
    return ProjectTypeAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectTypeAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectTypeAdditionalFields>(map);
  }

  static ProjectTypeAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectTypeAdditionalFields>(json);
  }
}

mixin ProjectTypeAdditionalFieldsMappable {
  String toJson() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ProjectTypeAdditionalFields>(
            this as ProjectTypeAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ProjectTypeAdditionalFields>(
            this as ProjectTypeAdditionalFields);
  }

  ProjectTypeAdditionalFieldsCopyWith<ProjectTypeAdditionalFields,
          ProjectTypeAdditionalFields, ProjectTypeAdditionalFields>
      get copyWith => _ProjectTypeAdditionalFieldsCopyWithImpl(
          this as ProjectTypeAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ProjectTypeAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as ProjectTypeAdditionalFields, other);
  }

  @override
  int get hashCode {
    return ProjectTypeAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ProjectTypeAdditionalFields);
  }
}

extension ProjectTypeAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectTypeAdditionalFields, $Out> {
  ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields, $Out>
      get $asProjectTypeAdditionalFields => $base
          .as((v, t, t2) => _ProjectTypeAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ProjectTypeAdditionalFieldsCopyWith<
    $R,
    $In extends ProjectTypeAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  ProjectTypeAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectTypeAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectTypeAdditionalFields, $Out>
    implements
        ProjectTypeAdditionalFieldsCopyWith<$R, ProjectTypeAdditionalFields,
            $Out> {
  _ProjectTypeAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectTypeAdditionalFields> $mapper =
      ProjectTypeAdditionalFieldsMapper.ensureInitialized();
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
  ProjectTypeAdditionalFields $make(CopyWithData data) =>
      ProjectTypeAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  ProjectTypeAdditionalFieldsCopyWith<$R2, ProjectTypeAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectTypeAdditionalFieldsCopyWithImpl($value, $cast, t);
}

class ProjectCycleMapper extends ClassMapperBase<ProjectCycle> {
  ProjectCycleMapper._();

  static ProjectCycleMapper? _instance;
  static ProjectCycleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectCycleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectCycle';

  static int _$id(ProjectCycle v) => v.id;
  static const Field<ProjectCycle, int> _f$id = Field('id', _$id);
  static int _$startDate(ProjectCycle v) => v.startDate;
  static const Field<ProjectCycle, int> _f$startDate =
      Field('startDate', _$startDate);
  static int _$endDate(ProjectCycle v) => v.endDate;
  static const Field<ProjectCycle, int> _f$endDate =
      Field('endDate', _$endDate);
  static List<ProjectCycleDelivery>? _$deliveries(ProjectCycle v) =>
      v.deliveries;
  static const Field<ProjectCycle, List<ProjectCycleDelivery>> _f$deliveries =
      Field('deliveries', _$deliveries, opt: true);
  static int? _$mandatoryWaitSinceLastCycleInDays(ProjectCycle v) =>
      v.mandatoryWaitSinceLastCycleInDays;
  static const Field<ProjectCycle, int> _f$mandatoryWaitSinceLastCycleInDays =
      Field('mandatoryWaitSinceLastCycleInDays',
          _$mandatoryWaitSinceLastCycleInDays,
          opt: true);

  @override
  final MappableFields<ProjectCycle> fields = const {
    #id: _f$id,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #deliveries: _f$deliveries,
    #mandatoryWaitSinceLastCycleInDays: _f$mandatoryWaitSinceLastCycleInDays,
  };
  @override
  final bool ignoreNull = true;

  static ProjectCycle _instantiate(DecodingData data) {
    return ProjectCycle(
        id: data.dec(_f$id),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        deliveries: data.dec(_f$deliveries),
        mandatoryWaitSinceLastCycleInDays:
            data.dec(_f$mandatoryWaitSinceLastCycleInDays));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectCycle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectCycle>(map);
  }

  static ProjectCycle fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectCycle>(json);
  }
}

mixin ProjectCycleMappable {
  String toJson() {
    return ProjectCycleMapper.ensureInitialized()
        .encodeJson<ProjectCycle>(this as ProjectCycle);
  }

  Map<String, dynamic> toMap() {
    return ProjectCycleMapper.ensureInitialized()
        .encodeMap<ProjectCycle>(this as ProjectCycle);
  }

  ProjectCycleCopyWith<ProjectCycle, ProjectCycle, ProjectCycle> get copyWith =>
      _ProjectCycleCopyWithImpl(this as ProjectCycle, $identity, $identity);
  @override
  String toString() {
    return ProjectCycleMapper.ensureInitialized()
        .stringifyValue(this as ProjectCycle);
  }

  @override
  bool operator ==(Object other) {
    return ProjectCycleMapper.ensureInitialized()
        .equalsValue(this as ProjectCycle, other);
  }

  @override
  int get hashCode {
    return ProjectCycleMapper.ensureInitialized()
        .hashValue(this as ProjectCycle);
  }
}

extension ProjectCycleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectCycle, $Out> {
  ProjectCycleCopyWith<$R, ProjectCycle, $Out> get $asProjectCycle =>
      $base.as((v, t, t2) => _ProjectCycleCopyWithImpl(v, t, t2));
}

abstract class ProjectCycleCopyWith<$R, $In extends ProjectCycle, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ProjectCycleDelivery,
      ProjectCycleDeliveryCopyWith<$R, ProjectCycleDelivery,
          ProjectCycleDelivery>>? get deliveries;
  $R call(
      {int? id,
      int? startDate,
      int? endDate,
      List<ProjectCycleDelivery>? deliveries,
      int? mandatoryWaitSinceLastCycleInDays});
  ProjectCycleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectCycleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectCycle, $Out>
    implements ProjectCycleCopyWith<$R, ProjectCycle, $Out> {
  _ProjectCycleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectCycle> $mapper =
      ProjectCycleMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ProjectCycleDelivery,
      ProjectCycleDeliveryCopyWith<$R, ProjectCycleDelivery,
          ProjectCycleDelivery>>? get deliveries => $value.deliveries != null
      ? ListCopyWith($value.deliveries!, (v, t) => v.copyWith.$chain(t),
          (v) => call(deliveries: v))
      : null;
  @override
  $R call(
          {int? id,
          int? startDate,
          int? endDate,
          Object? deliveries = $none,
          Object? mandatoryWaitSinceLastCycleInDays = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (startDate != null) #startDate: startDate,
        if (endDate != null) #endDate: endDate,
        if (deliveries != $none) #deliveries: deliveries,
        if (mandatoryWaitSinceLastCycleInDays != $none)
          #mandatoryWaitSinceLastCycleInDays: mandatoryWaitSinceLastCycleInDays
      }));
  @override
  ProjectCycle $make(CopyWithData data) => ProjectCycle(
      id: data.get(#id, or: $value.id),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      deliveries: data.get(#deliveries, or: $value.deliveries),
      mandatoryWaitSinceLastCycleInDays: data.get(
          #mandatoryWaitSinceLastCycleInDays,
          or: $value.mandatoryWaitSinceLastCycleInDays));

  @override
  ProjectCycleCopyWith<$R2, ProjectCycle, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectCycleCopyWithImpl($value, $cast, t);
}

class ProjectCycleDeliveryMapper extends ClassMapperBase<ProjectCycleDelivery> {
  ProjectCycleDeliveryMapper._();

  static ProjectCycleDeliveryMapper? _instance;
  static ProjectCycleDeliveryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectCycleDeliveryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectCycleDelivery';

  static int _$id(ProjectCycleDelivery v) => v.id;
  static const Field<ProjectCycleDelivery, int> _f$id = Field('id', _$id);
  static String _$deliveryStrategy(ProjectCycleDelivery v) =>
      v.deliveryStrategy;
  static const Field<ProjectCycleDelivery, String> _f$deliveryStrategy =
      Field('deliveryStrategy', _$deliveryStrategy);
  static List<DeliveryDoseCriteria>? _$doseCriteria(ProjectCycleDelivery v) =>
      v.doseCriteria;
  static const Field<ProjectCycleDelivery, List<DeliveryDoseCriteria>>
      _f$doseCriteria = Field('doseCriteria', _$doseCriteria, opt: true);
  static int? _$mandatoryWaitSinceLastDeliveryInDays(ProjectCycleDelivery v) =>
      v.mandatoryWaitSinceLastDeliveryInDays;
  static const Field<ProjectCycleDelivery, int>
      _f$mandatoryWaitSinceLastDeliveryInDays = Field(
          'mandatoryWaitSinceLastDeliveryInDays',
          _$mandatoryWaitSinceLastDeliveryInDays,
          opt: true);

  @override
  final MappableFields<ProjectCycleDelivery> fields = const {
    #id: _f$id,
    #deliveryStrategy: _f$deliveryStrategy,
    #doseCriteria: _f$doseCriteria,
    #mandatoryWaitSinceLastDeliveryInDays:
        _f$mandatoryWaitSinceLastDeliveryInDays,
  };
  @override
  final bool ignoreNull = true;

  static ProjectCycleDelivery _instantiate(DecodingData data) {
    return ProjectCycleDelivery(
        id: data.dec(_f$id),
        deliveryStrategy: data.dec(_f$deliveryStrategy),
        doseCriteria: data.dec(_f$doseCriteria),
        mandatoryWaitSinceLastDeliveryInDays:
            data.dec(_f$mandatoryWaitSinceLastDeliveryInDays));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectCycleDelivery fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectCycleDelivery>(map);
  }

  static ProjectCycleDelivery fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectCycleDelivery>(json);
  }
}

mixin ProjectCycleDeliveryMappable {
  String toJson() {
    return ProjectCycleDeliveryMapper.ensureInitialized()
        .encodeJson<ProjectCycleDelivery>(this as ProjectCycleDelivery);
  }

  Map<String, dynamic> toMap() {
    return ProjectCycleDeliveryMapper.ensureInitialized()
        .encodeMap<ProjectCycleDelivery>(this as ProjectCycleDelivery);
  }

  ProjectCycleDeliveryCopyWith<ProjectCycleDelivery, ProjectCycleDelivery,
          ProjectCycleDelivery>
      get copyWith => _ProjectCycleDeliveryCopyWithImpl(
          this as ProjectCycleDelivery, $identity, $identity);
  @override
  String toString() {
    return ProjectCycleDeliveryMapper.ensureInitialized()
        .stringifyValue(this as ProjectCycleDelivery);
  }

  @override
  bool operator ==(Object other) {
    return ProjectCycleDeliveryMapper.ensureInitialized()
        .equalsValue(this as ProjectCycleDelivery, other);
  }

  @override
  int get hashCode {
    return ProjectCycleDeliveryMapper.ensureInitialized()
        .hashValue(this as ProjectCycleDelivery);
  }
}

extension ProjectCycleDeliveryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectCycleDelivery, $Out> {
  ProjectCycleDeliveryCopyWith<$R, ProjectCycleDelivery, $Out>
      get $asProjectCycleDelivery =>
          $base.as((v, t, t2) => _ProjectCycleDeliveryCopyWithImpl(v, t, t2));
}

abstract class ProjectCycleDeliveryCopyWith<
    $R,
    $In extends ProjectCycleDelivery,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      DeliveryDoseCriteria,
      DeliveryDoseCriteriaCopyWith<$R, DeliveryDoseCriteria,
          DeliveryDoseCriteria>>? get doseCriteria;
  $R call(
      {int? id,
      String? deliveryStrategy,
      List<DeliveryDoseCriteria>? doseCriteria,
      int? mandatoryWaitSinceLastDeliveryInDays});
  ProjectCycleDeliveryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectCycleDeliveryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectCycleDelivery, $Out>
    implements ProjectCycleDeliveryCopyWith<$R, ProjectCycleDelivery, $Out> {
  _ProjectCycleDeliveryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectCycleDelivery> $mapper =
      ProjectCycleDeliveryMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      DeliveryDoseCriteria,
      DeliveryDoseCriteriaCopyWith<$R, DeliveryDoseCriteria,
          DeliveryDoseCriteria>>? get doseCriteria =>
      $value.doseCriteria != null
          ? ListCopyWith($value.doseCriteria!, (v, t) => v.copyWith.$chain(t),
              (v) => call(doseCriteria: v))
          : null;
  @override
  $R call(
          {int? id,
          String? deliveryStrategy,
          Object? doseCriteria = $none,
          Object? mandatoryWaitSinceLastDeliveryInDays = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (deliveryStrategy != null) #deliveryStrategy: deliveryStrategy,
        if (doseCriteria != $none) #doseCriteria: doseCriteria,
        if (mandatoryWaitSinceLastDeliveryInDays != $none)
          #mandatoryWaitSinceLastDeliveryInDays:
              mandatoryWaitSinceLastDeliveryInDays
      }));
  @override
  ProjectCycleDelivery $make(CopyWithData data) => ProjectCycleDelivery(
      id: data.get(#id, or: $value.id),
      deliveryStrategy:
          data.get(#deliveryStrategy, or: $value.deliveryStrategy),
      doseCriteria: data.get(#doseCriteria, or: $value.doseCriteria),
      mandatoryWaitSinceLastDeliveryInDays: data.get(
          #mandatoryWaitSinceLastDeliveryInDays,
          or: $value.mandatoryWaitSinceLastDeliveryInDays));

  @override
  ProjectCycleDeliveryCopyWith<$R2, ProjectCycleDelivery, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectCycleDeliveryCopyWithImpl($value, $cast, t);
}

class DeliveryDoseCriteriaMapper extends ClassMapperBase<DeliveryDoseCriteria> {
  DeliveryDoseCriteriaMapper._();

  static DeliveryDoseCriteriaMapper? _instance;
  static DeliveryDoseCriteriaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeliveryDoseCriteriaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DeliveryDoseCriteria';

  static String? _$condition(DeliveryDoseCriteria v) => v.condition;
  static const Field<DeliveryDoseCriteria, String> _f$condition =
      Field('condition', _$condition, opt: true);
  static List<DeliveryProductVariant>? _$productVariants(
          DeliveryDoseCriteria v) =>
      v.productVariants;
  static const Field<DeliveryDoseCriteria, List<DeliveryProductVariant>>
      _f$productVariants = Field('productVariants', _$productVariants,
          key: 'ProductVariants', opt: true);
  static int? _$mandatoryWaitSinceLastDeliveryInDays(DeliveryDoseCriteria v) =>
      v.mandatoryWaitSinceLastDeliveryInDays;
  static const Field<DeliveryDoseCriteria, int>
      _f$mandatoryWaitSinceLastDeliveryInDays = Field(
          'mandatoryWaitSinceLastDeliveryInDays',
          _$mandatoryWaitSinceLastDeliveryInDays,
          opt: true);

  @override
  final MappableFields<DeliveryDoseCriteria> fields = const {
    #condition: _f$condition,
    #productVariants: _f$productVariants,
    #mandatoryWaitSinceLastDeliveryInDays:
        _f$mandatoryWaitSinceLastDeliveryInDays,
  };
  @override
  final bool ignoreNull = true;

  static DeliveryDoseCriteria _instantiate(DecodingData data) {
    return DeliveryDoseCriteria(
        condition: data.dec(_f$condition),
        productVariants: data.dec(_f$productVariants),
        mandatoryWaitSinceLastDeliveryInDays:
            data.dec(_f$mandatoryWaitSinceLastDeliveryInDays));
  }

  @override
  final Function instantiate = _instantiate;

  static DeliveryDoseCriteria fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeliveryDoseCriteria>(map);
  }

  static DeliveryDoseCriteria fromJson(String json) {
    return ensureInitialized().decodeJson<DeliveryDoseCriteria>(json);
  }
}

mixin DeliveryDoseCriteriaMappable {
  String toJson() {
    return DeliveryDoseCriteriaMapper.ensureInitialized()
        .encodeJson<DeliveryDoseCriteria>(this as DeliveryDoseCriteria);
  }

  Map<String, dynamic> toMap() {
    return DeliveryDoseCriteriaMapper.ensureInitialized()
        .encodeMap<DeliveryDoseCriteria>(this as DeliveryDoseCriteria);
  }

  DeliveryDoseCriteriaCopyWith<DeliveryDoseCriteria, DeliveryDoseCriteria,
          DeliveryDoseCriteria>
      get copyWith => _DeliveryDoseCriteriaCopyWithImpl(
          this as DeliveryDoseCriteria, $identity, $identity);
  @override
  String toString() {
    return DeliveryDoseCriteriaMapper.ensureInitialized()
        .stringifyValue(this as DeliveryDoseCriteria);
  }

  @override
  bool operator ==(Object other) {
    return DeliveryDoseCriteriaMapper.ensureInitialized()
        .equalsValue(this as DeliveryDoseCriteria, other);
  }

  @override
  int get hashCode {
    return DeliveryDoseCriteriaMapper.ensureInitialized()
        .hashValue(this as DeliveryDoseCriteria);
  }
}

extension DeliveryDoseCriteriaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeliveryDoseCriteria, $Out> {
  DeliveryDoseCriteriaCopyWith<$R, DeliveryDoseCriteria, $Out>
      get $asDeliveryDoseCriteria =>
          $base.as((v, t, t2) => _DeliveryDoseCriteriaCopyWithImpl(v, t, t2));
}

abstract class DeliveryDoseCriteriaCopyWith<
    $R,
    $In extends DeliveryDoseCriteria,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      DeliveryProductVariant,
      DeliveryProductVariantCopyWith<$R, DeliveryProductVariant,
          DeliveryProductVariant>>? get productVariants;
  $R call(
      {String? condition,
      List<DeliveryProductVariant>? productVariants,
      int? mandatoryWaitSinceLastDeliveryInDays});
  DeliveryDoseCriteriaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DeliveryDoseCriteriaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeliveryDoseCriteria, $Out>
    implements DeliveryDoseCriteriaCopyWith<$R, DeliveryDoseCriteria, $Out> {
  _DeliveryDoseCriteriaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeliveryDoseCriteria> $mapper =
      DeliveryDoseCriteriaMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      DeliveryProductVariant,
      DeliveryProductVariantCopyWith<$R, DeliveryProductVariant,
          DeliveryProductVariant>>? get productVariants =>
      $value.productVariants != null
          ? ListCopyWith($value.productVariants!,
              (v, t) => v.copyWith.$chain(t), (v) => call(productVariants: v))
          : null;
  @override
  $R call(
          {Object? condition = $none,
          Object? productVariants = $none,
          Object? mandatoryWaitSinceLastDeliveryInDays = $none}) =>
      $apply(FieldCopyWithData({
        if (condition != $none) #condition: condition,
        if (productVariants != $none) #productVariants: productVariants,
        if (mandatoryWaitSinceLastDeliveryInDays != $none)
          #mandatoryWaitSinceLastDeliveryInDays:
              mandatoryWaitSinceLastDeliveryInDays
      }));
  @override
  DeliveryDoseCriteria $make(CopyWithData data) => DeliveryDoseCriteria(
      condition: data.get(#condition, or: $value.condition),
      productVariants: data.get(#productVariants, or: $value.productVariants),
      mandatoryWaitSinceLastDeliveryInDays: data.get(
          #mandatoryWaitSinceLastDeliveryInDays,
          or: $value.mandatoryWaitSinceLastDeliveryInDays));

  @override
  DeliveryDoseCriteriaCopyWith<$R2, DeliveryDoseCriteria, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DeliveryDoseCriteriaCopyWithImpl($value, $cast, t);
}

class DeliveryProductVariantMapper
    extends ClassMapperBase<DeliveryProductVariant> {
  DeliveryProductVariantMapper._();

  static DeliveryProductVariantMapper? _instance;
  static DeliveryProductVariantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeliveryProductVariantMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DeliveryProductVariant';

  static int? _$quantity(DeliveryProductVariant v) => v.quantity;
  static const Field<DeliveryProductVariant, int> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static String _$productVariantId(DeliveryProductVariant v) =>
      v.productVariantId;
  static const Field<DeliveryProductVariant, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId);
  static String _$name(DeliveryProductVariant v) => v.name;
  static const Field<DeliveryProductVariant, String> _f$name =
      Field('name', _$name);

  @override
  final MappableFields<DeliveryProductVariant> fields = const {
    #quantity: _f$quantity,
    #productVariantId: _f$productVariantId,
    #name: _f$name,
  };
  @override
  final bool ignoreNull = true;

  static DeliveryProductVariant _instantiate(DecodingData data) {
    return DeliveryProductVariant(
        quantity: data.dec(_f$quantity),
        productVariantId: data.dec(_f$productVariantId),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static DeliveryProductVariant fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DeliveryProductVariant>(map);
  }

  static DeliveryProductVariant fromJson(String json) {
    return ensureInitialized().decodeJson<DeliveryProductVariant>(json);
  }
}

mixin DeliveryProductVariantMappable {
  String toJson() {
    return DeliveryProductVariantMapper.ensureInitialized()
        .encodeJson<DeliveryProductVariant>(this as DeliveryProductVariant);
  }

  Map<String, dynamic> toMap() {
    return DeliveryProductVariantMapper.ensureInitialized()
        .encodeMap<DeliveryProductVariant>(this as DeliveryProductVariant);
  }

  DeliveryProductVariantCopyWith<DeliveryProductVariant, DeliveryProductVariant,
          DeliveryProductVariant>
      get copyWith => _DeliveryProductVariantCopyWithImpl(
          this as DeliveryProductVariant, $identity, $identity);
  @override
  String toString() {
    return DeliveryProductVariantMapper.ensureInitialized()
        .stringifyValue(this as DeliveryProductVariant);
  }

  @override
  bool operator ==(Object other) {
    return DeliveryProductVariantMapper.ensureInitialized()
        .equalsValue(this as DeliveryProductVariant, other);
  }

  @override
  int get hashCode {
    return DeliveryProductVariantMapper.ensureInitialized()
        .hashValue(this as DeliveryProductVariant);
  }
}

extension DeliveryProductVariantValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DeliveryProductVariant, $Out> {
  DeliveryProductVariantCopyWith<$R, DeliveryProductVariant, $Out>
      get $asDeliveryProductVariant =>
          $base.as((v, t, t2) => _DeliveryProductVariantCopyWithImpl(v, t, t2));
}

abstract class DeliveryProductVariantCopyWith<
    $R,
    $In extends DeliveryProductVariant,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? quantity, String? productVariantId, String? name});
  DeliveryProductVariantCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DeliveryProductVariantCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DeliveryProductVariant, $Out>
    implements
        DeliveryProductVariantCopyWith<$R, DeliveryProductVariant, $Out> {
  _DeliveryProductVariantCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DeliveryProductVariant> $mapper =
      DeliveryProductVariantMapper.ensureInitialized();
  @override
  $R call({Object? quantity = $none, String? productVariantId, String? name}) =>
      $apply(FieldCopyWithData({
        if (quantity != $none) #quantity: quantity,
        if (productVariantId != null) #productVariantId: productVariantId,
        if (name != null) #name: name
      }));
  @override
  DeliveryProductVariant $make(CopyWithData data) => DeliveryProductVariant(
      quantity: data.get(#quantity, or: $value.quantity),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      name: data.get(#name, or: $value.name));

  @override
  DeliveryProductVariantCopyWith<$R2, DeliveryProductVariant, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DeliveryProductVariantCopyWithImpl($value, $cast, t);
}
