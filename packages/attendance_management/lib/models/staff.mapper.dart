// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'staff.dart';

class StaffSearchModelMapper extends ClassMapperBase<StaffSearchModel> {
  StaffSearchModelMapper._();

  static StaffSearchModelMapper? _instance;
  static StaffSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StaffSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StaffSearchModel';

  static String? _$id(StaffSearchModel v) => v.id;
  static const Field<StaffSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$userId(StaffSearchModel v) => v.userId;
  static const Field<StaffSearchModel, List<String>> _f$userId =
      Field('userId', _$userId, opt: true);

  @override
  final MappableFields<StaffSearchModel> fields = const {
    #id: _f$id,
    #userId: _f$userId,
  };
  @override
  final bool ignoreNull = true;

  static StaffSearchModel _instantiate(DecodingData data) {
    return StaffSearchModel.ignoreDeleted(
        id: data.dec(_f$id), userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static StaffSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StaffSearchModel>(map);
  }

  static StaffSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<StaffSearchModel>(json);
  }
}

mixin StaffSearchModelMappable {
  String toJson() {
    return StaffSearchModelMapper.ensureInitialized()
        .encodeJson<StaffSearchModel>(this as StaffSearchModel);
  }

  Map<String, dynamic> toMap() {
    return StaffSearchModelMapper.ensureInitialized()
        .encodeMap<StaffSearchModel>(this as StaffSearchModel);
  }

  StaffSearchModelCopyWith<StaffSearchModel, StaffSearchModel, StaffSearchModel>
      get copyWith => _StaffSearchModelCopyWithImpl(
          this as StaffSearchModel, $identity, $identity);
  @override
  String toString() {
    return StaffSearchModelMapper.ensureInitialized()
        .stringifyValue(this as StaffSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StaffSearchModelMapper.ensureInitialized()
                .isValueEqual(this as StaffSearchModel, other));
  }

  @override
  int get hashCode {
    return StaffSearchModelMapper.ensureInitialized()
        .hashValue(this as StaffSearchModel);
  }
}

extension StaffSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StaffSearchModel, $Out> {
  StaffSearchModelCopyWith<$R, StaffSearchModel, $Out>
      get $asStaffSearchModel =>
          $base.as((v, t, t2) => _StaffSearchModelCopyWithImpl(v, t, t2));
}

abstract class StaffSearchModelCopyWith<$R, $In extends StaffSearchModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get userId;
  $R call({String? id, List<String>? userId});
  StaffSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StaffSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StaffSearchModel, $Out>
    implements StaffSearchModelCopyWith<$R, StaffSearchModel, $Out> {
  _StaffSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StaffSearchModel> $mapper =
      StaffSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get userId =>
      $value.userId != null
          ? ListCopyWith($value.userId!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(userId: v))
          : null;
  @override
  $R call({Object? id = $none, Object? userId = $none}) =>
      $apply(FieldCopyWithData(
          {if (id != $none) #id: id, if (userId != $none) #userId: userId}));
  @override
  StaffSearchModel $make(CopyWithData data) => StaffSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      userId: data.get(#userId, or: $value.userId));

  @override
  StaffSearchModelCopyWith<$R2, StaffSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StaffSearchModelCopyWithImpl($value, $cast, t);
}

class StaffModelMapper extends ClassMapperBase<StaffModel> {
  StaffModelMapper._();

  static StaffModelMapper? _instance;
  static StaffModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StaffModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StaffModel';

  static StaffAdditionalFields? _$additionalFields(StaffModel v) =>
      v.additionalFields;
  static const Field<StaffModel, StaffAdditionalFields> _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$id(StaffModel v) => v.id;
  static const Field<StaffModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$tenantId(StaffModel v) => v.tenantId;
  static const Field<StaffModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$registerId(StaffModel v) => v.registerId;
  static const Field<StaffModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);
  static String? _$userId(StaffModel v) => v.userId;
  static const Field<StaffModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static int? _$enrollmentDate(StaffModel v) => v.enrollmentDate;
  static const Field<StaffModel, int> _f$enrollmentDate =
      Field('enrollmentDate', _$enrollmentDate, opt: true);
  static int? _$denrollmentDate(StaffModel v) => v.denrollmentDate;
  static const Field<StaffModel, int> _f$denrollmentDate =
      Field('denrollmentDate', _$denrollmentDate, opt: true);
  static bool? _$nonRecoverableError(StaffModel v) => v.nonRecoverableError;
  static const Field<StaffModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(StaffModel v) => v.rowVersion;
  static const Field<StaffModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<StaffModel> fields = const {
    #additionalFields: _f$additionalFields,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #registerId: _f$registerId,
    #userId: _f$userId,
    #enrollmentDate: _f$enrollmentDate,
    #denrollmentDate: _f$denrollmentDate,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static StaffModel _instantiate(DecodingData data) {
    return StaffModel(
        additionalFields: data.dec(_f$additionalFields),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        registerId: data.dec(_f$registerId),
        userId: data.dec(_f$userId),
        enrollmentDate: data.dec(_f$enrollmentDate),
        denrollmentDate: data.dec(_f$denrollmentDate),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static StaffModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StaffModel>(map);
  }

  static StaffModel fromJson(String json) {
    return ensureInitialized().decodeJson<StaffModel>(json);
  }
}

mixin StaffModelMappable {
  String toJson() {
    return StaffModelMapper.ensureInitialized()
        .encodeJson<StaffModel>(this as StaffModel);
  }

  Map<String, dynamic> toMap() {
    return StaffModelMapper.ensureInitialized()
        .encodeMap<StaffModel>(this as StaffModel);
  }

  StaffModelCopyWith<StaffModel, StaffModel, StaffModel> get copyWith =>
      _StaffModelCopyWithImpl(this as StaffModel, $identity, $identity);
  @override
  String toString() {
    return StaffModelMapper.ensureInitialized()
        .stringifyValue(this as StaffModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StaffModelMapper.ensureInitialized()
                .isValueEqual(this as StaffModel, other));
  }

  @override
  int get hashCode {
    return StaffModelMapper.ensureInitialized().hashValue(this as StaffModel);
  }
}

extension StaffModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StaffModel, $Out> {
  StaffModelCopyWith<$R, StaffModel, $Out> get $asStaffModel =>
      $base.as((v, t, t2) => _StaffModelCopyWithImpl(v, t, t2));
}

abstract class StaffModelCopyWith<$R, $In extends StaffModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  StaffAdditionalFieldsCopyWith<$R, StaffAdditionalFields,
      StaffAdditionalFields>? get additionalFields;
  $R call(
      {StaffAdditionalFields? additionalFields,
      String? id,
      String? tenantId,
      String? registerId,
      String? userId,
      int? enrollmentDate,
      int? denrollmentDate,
      bool? nonRecoverableError,
      int? rowVersion});
  StaffModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StaffModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StaffModel, $Out>
    implements StaffModelCopyWith<$R, StaffModel, $Out> {
  _StaffModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StaffModel> $mapper =
      StaffModelMapper.ensureInitialized();
  @override
  StaffAdditionalFieldsCopyWith<$R, StaffAdditionalFields,
          StaffAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  $R call(
          {Object? additionalFields = $none,
          Object? id = $none,
          Object? tenantId = $none,
          Object? registerId = $none,
          Object? userId = $none,
          Object? enrollmentDate = $none,
          Object? denrollmentDate = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (registerId != $none) #registerId: registerId,
        if (userId != $none) #userId: userId,
        if (enrollmentDate != $none) #enrollmentDate: enrollmentDate,
        if (denrollmentDate != $none) #denrollmentDate: denrollmentDate,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  StaffModel $make(CopyWithData data) => StaffModel(
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      registerId: data.get(#registerId, or: $value.registerId),
      userId: data.get(#userId, or: $value.userId),
      enrollmentDate: data.get(#enrollmentDate, or: $value.enrollmentDate),
      denrollmentDate: data.get(#denrollmentDate, or: $value.denrollmentDate),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  StaffModelCopyWith<$R2, StaffModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StaffModelCopyWithImpl($value, $cast, t);
}

class StaffAdditionalFieldsMapper
    extends ClassMapperBase<StaffAdditionalFields> {
  StaffAdditionalFieldsMapper._();

  static StaffAdditionalFieldsMapper? _instance;
  static StaffAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StaffAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StaffAdditionalFields';

  @override
  final MappableFields<StaffAdditionalFields> fields = const {};
  @override
  final bool ignoreNull = true;

  static StaffAdditionalFields _instantiate(DecodingData data) {
    return StaffAdditionalFields();
  }

  @override
  final Function instantiate = _instantiate;

  static StaffAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StaffAdditionalFields>(map);
  }

  static StaffAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<StaffAdditionalFields>(json);
  }
}

mixin StaffAdditionalFieldsMappable {
  String toJson() {
    return StaffAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<StaffAdditionalFields>(this as StaffAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return StaffAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<StaffAdditionalFields>(this as StaffAdditionalFields);
  }

  StaffAdditionalFieldsCopyWith<StaffAdditionalFields, StaffAdditionalFields,
          StaffAdditionalFields>
      get copyWith => _StaffAdditionalFieldsCopyWithImpl(
          this as StaffAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return StaffAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as StaffAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StaffAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(this as StaffAdditionalFields, other));
  }

  @override
  int get hashCode {
    return StaffAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as StaffAdditionalFields);
  }
}

extension StaffAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StaffAdditionalFields, $Out> {
  StaffAdditionalFieldsCopyWith<$R, StaffAdditionalFields, $Out>
      get $asStaffAdditionalFields =>
          $base.as((v, t, t2) => _StaffAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class StaffAdditionalFieldsCopyWith<
    $R,
    $In extends StaffAdditionalFields,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  StaffAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StaffAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StaffAdditionalFields, $Out>
    implements StaffAdditionalFieldsCopyWith<$R, StaffAdditionalFields, $Out> {
  _StaffAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StaffAdditionalFields> $mapper =
      StaffAdditionalFieldsMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  StaffAdditionalFields $make(CopyWithData data) => StaffAdditionalFields();

  @override
  StaffAdditionalFieldsCopyWith<$R2, StaffAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StaffAdditionalFieldsCopyWithImpl($value, $cast, t);
}
