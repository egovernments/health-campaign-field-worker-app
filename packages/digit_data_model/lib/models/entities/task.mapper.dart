// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task.dart';

class TaskSearchModelMapper extends SubClassMapperBase<TaskSearchModel> {
  TaskSearchModelMapper._();

  static TaskSearchModelMapper? _instance;
  static TaskSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskSearchModel';

  static List<String>? _$id(TaskSearchModel v) => v.id;
  static const Field<TaskSearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectId(TaskSearchModel v) => v.projectId;
  static const Field<TaskSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static List<String>? _$projectBeneficiaryId(TaskSearchModel v) =>
      v.projectBeneficiaryId;
  static const Field<TaskSearchModel, List<String>> _f$projectBeneficiaryId =
      Field('projectBeneficiaryId', _$projectBeneficiaryId, opt: true);
  static List<String>? _$projectBeneficiaryClientReferenceId(
          TaskSearchModel v) =>
      v.projectBeneficiaryClientReferenceId;
  static const Field<TaskSearchModel, List<String>>
      _f$projectBeneficiaryClientReferenceId = Field(
          'projectBeneficiaryClientReferenceId',
          _$projectBeneficiaryClientReferenceId,
          opt: true);
  static String? _$createdBy(TaskSearchModel v) => v.createdBy;
  static const Field<TaskSearchModel, String> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static String? _$status(TaskSearchModel v) => v.status;
  static const Field<TaskSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static int? _$offset(TaskSearchModel v) => v.offset;
  static const Field<TaskSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static int? _$limit(TaskSearchModel v) => v.limit;
  static const Field<TaskSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static List<String>? _$clientReferenceId(TaskSearchModel v) =>
      v.clientReferenceId;
  static const Field<TaskSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(TaskSearchModel v) => v.tenantId;
  static const Field<TaskSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$plannedStartDate(TaskSearchModel v) => v.plannedStartDate;
  static const Field<TaskSearchModel, int> _f$plannedStartDate =
      Field('plannedStartDate', _$plannedStartDate, opt: true);
  static int? _$plannedEndDate(TaskSearchModel v) => v.plannedEndDate;
  static const Field<TaskSearchModel, int> _f$plannedEndDate =
      Field('plannedEndDate', _$plannedEndDate, opt: true);
  static int? _$actualStartDate(TaskSearchModel v) => v.actualStartDate;
  static const Field<TaskSearchModel, int> _f$actualStartDate =
      Field('actualStartDate', _$actualStartDate, opt: true);
  static int? _$actualEndDate(TaskSearchModel v) => v.actualEndDate;
  static const Field<TaskSearchModel, int> _f$actualEndDate =
      Field('actualEndDate', _$actualEndDate, opt: true);
  static String? _$boundaryCode(TaskSearchModel v) => v.boundaryCode;
  static const Field<TaskSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(TaskSearchModel v) => v.auditDetails;
  static const Field<TaskSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(TaskSearchModel v) =>
      v.additionalFields;
  static const Field<TaskSearchModel, AdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);
  static DateTime? _$plannedStartDateTime(TaskSearchModel v) =>
      v.plannedStartDateTime;
  static const Field<TaskSearchModel, DateTime> _f$plannedStartDateTime = Field(
      'plannedStartDateTime', _$plannedStartDateTime,
      mode: FieldMode.member);
  static DateTime? _$plannedEndDateTime(TaskSearchModel v) =>
      v.plannedEndDateTime;
  static const Field<TaskSearchModel, DateTime> _f$plannedEndDateTime =
      Field('plannedEndDateTime', _$plannedEndDateTime, mode: FieldMode.member);
  static DateTime? _$actualStartDateTime(TaskSearchModel v) =>
      v.actualStartDateTime;
  static const Field<TaskSearchModel, DateTime> _f$actualStartDateTime = Field(
      'actualStartDateTime', _$actualStartDateTime,
      mode: FieldMode.member);
  static DateTime? _$actualEndDateTime(TaskSearchModel v) =>
      v.actualEndDateTime;
  static const Field<TaskSearchModel, DateTime> _f$actualEndDateTime =
      Field('actualEndDateTime', _$actualEndDateTime, mode: FieldMode.member);

  @override
  final MappableFields<TaskSearchModel> fields = const {
    #id: _f$id,
    #projectId: _f$projectId,
    #projectBeneficiaryId: _f$projectBeneficiaryId,
    #projectBeneficiaryClientReferenceId:
        _f$projectBeneficiaryClientReferenceId,
    #createdBy: _f$createdBy,
    #status: _f$status,
    #offset: _f$offset,
    #limit: _f$limit,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #plannedStartDate: _f$plannedStartDate,
    #plannedEndDate: _f$plannedEndDate,
    #actualStartDate: _f$actualStartDate,
    #actualEndDate: _f$actualEndDate,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
    #plannedStartDateTime: _f$plannedStartDateTime,
    #plannedEndDateTime: _f$plannedEndDateTime,
    #actualStartDateTime: _f$actualStartDateTime,
    #actualEndDateTime: _f$actualEndDateTime,
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

  static TaskSearchModel _instantiate(DecodingData data) {
    return TaskSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        projectBeneficiaryId: data.dec(_f$projectBeneficiaryId),
        projectBeneficiaryClientReferenceId:
            data.dec(_f$projectBeneficiaryClientReferenceId),
        createdBy: data.dec(_f$createdBy),
        status: data.dec(_f$status),
        offset: data.dec(_f$offset),
        limit: data.dec(_f$limit),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        plannedStartDate: data.dec(_f$plannedStartDate),
        plannedEndDate: data.dec(_f$plannedEndDate),
        actualStartDate: data.dec(_f$actualStartDate),
        actualEndDate: data.dec(_f$actualEndDate),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskSearchModel>(map);
  }

  static TaskSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskSearchModel>(json);
  }
}

mixin TaskSearchModelMappable {
  String toJson() {
    return TaskSearchModelMapper.ensureInitialized()
        .encodeJson<TaskSearchModel>(this as TaskSearchModel);
  }

  Map<String, dynamic> toMap() {
    return TaskSearchModelMapper.ensureInitialized()
        .encodeMap<TaskSearchModel>(this as TaskSearchModel);
  }

  TaskSearchModelCopyWith<TaskSearchModel, TaskSearchModel, TaskSearchModel>
      get copyWith => _TaskSearchModelCopyWithImpl(
          this as TaskSearchModel, $identity, $identity);
  @override
  String toString() {
    return TaskSearchModelMapper.ensureInitialized()
        .stringifyValue(this as TaskSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return TaskSearchModelMapper.ensureInitialized()
        .equalsValue(this as TaskSearchModel, other);
  }

  @override
  int get hashCode {
    return TaskSearchModelMapper.ensureInitialized()
        .hashValue(this as TaskSearchModel);
  }
}

extension TaskSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskSearchModel, $Out> {
  TaskSearchModelCopyWith<$R, TaskSearchModel, $Out> get $asTaskSearchModel =>
      $base.as((v, t, t2) => _TaskSearchModelCopyWithImpl(v, t, t2));
}

abstract class TaskSearchModelCopyWith<$R, $In extends TaskSearchModel, $Out>
    implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryClientReferenceId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {List<String>? id,
      String? projectId,
      List<String>? projectBeneficiaryId,
      List<String>? projectBeneficiaryClientReferenceId,
      String? createdBy,
      String? status,
      int? offset,
      int? limit,
      List<String>? clientReferenceId,
      String? tenantId,
      int? plannedStartDate,
      int? plannedEndDate,
      int? actualStartDate,
      int? actualEndDate,
      String? boundaryCode});
  TaskSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskSearchModel, $Out>
    implements TaskSearchModelCopyWith<$R, TaskSearchModel, $Out> {
  _TaskSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskSearchModel> $mapper =
      TaskSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryId => $value.projectBeneficiaryId != null
          ? ListCopyWith(
              $value.projectBeneficiaryId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(projectBeneficiaryId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get projectBeneficiaryClientReferenceId =>
          $value.projectBeneficiaryClientReferenceId != null
              ? ListCopyWith(
                  $value.projectBeneficiaryClientReferenceId!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(projectBeneficiaryClientReferenceId: v))
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
          Object? projectId = $none,
          Object? projectBeneficiaryId = $none,
          Object? projectBeneficiaryClientReferenceId = $none,
          Object? createdBy = $none,
          Object? status = $none,
          Object? offset = $none,
          Object? limit = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none,
          Object? plannedStartDate = $none,
          Object? plannedEndDate = $none,
          Object? actualStartDate = $none,
          Object? actualEndDate = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (projectBeneficiaryId != $none)
          #projectBeneficiaryId: projectBeneficiaryId,
        if (projectBeneficiaryClientReferenceId != $none)
          #projectBeneficiaryClientReferenceId:
              projectBeneficiaryClientReferenceId,
        if (createdBy != $none) #createdBy: createdBy,
        if (status != $none) #status: status,
        if (offset != $none) #offset: offset,
        if (limit != $none) #limit: limit,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (plannedStartDate != $none) #plannedStartDate: plannedStartDate,
        if (plannedEndDate != $none) #plannedEndDate: plannedEndDate,
        if (actualStartDate != $none) #actualStartDate: actualStartDate,
        if (actualEndDate != $none) #actualEndDate: actualEndDate,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  TaskSearchModel $make(CopyWithData data) => TaskSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      projectBeneficiaryId:
          data.get(#projectBeneficiaryId, or: $value.projectBeneficiaryId),
      projectBeneficiaryClientReferenceId: data.get(
          #projectBeneficiaryClientReferenceId,
          or: $value.projectBeneficiaryClientReferenceId),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      status: data.get(#status, or: $value.status),
      offset: data.get(#offset, or: $value.offset),
      limit: data.get(#limit, or: $value.limit),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      plannedStartDate:
          data.get(#plannedStartDate, or: $value.plannedStartDate),
      plannedEndDate: data.get(#plannedEndDate, or: $value.plannedEndDate),
      actualStartDate: data.get(#actualStartDate, or: $value.actualStartDate),
      actualEndDate: data.get(#actualEndDate, or: $value.actualEndDate),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  TaskSearchModelCopyWith<$R2, TaskSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskSearchModelCopyWithImpl($value, $cast, t);
}

class TaskModelMapper extends SubClassMapperBase<TaskModel> {
  TaskModelMapper._();

  static TaskModelMapper? _instance;
  static TaskModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskModel';

  static TaskAdditionalFields? _$additionalFields(TaskModel v) =>
      v.additionalFields;
  static const Field<TaskModel, TaskAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(TaskModel v) => v.id;
  static const Field<TaskModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$projectId(TaskModel v) => v.projectId;
  static const Field<TaskModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$projectBeneficiaryId(TaskModel v) => v.projectBeneficiaryId;
  static const Field<TaskModel, String> _f$projectBeneficiaryId =
      Field('projectBeneficiaryId', _$projectBeneficiaryId, opt: true);
  static String? _$projectBeneficiaryClientReferenceId(TaskModel v) =>
      v.projectBeneficiaryClientReferenceId;
  static const Field<TaskModel, String> _f$projectBeneficiaryClientReferenceId =
      Field('projectBeneficiaryClientReferenceId',
          _$projectBeneficiaryClientReferenceId,
          opt: true);
  static String? _$createdBy(TaskModel v) => v.createdBy;
  static const Field<TaskModel, String> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static String? _$status(TaskModel v) => v.status;
  static const Field<TaskModel, String> _f$status =
      Field('status', _$status, opt: true);
  static bool? _$nonRecoverableError(TaskModel v) => v.nonRecoverableError;
  static const Field<TaskModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(TaskModel v) => v.clientReferenceId;
  static const Field<TaskModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(TaskModel v) => v.tenantId;
  static const Field<TaskModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(TaskModel v) => v.rowVersion;
  static const Field<TaskModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<TaskResourceModel>? _$resources(TaskModel v) => v.resources;
  static const Field<TaskModel, List<TaskResourceModel>> _f$resources =
      Field('resources', _$resources, opt: true);
  static AddressModel? _$address(TaskModel v) => v.address;
  static const Field<TaskModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static int? _$plannedStartDate(TaskModel v) => v.plannedStartDate;
  static const Field<TaskModel, int> _f$plannedStartDate =
      Field('plannedStartDate', _$plannedStartDate, opt: true);
  static int? _$plannedEndDate(TaskModel v) => v.plannedEndDate;
  static const Field<TaskModel, int> _f$plannedEndDate =
      Field('plannedEndDate', _$plannedEndDate, opt: true);
  static int? _$actualStartDate(TaskModel v) => v.actualStartDate;
  static const Field<TaskModel, int> _f$actualStartDate =
      Field('actualStartDate', _$actualStartDate, opt: true);
  static int? _$actualEndDate(TaskModel v) => v.actualEndDate;
  static const Field<TaskModel, int> _f$actualEndDate =
      Field('actualEndDate', _$actualEndDate, opt: true);
  static int? _$createdDate(TaskModel v) => v.createdDate;
  static const Field<TaskModel, int> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static AuditDetails? _$auditDetails(TaskModel v) => v.auditDetails;
  static const Field<TaskModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(TaskModel v) =>
      v.clientAuditDetails;
  static const Field<TaskModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(TaskModel v) => v.isDeleted;
  static const Field<TaskModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static DateTime? _$plannedStartDateTime(TaskModel v) =>
      v.plannedStartDateTime;
  static const Field<TaskModel, DateTime> _f$plannedStartDateTime = Field(
      'plannedStartDateTime', _$plannedStartDateTime,
      mode: FieldMode.member);
  static DateTime? _$plannedEndDateTime(TaskModel v) => v.plannedEndDateTime;
  static const Field<TaskModel, DateTime> _f$plannedEndDateTime =
      Field('plannedEndDateTime', _$plannedEndDateTime, mode: FieldMode.member);
  static DateTime? _$actualStartDateTime(TaskModel v) => v.actualStartDateTime;
  static const Field<TaskModel, DateTime> _f$actualStartDateTime = Field(
      'actualStartDateTime', _$actualStartDateTime,
      mode: FieldMode.member);
  static DateTime? _$actualEndDateTime(TaskModel v) => v.actualEndDateTime;
  static const Field<TaskModel, DateTime> _f$actualEndDateTime =
      Field('actualEndDateTime', _$actualEndDateTime, mode: FieldMode.member);
  static DateTime? _$createdDateTime(TaskModel v) => v.createdDateTime;
  static const Field<TaskModel, DateTime> _f$createdDateTime =
      Field('createdDateTime', _$createdDateTime, mode: FieldMode.member);

  @override
  final MappableFields<TaskModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #projectId: _f$projectId,
    #projectBeneficiaryId: _f$projectBeneficiaryId,
    #projectBeneficiaryClientReferenceId:
        _f$projectBeneficiaryClientReferenceId,
    #createdBy: _f$createdBy,
    #status: _f$status,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #resources: _f$resources,
    #address: _f$address,
    #plannedStartDate: _f$plannedStartDate,
    #plannedEndDate: _f$plannedEndDate,
    #actualStartDate: _f$actualStartDate,
    #actualEndDate: _f$actualEndDate,
    #createdDate: _f$createdDate,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
    #plannedStartDateTime: _f$plannedStartDateTime,
    #plannedEndDateTime: _f$plannedEndDateTime,
    #actualStartDateTime: _f$actualStartDateTime,
    #actualEndDateTime: _f$actualEndDateTime,
    #createdDateTime: _f$createdDateTime,
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

  static TaskModel _instantiate(DecodingData data) {
    return TaskModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        projectId: data.dec(_f$projectId),
        projectBeneficiaryId: data.dec(_f$projectBeneficiaryId),
        projectBeneficiaryClientReferenceId:
            data.dec(_f$projectBeneficiaryClientReferenceId),
        createdBy: data.dec(_f$createdBy),
        status: data.dec(_f$status),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        resources: data.dec(_f$resources),
        address: data.dec(_f$address),
        plannedStartDate: data.dec(_f$plannedStartDate),
        plannedEndDate: data.dec(_f$plannedEndDate),
        actualStartDate: data.dec(_f$actualStartDate),
        actualEndDate: data.dec(_f$actualEndDate),
        createdDate: data.dec(_f$createdDate),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskModel>(map);
  }

  static TaskModel fromJson(String json) {
    return ensureInitialized().decodeJson<TaskModel>(json);
  }
}

mixin TaskModelMappable {
  String toJson() {
    return TaskModelMapper.ensureInitialized()
        .encodeJson<TaskModel>(this as TaskModel);
  }

  Map<String, dynamic> toMap() {
    return TaskModelMapper.ensureInitialized()
        .encodeMap<TaskModel>(this as TaskModel);
  }

  TaskModelCopyWith<TaskModel, TaskModel, TaskModel> get copyWith =>
      _TaskModelCopyWithImpl(this as TaskModel, $identity, $identity);
  @override
  String toString() {
    return TaskModelMapper.ensureInitialized()
        .stringifyValue(this as TaskModel);
  }

  @override
  bool operator ==(Object other) {
    return TaskModelMapper.ensureInitialized()
        .equalsValue(this as TaskModel, other);
  }

  @override
  int get hashCode {
    return TaskModelMapper.ensureInitialized().hashValue(this as TaskModel);
  }
}

extension TaskModelValueCopy<$R, $Out> on ObjectCopyWith<$R, TaskModel, $Out> {
  TaskModelCopyWith<$R, TaskModel, $Out> get $asTaskModel =>
      $base.as((v, t, t2) => _TaskModelCopyWithImpl(v, t, t2));
}

abstract class TaskModelCopyWith<$R, $In extends TaskModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  TaskAdditionalFieldsCopyWith<$R, TaskAdditionalFields, TaskAdditionalFields>?
      get additionalFields;
  ListCopyWith<$R, TaskResourceModel,
          TaskResourceModelCopyWith<$R, TaskResourceModel, TaskResourceModel>>?
      get resources;
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {TaskAdditionalFields? additionalFields,
      String? id,
      String? projectId,
      String? projectBeneficiaryId,
      String? projectBeneficiaryClientReferenceId,
      String? createdBy,
      String? status,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion,
      List<TaskResourceModel>? resources,
      AddressModel? address,
      int? plannedStartDate,
      int? plannedEndDate,
      int? actualStartDate,
      int? actualEndDate,
      int? createdDate,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  TaskModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskModel, $Out>
    implements TaskModelCopyWith<$R, TaskModel, $Out> {
  _TaskModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskModel> $mapper =
      TaskModelMapper.ensureInitialized();
  @override
  TaskAdditionalFieldsCopyWith<$R, TaskAdditionalFields, TaskAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  ListCopyWith<$R, TaskResourceModel,
          TaskResourceModelCopyWith<$R, TaskResourceModel, TaskResourceModel>>?
      get resources => $value.resources != null
          ? ListCopyWith($value.resources!, (v, t) => v.copyWith.$chain(t),
              (v) => call(resources: v))
          : null;
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
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
          Object? projectBeneficiaryId = $none,
          Object? projectBeneficiaryClientReferenceId = $none,
          Object? createdBy = $none,
          Object? status = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? resources = $none,
          Object? address = $none,
          Object? plannedStartDate = $none,
          Object? plannedEndDate = $none,
          Object? actualStartDate = $none,
          Object? actualEndDate = $none,
          Object? createdDate = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (projectId != $none) #projectId: projectId,
        if (projectBeneficiaryId != $none)
          #projectBeneficiaryId: projectBeneficiaryId,
        if (projectBeneficiaryClientReferenceId != $none)
          #projectBeneficiaryClientReferenceId:
              projectBeneficiaryClientReferenceId,
        if (createdBy != $none) #createdBy: createdBy,
        if (status != $none) #status: status,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (resources != $none) #resources: resources,
        if (address != $none) #address: address,
        if (plannedStartDate != $none) #plannedStartDate: plannedStartDate,
        if (plannedEndDate != $none) #plannedEndDate: plannedEndDate,
        if (actualStartDate != $none) #actualStartDate: actualStartDate,
        if (actualEndDate != $none) #actualEndDate: actualEndDate,
        if (createdDate != $none) #createdDate: createdDate,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  TaskModel $make(CopyWithData data) => TaskModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      projectId: data.get(#projectId, or: $value.projectId),
      projectBeneficiaryId:
          data.get(#projectBeneficiaryId, or: $value.projectBeneficiaryId),
      projectBeneficiaryClientReferenceId: data.get(
          #projectBeneficiaryClientReferenceId,
          or: $value.projectBeneficiaryClientReferenceId),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      status: data.get(#status, or: $value.status),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      resources: data.get(#resources, or: $value.resources),
      address: data.get(#address, or: $value.address),
      plannedStartDate:
          data.get(#plannedStartDate, or: $value.plannedStartDate),
      plannedEndDate: data.get(#plannedEndDate, or: $value.plannedEndDate),
      actualStartDate: data.get(#actualStartDate, or: $value.actualStartDate),
      actualEndDate: data.get(#actualEndDate, or: $value.actualEndDate),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  TaskModelCopyWith<$R2, TaskModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskModelCopyWithImpl($value, $cast, t);
}

class TaskAdditionalFieldsMapper
    extends SubClassMapperBase<TaskAdditionalFields> {
  TaskAdditionalFieldsMapper._();

  static TaskAdditionalFieldsMapper? _instance;
  static TaskAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskAdditionalFields';

  static String _$schema(TaskAdditionalFields v) => v.schema;
  static const Field<TaskAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'Task');
  static int _$version(TaskAdditionalFields v) => v.version;
  static const Field<TaskAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(TaskAdditionalFields v) => v.fields;
  static const Field<TaskAdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<TaskAdditionalFields> fields = const {
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

  static TaskAdditionalFields _instantiate(DecodingData data) {
    return TaskAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskAdditionalFields>(map);
  }

  static TaskAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<TaskAdditionalFields>(json);
  }
}

mixin TaskAdditionalFieldsMappable {
  String toJson() {
    return TaskAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<TaskAdditionalFields>(this as TaskAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return TaskAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<TaskAdditionalFields>(this as TaskAdditionalFields);
  }

  TaskAdditionalFieldsCopyWith<TaskAdditionalFields, TaskAdditionalFields,
          TaskAdditionalFields>
      get copyWith => _TaskAdditionalFieldsCopyWithImpl(
          this as TaskAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return TaskAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as TaskAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return TaskAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as TaskAdditionalFields, other);
  }

  @override
  int get hashCode {
    return TaskAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as TaskAdditionalFields);
  }
}

extension TaskAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskAdditionalFields, $Out> {
  TaskAdditionalFieldsCopyWith<$R, TaskAdditionalFields, $Out>
      get $asTaskAdditionalFields =>
          $base.as((v, t, t2) => _TaskAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class TaskAdditionalFieldsCopyWith<
    $R,
    $In extends TaskAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  TaskAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskAdditionalFields, $Out>
    implements TaskAdditionalFieldsCopyWith<$R, TaskAdditionalFields, $Out> {
  _TaskAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskAdditionalFields> $mapper =
      TaskAdditionalFieldsMapper.ensureInitialized();
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
  TaskAdditionalFields $make(CopyWithData data) => TaskAdditionalFields(
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version),
      fields: data.get(#fields, or: $value.fields));

  @override
  TaskAdditionalFieldsCopyWith<$R2, TaskAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TaskAdditionalFieldsCopyWithImpl($value, $cast, t);
}
