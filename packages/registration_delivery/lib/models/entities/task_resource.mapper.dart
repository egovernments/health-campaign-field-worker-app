// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_resource.dart';

class TaskResourceSearchModelMapper
    extends SubClassMapperBase<TaskResourceSearchModel> {
  TaskResourceSearchModelMapper._();

  static TaskResourceSearchModelMapper? _instance;
  static TaskResourceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TaskResourceSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskResourceSearchModel';

  static String? _$id(TaskResourceSearchModel v) => v.id;
  static const Field<TaskResourceSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(TaskResourceSearchModel v) => v.tenantId;
  static const Field<TaskResourceSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$boundaryCode(TaskResourceSearchModel v) => v.boundaryCode;
  static const Field<TaskResourceSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(TaskResourceSearchModel v) =>
      v.auditDetails;
  static const Field<TaskResourceSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(TaskResourceSearchModel v) =>
      v.additionalFields;
  static const Field<TaskResourceSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<TaskResourceSearchModel> fields = const {
    #id: _f$id,
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

  static TaskResourceSearchModel _instantiate(DecodingData data) {
    return TaskResourceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskResourceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskResourceSearchModel>(map);
  }

  static TaskResourceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskResourceSearchModel>(json);
  }
}

mixin TaskResourceSearchModelMappable {
  String toJson() {
    return TaskResourceSearchModelMapper.ensureInitialized()
        .encodeJson<TaskResourceSearchModel>(this as TaskResourceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return TaskResourceSearchModelMapper.ensureInitialized()
        .encodeMap<TaskResourceSearchModel>(this as TaskResourceSearchModel);
  }

  TaskResourceSearchModelCopyWith<TaskResourceSearchModel,
          TaskResourceSearchModel, TaskResourceSearchModel>
      get copyWith => _TaskResourceSearchModelCopyWithImpl(
          this as TaskResourceSearchModel, $identity, $identity);
  @override
  String toString() {
    return TaskResourceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as TaskResourceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TaskResourceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as TaskResourceSearchModel, other));
  }

  @override
  int get hashCode {
    return TaskResourceSearchModelMapper.ensureInitialized()
        .hashValue(this as TaskResourceSearchModel);
  }
}

extension TaskResourceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskResourceSearchModel, $Out> {
  TaskResourceSearchModelCopyWith<$R, TaskResourceSearchModel, $Out>
      get $asTaskResourceSearchModel => $base
          .as((v, t, t2) => _TaskResourceSearchModelCopyWithImpl(v, t, t2));
}

abstract class TaskResourceSearchModelCopyWith<
    $R,
    $In extends TaskResourceSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? tenantId, String? boundaryCode});
  TaskResourceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskResourceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskResourceSearchModel, $Out>
    implements
        TaskResourceSearchModelCopyWith<$R, TaskResourceSearchModel, $Out> {
  _TaskResourceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskResourceSearchModel> $mapper =
      TaskResourceSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  TaskResourceSearchModel $make(CopyWithData data) =>
      TaskResourceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  TaskResourceSearchModelCopyWith<$R2, TaskResourceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TaskResourceSearchModelCopyWithImpl($value, $cast, t);
}

class TaskResourceModelMapper extends SubClassMapperBase<TaskResourceModel> {
  TaskResourceModelMapper._();

  static TaskResourceModelMapper? _instance;
  static TaskResourceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskResourceModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskResourceModel';

  static TaskResourceAdditionalFields? _$additionalFields(
          TaskResourceModel v) =>
      v.additionalFields;
  static const Field<TaskResourceModel, TaskResourceAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String _$clientReferenceId(TaskResourceModel v) => v.clientReferenceId;
  static const Field<TaskResourceModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$taskclientReferenceId(TaskResourceModel v) =>
      v.taskclientReferenceId;
  static const Field<TaskResourceModel, String> _f$taskclientReferenceId =
      Field('taskclientReferenceId', _$taskclientReferenceId, opt: true);
  static String? _$taskId(TaskResourceModel v) => v.taskId;
  static const Field<TaskResourceModel, String> _f$taskId =
      Field('taskId', _$taskId, opt: true);
  static String? _$id(TaskResourceModel v) => v.id;
  static const Field<TaskResourceModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$productVariantId(TaskResourceModel v) => v.productVariantId;
  static const Field<TaskResourceModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$quantity(TaskResourceModel v) => v.quantity;
  static const Field<TaskResourceModel, String> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static bool? _$isDelivered(TaskResourceModel v) => v.isDelivered;
  static const Field<TaskResourceModel, bool> _f$isDelivered =
      Field('isDelivered', _$isDelivered, opt: true);
  static String? _$deliveryComment(TaskResourceModel v) => v.deliveryComment;
  static const Field<TaskResourceModel, String> _f$deliveryComment =
      Field('deliveryComment', _$deliveryComment, opt: true);
  static bool? _$nonRecoverableError(TaskResourceModel v) =>
      v.nonRecoverableError;
  static const Field<TaskResourceModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(TaskResourceModel v) => v.tenantId;
  static const Field<TaskResourceModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(TaskResourceModel v) => v.rowVersion;
  static const Field<TaskResourceModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(TaskResourceModel v) => v.auditDetails;
  static const Field<TaskResourceModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(TaskResourceModel v) =>
      v.clientAuditDetails;
  static const Field<TaskResourceModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(TaskResourceModel v) => v.isDeleted;
  static const Field<TaskResourceModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<TaskResourceModel> fields = const {
    #additionalFields: _f$additionalFields,
    #clientReferenceId: _f$clientReferenceId,
    #taskclientReferenceId: _f$taskclientReferenceId,
    #taskId: _f$taskId,
    #id: _f$id,
    #productVariantId: _f$productVariantId,
    #quantity: _f$quantity,
    #isDelivered: _f$isDelivered,
    #deliveryComment: _f$deliveryComment,
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

  static TaskResourceModel _instantiate(DecodingData data) {
    return TaskResourceModel(
        additionalFields: data.dec(_f$additionalFields),
        clientReferenceId: data.dec(_f$clientReferenceId),
        taskclientReferenceId: data.dec(_f$taskclientReferenceId),
        taskId: data.dec(_f$taskId),
        id: data.dec(_f$id),
        productVariantId: data.dec(_f$productVariantId),
        quantity: data.dec(_f$quantity),
        isDelivered: data.dec(_f$isDelivered),
        deliveryComment: data.dec(_f$deliveryComment),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskResourceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskResourceModel>(map);
  }

  static TaskResourceModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskResourceModel>(json);
  }
}

mixin TaskResourceModelMappable {
  String toJson() {
    return TaskResourceModelMapper.ensureInitialized()
        .encodeJson<TaskResourceModel>(this as TaskResourceModel);
  }

  Map<String, dynamic> toMap() {
    return TaskResourceModelMapper.ensureInitialized()
        .encodeMap<TaskResourceModel>(this as TaskResourceModel);
  }

  TaskResourceModelCopyWith<TaskResourceModel, TaskResourceModel,
          TaskResourceModel>
      get copyWith => _TaskResourceModelCopyWithImpl(
          this as TaskResourceModel, $identity, $identity);
  @override
  String toString() {
    return TaskResourceModelMapper.ensureInitialized()
        .stringifyValue(this as TaskResourceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TaskResourceModelMapper.ensureInitialized()
                .isValueEqual(this as TaskResourceModel, other));
  }

  @override
  int get hashCode {
    return TaskResourceModelMapper.ensureInitialized()
        .hashValue(this as TaskResourceModel);
  }
}

extension TaskResourceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskResourceModel, $Out> {
  TaskResourceModelCopyWith<$R, TaskResourceModel, $Out>
      get $asTaskResourceModel =>
          $base.as((v, t, t2) => _TaskResourceModelCopyWithImpl(v, t, t2));
}

abstract class TaskResourceModelCopyWith<$R, $In extends TaskResourceModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  TaskResourceAdditionalFieldsCopyWith<$R, TaskResourceAdditionalFields,
      TaskResourceAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {TaskResourceAdditionalFields? additionalFields,
      String? clientReferenceId,
      String? taskclientReferenceId,
      String? taskId,
      String? id,
      String? productVariantId,
      String? quantity,
      bool? isDelivered,
      String? deliveryComment,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  TaskResourceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskResourceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskResourceModel, $Out>
    implements TaskResourceModelCopyWith<$R, TaskResourceModel, $Out> {
  _TaskResourceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskResourceModel> $mapper =
      TaskResourceModelMapper.ensureInitialized();
  @override
  TaskResourceAdditionalFieldsCopyWith<$R, TaskResourceAdditionalFields,
          TaskResourceAdditionalFields>?
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
          String? clientReferenceId,
          Object? taskclientReferenceId = $none,
          Object? taskId = $none,
          Object? id = $none,
          Object? productVariantId = $none,
          Object? quantity = $none,
          Object? isDelivered = $none,
          Object? deliveryComment = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (taskclientReferenceId != $none)
          #taskclientReferenceId: taskclientReferenceId,
        if (taskId != $none) #taskId: taskId,
        if (id != $none) #id: id,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (quantity != $none) #quantity: quantity,
        if (isDelivered != $none) #isDelivered: isDelivered,
        if (deliveryComment != $none) #deliveryComment: deliveryComment,
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
  TaskResourceModel $make(CopyWithData data) => TaskResourceModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      taskclientReferenceId:
          data.get(#taskclientReferenceId, or: $value.taskclientReferenceId),
      taskId: data.get(#taskId, or: $value.taskId),
      id: data.get(#id, or: $value.id),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      quantity: data.get(#quantity, or: $value.quantity),
      isDelivered: data.get(#isDelivered, or: $value.isDelivered),
      deliveryComment: data.get(#deliveryComment, or: $value.deliveryComment),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  TaskResourceModelCopyWith<$R2, TaskResourceModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskResourceModelCopyWithImpl($value, $cast, t);
}

class TaskResourceAdditionalFieldsMapper
    extends SubClassMapperBase<TaskResourceAdditionalFields> {
  TaskResourceAdditionalFieldsMapper._();

  static TaskResourceAdditionalFieldsMapper? _instance;
  static TaskResourceAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TaskResourceAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskResourceAdditionalFields';

  static String _$schema(TaskResourceAdditionalFields v) => v.schema;
  static const Field<TaskResourceAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'TaskResource');
  static int _$version(TaskResourceAdditionalFields v) => v.version;
  static const Field<TaskResourceAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(TaskResourceAdditionalFields v) =>
      v.fields;
  static const Field<TaskResourceAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<TaskResourceAdditionalFields> fields = const {
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

  static TaskResourceAdditionalFields _instantiate(DecodingData data) {
    return TaskResourceAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskResourceAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskResourceAdditionalFields>(map);
  }

  static TaskResourceAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<TaskResourceAdditionalFields>(json);
  }
}

mixin TaskResourceAdditionalFieldsMappable {
  String toJson() {
    return TaskResourceAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<TaskResourceAdditionalFields>(
            this as TaskResourceAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return TaskResourceAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<TaskResourceAdditionalFields>(
            this as TaskResourceAdditionalFields);
  }

  TaskResourceAdditionalFieldsCopyWith<TaskResourceAdditionalFields,
          TaskResourceAdditionalFields, TaskResourceAdditionalFields>
      get copyWith => _TaskResourceAdditionalFieldsCopyWithImpl(
          this as TaskResourceAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return TaskResourceAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as TaskResourceAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TaskResourceAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as TaskResourceAdditionalFields, other));
  }

  @override
  int get hashCode {
    return TaskResourceAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as TaskResourceAdditionalFields);
  }
}

extension TaskResourceAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskResourceAdditionalFields, $Out> {
  TaskResourceAdditionalFieldsCopyWith<$R, TaskResourceAdditionalFields, $Out>
      get $asTaskResourceAdditionalFields => $base.as(
          (v, t, t2) => _TaskResourceAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class TaskResourceAdditionalFieldsCopyWith<
    $R,
    $In extends TaskResourceAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  TaskResourceAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskResourceAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskResourceAdditionalFields, $Out>
    implements
        TaskResourceAdditionalFieldsCopyWith<$R, TaskResourceAdditionalFields,
            $Out> {
  _TaskResourceAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskResourceAdditionalFields> $mapper =
      TaskResourceAdditionalFieldsMapper.ensureInitialized();
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
  TaskResourceAdditionalFields $make(CopyWithData data) =>
      TaskResourceAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  TaskResourceAdditionalFieldsCopyWith<$R2, TaskResourceAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TaskResourceAdditionalFieldsCopyWithImpl($value, $cast, t);
}
