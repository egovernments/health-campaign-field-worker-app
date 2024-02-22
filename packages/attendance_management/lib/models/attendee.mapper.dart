// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendee.dart';

class AttendeeSearchModelMapper extends ClassMapperBase<AttendeeSearchModel> {
  AttendeeSearchModelMapper._();

  static AttendeeSearchModelMapper? _instance;
  static AttendeeSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttendeeSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendeeSearchModel';

  static String? _$id(AttendeeSearchModel v) => v.id;
  static const Field<AttendeeSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$registerId(AttendeeSearchModel v) => v.registerId;
  static const Field<AttendeeSearchModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);

  @override
  final MappableFields<AttendeeSearchModel> fields = const {
    #id: _f$id,
    #registerId: _f$registerId,
  };
  @override
  final bool ignoreNull = true;

  static AttendeeSearchModel _instantiate(DecodingData data) {
    return AttendeeSearchModel.ignoreDeleted(
        id: data.dec(_f$id), registerId: data.dec(_f$registerId));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendeeSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendeeSearchModel>(map);
  }

  static AttendeeSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendeeSearchModel>(json);
  }
}

mixin AttendeeSearchModelMappable {
  String toJson() {
    return AttendeeSearchModelMapper.ensureInitialized()
        .encodeJson<AttendeeSearchModel>(this as AttendeeSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AttendeeSearchModelMapper.ensureInitialized()
        .encodeMap<AttendeeSearchModel>(this as AttendeeSearchModel);
  }

  AttendeeSearchModelCopyWith<AttendeeSearchModel, AttendeeSearchModel,
          AttendeeSearchModel>
      get copyWith => _AttendeeSearchModelCopyWithImpl(
          this as AttendeeSearchModel, $identity, $identity);
  @override
  String toString() {
    return AttendeeSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AttendeeSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendeeSearchModelMapper.ensureInitialized()
                .isValueEqual(this as AttendeeSearchModel, other));
  }

  @override
  int get hashCode {
    return AttendeeSearchModelMapper.ensureInitialized()
        .hashValue(this as AttendeeSearchModel);
  }
}

extension AttendeeSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendeeSearchModel, $Out> {
  AttendeeSearchModelCopyWith<$R, AttendeeSearchModel, $Out>
      get $asAttendeeSearchModel =>
          $base.as((v, t, t2) => _AttendeeSearchModelCopyWithImpl(v, t, t2));
}

abstract class AttendeeSearchModelCopyWith<$R, $In extends AttendeeSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? registerId});
  AttendeeSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendeeSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendeeSearchModel, $Out>
    implements AttendeeSearchModelCopyWith<$R, AttendeeSearchModel, $Out> {
  _AttendeeSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendeeSearchModel> $mapper =
      AttendeeSearchModelMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, Object? registerId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (registerId != $none) #registerId: registerId
      }));
  @override
  AttendeeSearchModel $make(CopyWithData data) =>
      AttendeeSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          registerId: data.get(#registerId, or: $value.registerId));

  @override
  AttendeeSearchModelCopyWith<$R2, AttendeeSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendeeSearchModelCopyWithImpl($value, $cast, t);
}

class AttendeeModelMapper extends ClassMapperBase<AttendeeModel> {
  AttendeeModelMapper._();

  static AttendeeModelMapper? _instance;
  static AttendeeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttendeeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendeeModel';

  static AttendeeAdditionalFields? _$additionalFields(AttendeeModel v) =>
      v.additionalFields;
  static const Field<AttendeeModel, AttendeeAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(AttendeeModel v) => v.id;
  static const Field<AttendeeModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(AttendeeModel v) => v.tenantId;
  static const Field<AttendeeModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$registerId(AttendeeModel v) => v.registerId;
  static const Field<AttendeeModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);
  static String? _$individualId(AttendeeModel v) => v.individualId;
  static const Field<AttendeeModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static int? _$enrollmentDate(AttendeeModel v) => v.enrollmentDate;
  static const Field<AttendeeModel, int> _f$enrollmentDate =
      Field('enrollmentDate', _$enrollmentDate, opt: true);
  static int? _$denrollmentDate(AttendeeModel v) => v.denrollmentDate;
  static const Field<AttendeeModel, int> _f$denrollmentDate =
      Field('denrollmentDate', _$denrollmentDate, opt: true);
  static bool? _$nonRecoverableError(AttendeeModel v) => v.nonRecoverableError;
  static const Field<AttendeeModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(AttendeeModel v) => v.rowVersion;
  static const Field<AttendeeModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$name(AttendeeModel v) => v.name;
  static const Field<AttendeeModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$identifierID(AttendeeModel v) => v.identifierID;
  static const Field<AttendeeModel, String> _f$identifierID =
      Field('identifierID', _$identifierID, opt: true);
  static String? _$individualNumber(AttendeeModel v) => v.individualNumber;
  static const Field<AttendeeModel, String> _f$individualNumber =
      Field('individualNumber', _$individualNumber, opt: true);
  static double? _$status(AttendeeModel v) => v.status;
  static const Field<AttendeeModel, double> _f$status =
      Field('status', _$status, opt: true, def: -1);

  @override
  final MappableFields<AttendeeModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #registerId: _f$registerId,
    #individualId: _f$individualId,
    #enrollmentDate: _f$enrollmentDate,
    #denrollmentDate: _f$denrollmentDate,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #name: _f$name,
    #identifierID: _f$identifierID,
    #individualNumber: _f$individualNumber,
    #status: _f$status,
  };
  @override
  final bool ignoreNull = true;

  static AttendeeModel _instantiate(DecodingData data) {
    return AttendeeModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        registerId: data.dec(_f$registerId),
        individualId: data.dec(_f$individualId),
        enrollmentDate: data.dec(_f$enrollmentDate),
        denrollmentDate: data.dec(_f$denrollmentDate),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        name: data.dec(_f$name),
        identifierID: data.dec(_f$identifierID),
        individualNumber: data.dec(_f$individualNumber),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendeeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendeeModel>(map);
  }

  static AttendeeModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendeeModel>(json);
  }
}

mixin AttendeeModelMappable {
  String toJson() {
    return AttendeeModelMapper.ensureInitialized()
        .encodeJson<AttendeeModel>(this as AttendeeModel);
  }

  Map<String, dynamic> toMap() {
    return AttendeeModelMapper.ensureInitialized()
        .encodeMap<AttendeeModel>(this as AttendeeModel);
  }

  AttendeeModelCopyWith<AttendeeModel, AttendeeModel, AttendeeModel>
      get copyWith => _AttendeeModelCopyWithImpl(
          this as AttendeeModel, $identity, $identity);
  @override
  String toString() {
    return AttendeeModelMapper.ensureInitialized()
        .stringifyValue(this as AttendeeModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendeeModelMapper.ensureInitialized()
                .isValueEqual(this as AttendeeModel, other));
  }

  @override
  int get hashCode {
    return AttendeeModelMapper.ensureInitialized()
        .hashValue(this as AttendeeModel);
  }
}

extension AttendeeModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendeeModel, $Out> {
  AttendeeModelCopyWith<$R, AttendeeModel, $Out> get $asAttendeeModel =>
      $base.as((v, t, t2) => _AttendeeModelCopyWithImpl(v, t, t2));
}

abstract class AttendeeModelCopyWith<$R, $In extends AttendeeModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AttendeeAdditionalFieldsCopyWith<$R, AttendeeAdditionalFields,
      AttendeeAdditionalFields>? get additionalFields;
  $R call(
      {AttendeeAdditionalFields? additionalFields,
      String? id,
      String? tenantId,
      String? registerId,
      String? individualId,
      int? enrollmentDate,
      int? denrollmentDate,
      bool? nonRecoverableError,
      int? rowVersion,
      String? name,
      String? identifierID,
      String? individualNumber,
      double? status});
  AttendeeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AttendeeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendeeModel, $Out>
    implements AttendeeModelCopyWith<$R, AttendeeModel, $Out> {
  _AttendeeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendeeModel> $mapper =
      AttendeeModelMapper.ensureInitialized();
  @override
  AttendeeAdditionalFieldsCopyWith<$R, AttendeeAdditionalFields,
          AttendeeAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? tenantId = $none,
          Object? registerId = $none,
          Object? individualId = $none,
          Object? enrollmentDate = $none,
          Object? denrollmentDate = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? name = $none,
          Object? identifierID = $none,
          Object? individualNumber = $none,
          Object? status = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (registerId != $none) #registerId: registerId,
        if (individualId != $none) #individualId: individualId,
        if (enrollmentDate != $none) #enrollmentDate: enrollmentDate,
        if (denrollmentDate != $none) #denrollmentDate: denrollmentDate,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (name != $none) #name: name,
        if (identifierID != $none) #identifierID: identifierID,
        if (individualNumber != $none) #individualNumber: individualNumber,
        if (status != $none) #status: status
      }));
  @override
  AttendeeModel $make(CopyWithData data) => AttendeeModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      registerId: data.get(#registerId, or: $value.registerId),
      individualId: data.get(#individualId, or: $value.individualId),
      enrollmentDate: data.get(#enrollmentDate, or: $value.enrollmentDate),
      denrollmentDate: data.get(#denrollmentDate, or: $value.denrollmentDate),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      name: data.get(#name, or: $value.name),
      identifierID: data.get(#identifierID, or: $value.identifierID),
      individualNumber:
          data.get(#individualNumber, or: $value.individualNumber),
      status: data.get(#status, or: $value.status));

  @override
  AttendeeModelCopyWith<$R2, AttendeeModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendeeModelCopyWithImpl($value, $cast, t);
}

class AttendeeAdditionalFieldsMapper
    extends ClassMapperBase<AttendeeAdditionalFields> {
  AttendeeAdditionalFieldsMapper._();

  static AttendeeAdditionalFieldsMapper? _instance;
  static AttendeeAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendeeAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendeeAdditionalFields';

  @override
  final MappableFields<AttendeeAdditionalFields> fields = const {};
  @override
  final bool ignoreNull = true;

  static AttendeeAdditionalFields _instantiate(DecodingData data) {
    return AttendeeAdditionalFields();
  }

  @override
  final Function instantiate = _instantiate;

  static AttendeeAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendeeAdditionalFields>(map);
  }

  static AttendeeAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AttendeeAdditionalFields>(json);
  }
}

mixin AttendeeAdditionalFieldsMappable {
  String toJson() {
    return AttendeeAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<AttendeeAdditionalFields>(this as AttendeeAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return AttendeeAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<AttendeeAdditionalFields>(this as AttendeeAdditionalFields);
  }

  AttendeeAdditionalFieldsCopyWith<AttendeeAdditionalFields,
          AttendeeAdditionalFields, AttendeeAdditionalFields>
      get copyWith => _AttendeeAdditionalFieldsCopyWithImpl(
          this as AttendeeAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return AttendeeAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as AttendeeAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendeeAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as AttendeeAdditionalFields, other));
  }

  @override
  int get hashCode {
    return AttendeeAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as AttendeeAdditionalFields);
  }
}

extension AttendeeAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendeeAdditionalFields, $Out> {
  AttendeeAdditionalFieldsCopyWith<$R, AttendeeAdditionalFields, $Out>
      get $asAttendeeAdditionalFields => $base
          .as((v, t, t2) => _AttendeeAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class AttendeeAdditionalFieldsCopyWith<
    $R,
    $In extends AttendeeAdditionalFields,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AttendeeAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendeeAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendeeAdditionalFields, $Out>
    implements
        AttendeeAdditionalFieldsCopyWith<$R, AttendeeAdditionalFields, $Out> {
  _AttendeeAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendeeAdditionalFields> $mapper =
      AttendeeAdditionalFieldsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AttendeeAdditionalFields $make(CopyWithData data) =>
      AttendeeAdditionalFields();

  @override
  AttendeeAdditionalFieldsCopyWith<$R2, AttendeeAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendeeAdditionalFieldsCopyWithImpl($value, $cast, t);
}
