// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendance_log.dart';

class AttendanceLogSearchModelMapper
    extends ClassMapperBase<AttendanceLogSearchModel> {
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

  @override
  final MappableFields<AttendanceLogSearchModel> fields = const {
    #id: _f$id,
    #registerId: _f$registerId,
  };
  @override
  final bool ignoreNull = true;

  static AttendanceLogSearchModel _instantiate(DecodingData data) {
    return AttendanceLogSearchModel.ignoreDeleted(
        id: data.dec(_f$id), registerId: data.dec(_f$registerId));
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? registerId});
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
  $R call({Object? id = $none, Object? registerId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (registerId != $none) #registerId: registerId
      }));
  @override
  AttendanceLogSearchModel $make(CopyWithData data) =>
      AttendanceLogSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          registerId: data.get(#registerId, or: $value.registerId));

  @override
  AttendanceLogSearchModelCopyWith<$R2, AttendanceLogSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendanceLogSearchModelCopyWithImpl($value, $cast, t);
}

class AttendanceLogModelMapper extends ClassMapperBase<AttendanceLogModel> {
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
  static Map<String, dynamic>? _$additionalDetails(AttendanceLogModel v) =>
      v.additionalDetails;
  static const Field<AttendanceLogModel, Map<String, dynamic>>
      _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);

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
    #additionalDetails: _f$additionalDetails,
  };
  @override
  final bool ignoreNull = true;

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
        additionalDetails: data.dec(_f$additionalDetails));
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
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get documentIds;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails;
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
      Map<String, dynamic>? additionalDetails});
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
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails => $value.additionalDetails != null
          ? MapCopyWith(
              $value.additionalDetails!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(additionalDetails: v))
          : null;
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
          Object? additionalDetails = $none}) =>
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
        if (additionalDetails != $none) #additionalDetails: additionalDetails
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
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails));

  @override
  AttendanceLogModelCopyWith<$R2, AttendanceLogModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendanceLogModelCopyWithImpl($value, $cast, t);
}
