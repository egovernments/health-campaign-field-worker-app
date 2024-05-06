// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendance_log.dart';

class AttendanceLogSearchModelMapper
    extends SubClassMapperBase<AttendanceLogSearchModel> {
  AttendanceLogSearchModelMapper._();

  static AttendanceLogSearchModelMapper? _instance;
  static AttendanceLogSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendanceLogSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceLogSearchModel';

  static String? _$id(AttendanceLogSearchModel v) => v.id;
  static const Field<AttendanceLogSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$registerId(AttendanceLogSearchModel v) => v.registerId;
  static const Field<AttendanceLogSearchModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);
  static String? _$individualId(AttendanceLogSearchModel v) => v.individualId;
  static const Field<AttendanceLogSearchModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$status(AttendanceLogSearchModel v) => v.status;
  static const Field<AttendanceLogSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$type(AttendanceLogSearchModel v) => v.type;
  static const Field<AttendanceLogSearchModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$tenantId(AttendanceLogSearchModel v) => v.tenantId;
  static const Field<AttendanceLogSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$time(AttendanceLogSearchModel v) => v.time;
  static const Field<AttendanceLogSearchModel, int> _f$time =
      Field('time', _$time, opt: true);
  static int? _$entryTime(AttendanceLogSearchModel v) => v.entryTime;
  static const Field<AttendanceLogSearchModel, int> _f$entryTime =
      Field('entryTime', _$entryTime, opt: true);
  static int? _$exitTime(AttendanceLogSearchModel v) => v.exitTime;
  static const Field<AttendanceLogSearchModel, int> _f$exitTime =
      Field('exitTime', _$exitTime, opt: true);
  static List<String>? _$clientReferenceId(AttendanceLogSearchModel v) =>
      v.clientReferenceId;
  static const Field<AttendanceLogSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static bool? _$uploadToServer(AttendanceLogSearchModel v) => v.uploadToServer;
  static const Field<AttendanceLogSearchModel, bool> _f$uploadToServer =
      Field('uploadToServer', _$uploadToServer, opt: true);
  static String? _$boundaryCode(AttendanceLogSearchModel v) => v.boundaryCode;
  static const Field<AttendanceLogSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(AttendanceLogSearchModel v) =>
      v.auditDetails;
  static const Field<AttendanceLogSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(AttendanceLogSearchModel v) =>
      v.additionalFields;
  static const Field<AttendanceLogSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<AttendanceLogSearchModel> fields = const {
    #id: _f$id,
    #registerId: _f$registerId,
    #individualId: _f$individualId,
    #status: _f$status,
    #type: _f$type,
    #tenantId: _f$tenantId,
    #time: _f$time,
    #entryTime: _f$entryTime,
    #exitTime: _f$exitTime,
    #clientReferenceId: _f$clientReferenceId,
    #uploadToServer: _f$uploadToServer,
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

  static AttendanceLogSearchModel _instantiate(DecodingData data) {
    return AttendanceLogSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        registerId: data.dec(_f$registerId),
        individualId: data.dec(_f$individualId),
        status: data.dec(_f$status),
        type: data.dec(_f$type),
        tenantId: data.dec(_f$tenantId),
        time: data.dec(_f$time),
        entryTime: data.dec(_f$entryTime),
        exitTime: data.dec(_f$exitTime),
        clientReferenceId: data.dec(_f$clientReferenceId),
        uploadToServer: data.dec(_f$uploadToServer),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceLogSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceLogSearchModel>(map);
  }

  static AttendanceLogSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceLogSearchModel>(json);
  }
}

mixin AttendanceLogSearchModelMappable {
  String toJson() {
    return AttendanceLogSearchModelMapper.ensureInitialized()
        .encodeJson<AttendanceLogSearchModel>(this as AttendanceLogSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AttendanceLogSearchModelMapper.ensureInitialized()
        .encodeMap<AttendanceLogSearchModel>(this as AttendanceLogSearchModel);
  }

  AttendanceLogSearchModelCopyWith<AttendanceLogSearchModel,
          AttendanceLogSearchModel, AttendanceLogSearchModel>
      get copyWith => _AttendanceLogSearchModelCopyWithImpl(
          this as AttendanceLogSearchModel, $identity, $identity);
  @override
  String toString() {
    return AttendanceLogSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AttendanceLogSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendanceLogSearchModelMapper.ensureInitialized()
                .isValueEqual(this as AttendanceLogSearchModel, other));
  }

  @override
  int get hashCode {
    return AttendanceLogSearchModelMapper.ensureInitialized()
        .hashValue(this as AttendanceLogSearchModel);
  }
}

extension AttendanceLogSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceLogSearchModel, $Out> {
  AttendanceLogSearchModelCopyWith<$R, AttendanceLogSearchModel, $Out>
      get $asAttendanceLogSearchModel => $base
          .as((v, t, t2) => _AttendanceLogSearchModelCopyWithImpl(v, t, t2));
}

abstract class AttendanceLogSearchModelCopyWith<
    $R,
    $In extends AttendanceLogSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  $R call(
      {String? id,
      String? registerId,
      String? individualId,
      String? status,
      String? type,
      String? tenantId,
      int? time,
      int? entryTime,
      int? exitTime,
      List<String>? clientReferenceId,
      bool? uploadToServer,
      String? boundaryCode});
  AttendanceLogSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceLogSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceLogSearchModel, $Out>
    implements
        AttendanceLogSearchModelCopyWith<$R, AttendanceLogSearchModel, $Out> {
  _AttendanceLogSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceLogSearchModel> $mapper =
      AttendanceLogSearchModelMapper.ensureInitialized();
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
          Object? registerId = $none,
          Object? individualId = $none,
          Object? status = $none,
          Object? type = $none,
          Object? tenantId = $none,
          Object? time = $none,
          Object? entryTime = $none,
          Object? exitTime = $none,
          Object? clientReferenceId = $none,
          Object? uploadToServer = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (registerId != $none) #registerId: registerId,
        if (individualId != $none) #individualId: individualId,
        if (status != $none) #status: status,
        if (type != $none) #type: type,
        if (tenantId != $none) #tenantId: tenantId,
        if (time != $none) #time: time,
        if (entryTime != $none) #entryTime: entryTime,
        if (exitTime != $none) #exitTime: exitTime,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (uploadToServer != $none) #uploadToServer: uploadToServer,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  AttendanceLogSearchModel $make(CopyWithData data) =>
      AttendanceLogSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          registerId: data.get(#registerId, or: $value.registerId),
          individualId: data.get(#individualId, or: $value.individualId),
          status: data.get(#status, or: $value.status),
          type: data.get(#type, or: $value.type),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          time: data.get(#time, or: $value.time),
          entryTime: data.get(#entryTime, or: $value.entryTime),
          exitTime: data.get(#exitTime, or: $value.exitTime),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          uploadToServer: data.get(#uploadToServer, or: $value.uploadToServer),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  AttendanceLogSearchModelCopyWith<$R2, AttendanceLogSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendanceLogSearchModelCopyWithImpl($value, $cast, t);
}

class AttendanceLogModelMapper extends SubClassMapperBase<AttendanceLogModel> {
  AttendanceLogModelMapper._();

  static AttendanceLogModelMapper? _instance;
  static AttendanceLogModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttendanceLogModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceLogModel';

  static String? _$id(AttendanceLogModel v) => v.id;
  static const Field<AttendanceLogModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(AttendanceLogModel v) => v.tenantId;
  static const Field<AttendanceLogModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$registerId(AttendanceLogModel v) => v.registerId;
  static const Field<AttendanceLogModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);
  static String? _$individualId(AttendanceLogModel v) => v.individualId;
  static const Field<AttendanceLogModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$type(AttendanceLogModel v) => v.type;
  static const Field<AttendanceLogModel, String> _f$type =
      Field('type', _$type, opt: true);
  static int? _$time(AttendanceLogModel v) => v.time;
  static const Field<AttendanceLogModel, int> _f$time =
      Field('time', _$time, opt: true);
  static String? _$status(AttendanceLogModel v) => v.status;
  static const Field<AttendanceLogModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$clientReferenceId(AttendanceLogModel v) =>
      v.clientReferenceId;
  static const Field<AttendanceLogModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static bool? _$uploadToServer(AttendanceLogModel v) => v.uploadToServer;
  static const Field<AttendanceLogModel, bool> _f$uploadToServer =
      Field('uploadToServer', _$uploadToServer, opt: true, def: false);
  static List<String>? _$documentIds(AttendanceLogModel v) => v.documentIds;
  static const Field<AttendanceLogModel, List<String>> _f$documentIds =
      Field('documentIds', _$documentIds, opt: true, def: const []);
  static bool? _$nonRecoverableError(AttendanceLogModel v) =>
      v.nonRecoverableError;
  static const Field<AttendanceLogModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(AttendanceLogModel v) => v.rowVersion;
  static const Field<AttendanceLogModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AttendanceLogAdditionalFields? _$additionalDetails(
          AttendanceLogModel v) =>
      v.additionalDetails;
  static const Field<AttendanceLogModel, AttendanceLogAdditionalFields>
      _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static AuditDetails? _$auditDetails(AttendanceLogModel v) => v.auditDetails;
  static const Field<AttendanceLogModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(AttendanceLogModel v) =>
      v.clientAuditDetails;
  static const Field<AttendanceLogModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(AttendanceLogModel v) => v.isDeleted;
  static const Field<AttendanceLogModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<AttendanceLogModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #registerId: _f$registerId,
    #individualId: _f$individualId,
    #type: _f$type,
    #time: _f$time,
    #status: _f$status,
    #clientReferenceId: _f$clientReferenceId,
    #uploadToServer: _f$uploadToServer,
    #documentIds: _f$documentIds,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #additionalDetails: _f$additionalDetails,
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

  static AttendanceLogModel _instantiate(DecodingData data) {
    return AttendanceLogModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        registerId: data.dec(_f$registerId),
        individualId: data.dec(_f$individualId),
        type: data.dec(_f$type),
        time: data.dec(_f$time),
        status: data.dec(_f$status),
        clientReferenceId: data.dec(_f$clientReferenceId),
        uploadToServer: data.dec(_f$uploadToServer),
        documentIds: data.dec(_f$documentIds),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        additionalDetails: data.dec(_f$additionalDetails),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceLogModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceLogModel>(map);
  }

  static AttendanceLogModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceLogModel>(json);
  }
}

mixin AttendanceLogModelMappable {
  String toJson() {
    return AttendanceLogModelMapper.ensureInitialized()
        .encodeJson<AttendanceLogModel>(this as AttendanceLogModel);
  }

  Map<String, dynamic> toMap() {
    return AttendanceLogModelMapper.ensureInitialized()
        .encodeMap<AttendanceLogModel>(this as AttendanceLogModel);
  }

  AttendanceLogModelCopyWith<AttendanceLogModel, AttendanceLogModel,
          AttendanceLogModel>
      get copyWith => _AttendanceLogModelCopyWithImpl(
          this as AttendanceLogModel, $identity, $identity);
  @override
  String toString() {
    return AttendanceLogModelMapper.ensureInitialized()
        .stringifyValue(this as AttendanceLogModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendanceLogModelMapper.ensureInitialized()
                .isValueEqual(this as AttendanceLogModel, other));
  }

  @override
  int get hashCode {
    return AttendanceLogModelMapper.ensureInitialized()
        .hashValue(this as AttendanceLogModel);
  }
}

extension AttendanceLogModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceLogModel, $Out> {
  AttendanceLogModelCopyWith<$R, AttendanceLogModel, $Out>
      get $asAttendanceLogModel =>
          $base.as((v, t, t2) => _AttendanceLogModelCopyWithImpl(v, t, t2));
}

abstract class AttendanceLogModelCopyWith<$R, $In extends AttendanceLogModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get documentIds;
  AttendanceLogAdditionalFieldsCopyWith<$R, AttendanceLogAdditionalFields,
      AttendanceLogAdditionalFields>? get additionalDetails;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {String? id,
      String? tenantId,
      String? registerId,
      String? individualId,
      String? type,
      int? time,
      String? status,
      String? clientReferenceId,
      bool? uploadToServer,
      List<String>? documentIds,
      bool? nonRecoverableError,
      int? rowVersion,
      AttendanceLogAdditionalFields? additionalDetails,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  AttendanceLogModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceLogModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceLogModel, $Out>
    implements AttendanceLogModelCopyWith<$R, AttendanceLogModel, $Out> {
  _AttendanceLogModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceLogModel> $mapper =
      AttendanceLogModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get documentIds => $value.documentIds != null
          ? ListCopyWith(
              $value.documentIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(documentIds: v))
          : null;
  @override
  AttendanceLogAdditionalFieldsCopyWith<$R, AttendanceLogAdditionalFields,
          AttendanceLogAdditionalFields>?
      get additionalDetails => $value.additionalDetails?.copyWith
          .$chain((v) => call(additionalDetails: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? registerId = $none,
          Object? individualId = $none,
          Object? type = $none,
          Object? time = $none,
          Object? status = $none,
          Object? clientReferenceId = $none,
          Object? uploadToServer = $none,
          Object? documentIds = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? additionalDetails = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (registerId != $none) #registerId: registerId,
        if (individualId != $none) #individualId: individualId,
        if (type != $none) #type: type,
        if (time != $none) #time: time,
        if (status != $none) #status: status,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (uploadToServer != $none) #uploadToServer: uploadToServer,
        if (documentIds != $none) #documentIds: documentIds,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  AttendanceLogModel $make(CopyWithData data) => AttendanceLogModel(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      registerId: data.get(#registerId, or: $value.registerId),
      individualId: data.get(#individualId, or: $value.individualId),
      type: data.get(#type, or: $value.type),
      time: data.get(#time, or: $value.time),
      status: data.get(#status, or: $value.status),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      uploadToServer: data.get(#uploadToServer, or: $value.uploadToServer),
      documentIds: data.get(#documentIds, or: $value.documentIds),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  AttendanceLogModelCopyWith<$R2, AttendanceLogModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendanceLogModelCopyWithImpl($value, $cast, t);
}

class AttendanceLogAdditionalFieldsMapper
    extends SubClassMapperBase<AttendanceLogAdditionalFields> {
  AttendanceLogAdditionalFieldsMapper._();

  static AttendanceLogAdditionalFieldsMapper? _instance;
  static AttendanceLogAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendanceLogAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceLogAdditionalFields';

  static String _$schema(AttendanceLogAdditionalFields v) => v.schema;
  static const Field<AttendanceLogAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'AttendanceLog');
  static int _$version(AttendanceLogAdditionalFields v) => v.version;
  static const Field<AttendanceLogAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(AttendanceLogAdditionalFields v) =>
      v.fields;
  static const Field<AttendanceLogAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<AttendanceLogAdditionalFields> fields = const {
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

  static AttendanceLogAdditionalFields _instantiate(DecodingData data) {
    return AttendanceLogAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceLogAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceLogAdditionalFields>(map);
  }

  static AttendanceLogAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceLogAdditionalFields>(json);
  }
}

mixin AttendanceLogAdditionalFieldsMappable {
  String toJson() {
    return AttendanceLogAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<AttendanceLogAdditionalFields>(
            this as AttendanceLogAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return AttendanceLogAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<AttendanceLogAdditionalFields>(
            this as AttendanceLogAdditionalFields);
  }

  AttendanceLogAdditionalFieldsCopyWith<AttendanceLogAdditionalFields,
          AttendanceLogAdditionalFields, AttendanceLogAdditionalFields>
      get copyWith => _AttendanceLogAdditionalFieldsCopyWithImpl(
          this as AttendanceLogAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return AttendanceLogAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as AttendanceLogAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendanceLogAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as AttendanceLogAdditionalFields, other));
  }

  @override
  int get hashCode {
    return AttendanceLogAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as AttendanceLogAdditionalFields);
  }
}

extension AttendanceLogAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceLogAdditionalFields, $Out> {
  AttendanceLogAdditionalFieldsCopyWith<$R, AttendanceLogAdditionalFields, $Out>
      get $asAttendanceLogAdditionalFields => $base.as(
          (v, t, t2) => _AttendanceLogAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class AttendanceLogAdditionalFieldsCopyWith<
    $R,
    $In extends AttendanceLogAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  AttendanceLogAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceLogAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceLogAdditionalFields, $Out>
    implements
        AttendanceLogAdditionalFieldsCopyWith<$R, AttendanceLogAdditionalFields,
            $Out> {
  _AttendanceLogAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceLogAdditionalFields> $mapper =
      AttendanceLogAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call(
          {String? schema,
          Object? version = $none,
          List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != $none) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  AttendanceLogAdditionalFields $make(CopyWithData data) =>
      AttendanceLogAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  AttendanceLogAdditionalFieldsCopyWith<$R2, AttendanceLogAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendanceLogAdditionalFieldsCopyWithImpl($value, $cast, t);
}
