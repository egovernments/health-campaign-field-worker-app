// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'oplog_entry.dart';

class DataOperationMapper extends EnumMapper<DataOperation> {
  DataOperationMapper._();

  static DataOperationMapper? _instance;
  static DataOperationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataOperationMapper._());
    }
    return _instance!;
  }

  static DataOperation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DataOperation decode(dynamic value) {
    switch (value) {
      case 'create':
        return DataOperation.create;
      case 'search':
        return DataOperation.search;
      case 'update':
        return DataOperation.update;
      case 'delete':
        return DataOperation.delete;
      case 'singleCreate':
        return DataOperation.singleCreate;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DataOperation self) {
    switch (self) {
      case DataOperation.create:
        return 'create';
      case DataOperation.search:
        return 'search';
      case DataOperation.update:
        return 'update';
      case DataOperation.delete:
        return 'delete';
      case DataOperation.singleCreate:
        return 'singleCreate';
    }
  }
}

extension DataOperationMapperExtension on DataOperation {
  String toValue() {
    DataOperationMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DataOperation>(this) as String;
  }
}

class ApiOperationMapper extends EnumMapper<ApiOperation> {
  ApiOperationMapper._();

  static ApiOperationMapper? _instance;
  static ApiOperationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiOperationMapper._());
    }
    return _instance!;
  }

  static ApiOperation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ApiOperation decode(dynamic value) {
    switch (value) {
      case 'login':
        return ApiOperation.login;
      case 'create':
        return ApiOperation.create;
      case 'search':
        return ApiOperation.search;
      case 'update':
        return ApiOperation.update;
      case 'delete':
        return ApiOperation.delete;
      case 'bulk_create':
        return ApiOperation.bulkCreate;
      case 'bulk_update':
        return ApiOperation.bulkUpdate;
      case 'bulk_delete':
        return ApiOperation.bulkDelete;
      case 'single_create':
        return ApiOperation.singleCreate;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ApiOperation self) {
    switch (self) {
      case ApiOperation.login:
        return 'login';
      case ApiOperation.create:
        return 'create';
      case ApiOperation.search:
        return 'search';
      case ApiOperation.update:
        return 'update';
      case ApiOperation.delete:
        return 'delete';
      case ApiOperation.bulkCreate:
        return 'bulk_create';
      case ApiOperation.bulkUpdate:
        return 'bulk_update';
      case ApiOperation.bulkDelete:
        return 'bulk_delete';
      case ApiOperation.singleCreate:
        return 'single_create';
    }
  }
}

extension ApiOperationMapperExtension on ApiOperation {
  String toValue() {
    ApiOperationMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ApiOperation>(this) as String;
  }
}

class OpLogEntryMapper extends ClassMapperBase<OpLogEntry> {
  OpLogEntryMapper._();

  static OpLogEntryMapper? _instance;
  static OpLogEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OpLogEntryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OpLogEntry';
  @override
  Function get typeFactory => <T extends EntityModel>(f) => f<OpLogEntry<T>>();

  static EntityModel _$entity(OpLogEntry v) => v.entity;
  static dynamic _arg$entity<T extends EntityModel>(f) => f<T>();
  static const Field<OpLogEntry, EntityModel> _f$entity =
      Field('entity', _$entity, arg: _arg$entity);
  static DataOperation _$operation(OpLogEntry v) => v.operation;
  static const Field<OpLogEntry, DataOperation> _f$operation =
      Field('operation', _$operation);
  static int? _$id(OpLogEntry v) => v.id;
  static const Field<OpLogEntry, int> _f$id = Field('id', _$id, opt: true);
  static DateTime _$createdAt(OpLogEntry v) => v.createdAt;
  static const Field<OpLogEntry, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt);
  static String _$createdBy(OpLogEntry v) => v.createdBy;
  static const Field<OpLogEntry, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static DataModelType _$type(OpLogEntry v) => v.type;
  static const Field<OpLogEntry, DataModelType> _f$type = Field('type', _$type);
  static bool _$syncedUp(OpLogEntry v) => v.syncedUp;
  static const Field<OpLogEntry, bool> _f$syncedUp =
      Field('syncedUp', _$syncedUp, opt: true, def: false);
  static bool _$syncedDown(OpLogEntry v) => v.syncedDown;
  static const Field<OpLogEntry, bool> _f$syncedDown =
      Field('syncedDown', _$syncedDown, opt: true, def: false);
  static DateTime? _$syncedUpOn(OpLogEntry v) => v.syncedUpOn;
  static const Field<OpLogEntry, DateTime> _f$syncedUpOn =
      Field('syncedUpOn', _$syncedUpOn, opt: true);
  static DateTime? _$syncedDownOn(OpLogEntry v) => v.syncedDownOn;
  static const Field<OpLogEntry, DateTime> _f$syncedDownOn =
      Field('syncedDownOn', _$syncedDownOn, opt: true);
  static String? _$serverGeneratedId(OpLogEntry v) => v.serverGeneratedId;
  static const Field<OpLogEntry, String> _f$serverGeneratedId =
      Field('serverGeneratedId', _$serverGeneratedId, opt: true);
  static String? _$clientReferenceId(OpLogEntry v) => v.clientReferenceId;
  static const Field<OpLogEntry, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static List<AdditionalId> _$additionalIds(OpLogEntry v) => v.additionalIds;
  static const Field<OpLogEntry, List<AdditionalId>> _f$additionalIds =
      Field('additionalIds', _$additionalIds, opt: true, def: const []);
  static int _$syncDownRetryCount(OpLogEntry v) => v.syncDownRetryCount;
  static const Field<OpLogEntry, int> _f$syncDownRetryCount =
      Field('syncDownRetryCount', _$syncDownRetryCount, opt: true, def: 0);
  static int _$rowVersion(OpLogEntry v) => v.rowVersion;
  static const Field<OpLogEntry, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true, def: 1);
  static bool _$nonRecoverableError(OpLogEntry v) => v.nonRecoverableError;
  static const Field<OpLogEntry, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);

  @override
  final MappableFields<OpLogEntry> fields = const {
    #entity: _f$entity,
    #operation: _f$operation,
    #id: _f$id,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #type: _f$type,
    #syncedUp: _f$syncedUp,
    #syncedDown: _f$syncedDown,
    #syncedUpOn: _f$syncedUpOn,
    #syncedDownOn: _f$syncedDownOn,
    #serverGeneratedId: _f$serverGeneratedId,
    #clientReferenceId: _f$clientReferenceId,
    #additionalIds: _f$additionalIds,
    #syncDownRetryCount: _f$syncDownRetryCount,
    #rowVersion: _f$rowVersion,
    #nonRecoverableError: _f$nonRecoverableError,
  };

  static OpLogEntry<T> _instantiate<T extends EntityModel>(DecodingData data) {
    return OpLogEntry(data.dec(_f$entity), data.dec(_f$operation),
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        createdBy: data.dec(_f$createdBy),
        type: data.dec(_f$type),
        syncedUp: data.dec(_f$syncedUp),
        syncedDown: data.dec(_f$syncedDown),
        syncedUpOn: data.dec(_f$syncedUpOn),
        syncedDownOn: data.dec(_f$syncedDownOn),
        serverGeneratedId: data.dec(_f$serverGeneratedId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        additionalIds: data.dec(_f$additionalIds),
        syncDownRetryCount: data.dec(_f$syncDownRetryCount),
        rowVersion: data.dec(_f$rowVersion),
        nonRecoverableError: data.dec(_f$nonRecoverableError));
  }

  @override
  final Function instantiate = _instantiate;

  static OpLogEntry<T> fromMap<T extends EntityModel>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpLogEntry<T>>(map);
  }

  static OpLogEntry<T> fromJson<T extends EntityModel>(String json) {
    return ensureInitialized().decodeJson<OpLogEntry<T>>(json);
  }
}

mixin OpLogEntryMappable<T extends EntityModel> {
  String toJson() {
    return OpLogEntryMapper.ensureInitialized()
        .encodeJson<OpLogEntry<T>>(this as OpLogEntry<T>);
  }

  Map<String, dynamic> toMap() {
    return OpLogEntryMapper.ensureInitialized()
        .encodeMap<OpLogEntry<T>>(this as OpLogEntry<T>);
  }

  OpLogEntryCopyWith<OpLogEntry<T>, OpLogEntry<T>, OpLogEntry<T>, T>
      get copyWith =>
          _OpLogEntryCopyWithImpl(this as OpLogEntry<T>, $identity, $identity);
  @override
  String toString() {
    return OpLogEntryMapper.ensureInitialized()
        .stringifyValue(this as OpLogEntry<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            OpLogEntryMapper.ensureInitialized()
                .isValueEqual(this as OpLogEntry<T>, other));
  }

  @override
  int get hashCode {
    return OpLogEntryMapper.ensureInitialized()
        .hashValue(this as OpLogEntry<T>);
  }
}

extension OpLogEntryValueCopy<$R, $Out, T extends EntityModel>
    on ObjectCopyWith<$R, OpLogEntry<T>, $Out> {
  OpLogEntryCopyWith<$R, OpLogEntry<T>, $Out, T> get $asOpLogEntry =>
      $base.as((v, t, t2) => _OpLogEntryCopyWithImpl(v, t, t2));
}

abstract class OpLogEntryCopyWith<$R, $In extends OpLogEntry<T>, $Out,
    T extends EntityModel> implements ClassCopyWith<$R, $In, $Out> {
  EntityModelCopyWith<$R, EntityModel, T> get entity;
  ListCopyWith<$R, AdditionalId,
      AdditionalIdCopyWith<$R, AdditionalId, AdditionalId>> get additionalIds;
  $R call(
      {T? entity,
      DataOperation? operation,
      int? id,
      DateTime? createdAt,
      String? createdBy,
      DataModelType? type,
      bool? syncedUp,
      bool? syncedDown,
      DateTime? syncedUpOn,
      DateTime? syncedDownOn,
      String? serverGeneratedId,
      String? clientReferenceId,
      List<AdditionalId>? additionalIds,
      int? syncDownRetryCount,
      int? rowVersion,
      bool? nonRecoverableError});
  OpLogEntryCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OpLogEntryCopyWithImpl<$R, $Out, T extends EntityModel>
    extends ClassCopyWithBase<$R, OpLogEntry<T>, $Out>
    implements OpLogEntryCopyWith<$R, OpLogEntry<T>, $Out, T> {
  _OpLogEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OpLogEntry> $mapper =
      OpLogEntryMapper.ensureInitialized();
  @override
  EntityModelCopyWith<$R, EntityModel, T> get entity =>
      $value.entity.copyWith.$chain((v) => call(entity: v));
  @override
  ListCopyWith<$R, AdditionalId,
          AdditionalIdCopyWith<$R, AdditionalId, AdditionalId>>
      get additionalIds => ListCopyWith($value.additionalIds,
          (v, t) => v.copyWith.$chain(t), (v) => call(additionalIds: v));
  @override
  $R call(
          {T? entity,
          DataOperation? operation,
          Object? id = $none,
          DateTime? createdAt,
          String? createdBy,
          DataModelType? type,
          bool? syncedUp,
          bool? syncedDown,
          Object? syncedUpOn = $none,
          Object? syncedDownOn = $none,
          Object? serverGeneratedId = $none,
          Object? clientReferenceId = $none,
          List<AdditionalId>? additionalIds,
          int? syncDownRetryCount,
          int? rowVersion,
          bool? nonRecoverableError}) =>
      $apply(FieldCopyWithData({
        if (entity != null) #entity: entity,
        if (operation != null) #operation: operation,
        if (id != $none) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (createdBy != null) #createdBy: createdBy,
        if (type != null) #type: type,
        if (syncedUp != null) #syncedUp: syncedUp,
        if (syncedDown != null) #syncedDown: syncedDown,
        if (syncedUpOn != $none) #syncedUpOn: syncedUpOn,
        if (syncedDownOn != $none) #syncedDownOn: syncedDownOn,
        if (serverGeneratedId != $none) #serverGeneratedId: serverGeneratedId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (additionalIds != null) #additionalIds: additionalIds,
        if (syncDownRetryCount != null) #syncDownRetryCount: syncDownRetryCount,
        if (rowVersion != null) #rowVersion: rowVersion,
        if (nonRecoverableError != null)
          #nonRecoverableError: nonRecoverableError
      }));
  @override
  OpLogEntry<T> $make(CopyWithData data) => OpLogEntry(
      data.get(#entity, or: $value.entity),
      data.get(#operation, or: $value.operation),
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      type: data.get(#type, or: $value.type),
      syncedUp: data.get(#syncedUp, or: $value.syncedUp),
      syncedDown: data.get(#syncedDown, or: $value.syncedDown),
      syncedUpOn: data.get(#syncedUpOn, or: $value.syncedUpOn),
      syncedDownOn: data.get(#syncedDownOn, or: $value.syncedDownOn),
      serverGeneratedId:
          data.get(#serverGeneratedId, or: $value.serverGeneratedId),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      additionalIds: data.get(#additionalIds, or: $value.additionalIds),
      syncDownRetryCount:
          data.get(#syncDownRetryCount, or: $value.syncDownRetryCount),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError));

  @override
  OpLogEntryCopyWith<$R2, OpLogEntry<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OpLogEntryCopyWithImpl($value, $cast, t);
}

class AdditionalIdMapper extends ClassMapperBase<AdditionalId> {
  AdditionalIdMapper._();

  static AdditionalIdMapper? _instance;
  static AdditionalIdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalIdMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdditionalId';

  static String _$idType(AdditionalId v) => v.idType;
  static const Field<AdditionalId, String> _f$idType =
      Field('idType', _$idType);
  static String _$id(AdditionalId v) => v.id;
  static const Field<AdditionalId, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<AdditionalId> fields = const {
    #idType: _f$idType,
    #id: _f$id,
  };

  static AdditionalId _instantiate(DecodingData data) {
    return AdditionalId(idType: data.dec(_f$idType), id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static AdditionalId fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdditionalId>(map);
  }

  static AdditionalId fromJson(String json) {
    return ensureInitialized().decodeJson<AdditionalId>(json);
  }
}

mixin AdditionalIdMappable {
  String toJson() {
    return AdditionalIdMapper.ensureInitialized()
        .encodeJson<AdditionalId>(this as AdditionalId);
  }

  Map<String, dynamic> toMap() {
    return AdditionalIdMapper.ensureInitialized()
        .encodeMap<AdditionalId>(this as AdditionalId);
  }

  AdditionalIdCopyWith<AdditionalId, AdditionalId, AdditionalId> get copyWith =>
      _AdditionalIdCopyWithImpl(this as AdditionalId, $identity, $identity);
  @override
  String toString() {
    return AdditionalIdMapper.ensureInitialized()
        .stringifyValue(this as AdditionalId);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AdditionalIdMapper.ensureInitialized()
                .isValueEqual(this as AdditionalId, other));
  }

  @override
  int get hashCode {
    return AdditionalIdMapper.ensureInitialized()
        .hashValue(this as AdditionalId);
  }
}

extension AdditionalIdValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdditionalId, $Out> {
  AdditionalIdCopyWith<$R, AdditionalId, $Out> get $asAdditionalId =>
      $base.as((v, t, t2) => _AdditionalIdCopyWithImpl(v, t, t2));
}

abstract class AdditionalIdCopyWith<$R, $In extends AdditionalId, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? idType, String? id});
  AdditionalIdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AdditionalIdCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdditionalId, $Out>
    implements AdditionalIdCopyWith<$R, AdditionalId, $Out> {
  _AdditionalIdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdditionalId> $mapper =
      AdditionalIdMapper.ensureInitialized();
  @override
  $R call({String? idType, String? id}) => $apply(FieldCopyWithData(
      {if (idType != null) #idType: idType, if (id != null) #id: id}));
  @override
  AdditionalId $make(CopyWithData data) => AdditionalId(
      idType: data.get(#idType, or: $value.idType),
      id: data.get(#id, or: $value.id));

  @override
  AdditionalIdCopyWith<$R2, AdditionalId, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdditionalIdCopyWithImpl($value, $cast, t);
}
