// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendance_register.dart';

class RegisterAuditDetailsMapper extends ClassMapperBase<RegisterAuditDetails> {
  RegisterAuditDetailsMapper._();

  static RegisterAuditDetailsMapper? _instance;
  static RegisterAuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterAuditDetailsMapper._());
      AttendanceAuditDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterAuditDetails';

  static String _$createdBy(RegisterAuditDetails v) => v.createdBy;
  static const Field<RegisterAuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int _$createdTime(RegisterAuditDetails v) => v.createdTime;
  static const Field<RegisterAuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String _$lastModifiedBy(RegisterAuditDetails v) => v.lastModifiedBy;
  static const Field<RegisterAuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int _$lastModifiedTime(RegisterAuditDetails v) => v.lastModifiedTime;
  static const Field<RegisterAuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);
  static String? _$registerId(RegisterAuditDetails v) => v.registerId;
  static const Field<RegisterAuditDetails, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);

  @override
  final MappableFields<RegisterAuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
    #registerId: _f$registerId,
  };

  static RegisterAuditDetails _instantiate(DecodingData data) {
    return RegisterAuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime),
        registerId: data.dec(_f$registerId));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterAuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterAuditDetails>(map);
  }

  static RegisterAuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterAuditDetails>(json);
  }
}

mixin RegisterAuditDetailsMappable {
  String toJson() {
    return RegisterAuditDetailsMapper.ensureInitialized()
        .encodeJson<RegisterAuditDetails>(this as RegisterAuditDetails);
  }

  Map<String, dynamic> toMap() {
    return RegisterAuditDetailsMapper.ensureInitialized()
        .encodeMap<RegisterAuditDetails>(this as RegisterAuditDetails);
  }

  RegisterAuditDetailsCopyWith<RegisterAuditDetails, RegisterAuditDetails,
          RegisterAuditDetails>
      get copyWith => _RegisterAuditDetailsCopyWithImpl(
          this as RegisterAuditDetails, $identity, $identity);
  @override
  String toString() {
    return RegisterAuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as RegisterAuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RegisterAuditDetailsMapper.ensureInitialized()
                .isValueEqual(this as RegisterAuditDetails, other));
  }

  @override
  int get hashCode {
    return RegisterAuditDetailsMapper.ensureInitialized()
        .hashValue(this as RegisterAuditDetails);
  }
}

extension RegisterAuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterAuditDetails, $Out> {
  RegisterAuditDetailsCopyWith<$R, RegisterAuditDetails, $Out>
      get $asRegisterAuditDetails =>
          $base.as((v, t, t2) => _RegisterAuditDetailsCopyWithImpl(v, t, t2));
}

abstract class RegisterAuditDetailsCopyWith<
    $R,
    $In extends RegisterAuditDetails,
    $Out> implements AttendanceAuditDetailsCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime,
      String? registerId});
  RegisterAuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterAuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterAuditDetails, $Out>
    implements RegisterAuditDetailsCopyWith<$R, RegisterAuditDetails, $Out> {
  _RegisterAuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterAuditDetails> $mapper =
      RegisterAuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {String? createdBy,
          int? createdTime,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none,
          Object? registerId = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != null) #createdBy: createdBy,
        if (createdTime != null) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime,
        if (registerId != $none) #registerId: registerId
      }));
  @override
  RegisterAuditDetails $make(CopyWithData data) => RegisterAuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime),
      registerId: data.get(#registerId, or: $value.registerId));

  @override
  RegisterAuditDetailsCopyWith<$R2, RegisterAuditDetails, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _RegisterAuditDetailsCopyWithImpl($value, $cast, t);
}

class AttendancePackageRegisterModelMapper
    extends ClassMapperBase<AttendancePackageRegisterModel> {
  AttendancePackageRegisterModelMapper._();

  static AttendancePackageRegisterModelMapper? _instance;
  static AttendancePackageRegisterModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendancePackageRegisterModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendancePackageRegisterModel';

  static Map<String, dynamic>? _$additionalDetails(
          AttendancePackageRegisterModel v) =>
      v.additionalDetails;
  static const Field<AttendancePackageRegisterModel, Map<String, dynamic>>
      _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static String _$id(AttendancePackageRegisterModel v) => v.id;
  static const Field<AttendancePackageRegisterModel, String> _f$id =
      Field('id', _$id);
  static String? _$tenantId(AttendancePackageRegisterModel v) => v.tenantId;
  static const Field<AttendancePackageRegisterModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$registerNumber(AttendancePackageRegisterModel v) =>
      v.registerNumber;
  static const Field<AttendancePackageRegisterModel, String> _f$registerNumber =
      Field('registerNumber', _$registerNumber, opt: true);
  static String? _$name(AttendancePackageRegisterModel v) => v.name;
  static const Field<AttendancePackageRegisterModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$referenceId(AttendancePackageRegisterModel v) =>
      v.referenceId;
  static const Field<AttendancePackageRegisterModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$serviceCode(AttendancePackageRegisterModel v) =>
      v.serviceCode;
  static const Field<AttendancePackageRegisterModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);
  static String? _$status(AttendancePackageRegisterModel v) => v.status;
  static const Field<AttendancePackageRegisterModel, String> _f$status =
      Field('status', _$status, opt: true);
  static bool? _$nonRecoverableError(AttendancePackageRegisterModel v) =>
      v.nonRecoverableError;
  static const Field<AttendancePackageRegisterModel, bool>
      _f$nonRecoverableError = Field(
          'nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(AttendancePackageRegisterModel v) => v.rowVersion;
  static const Field<AttendancePackageRegisterModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int? _$startDate(AttendancePackageRegisterModel v) => v.startDate;
  static const Field<AttendancePackageRegisterModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(AttendancePackageRegisterModel v) => v.endDate;
  static const Field<AttendancePackageRegisterModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static List<AttendeeModel>? _$attendees(AttendancePackageRegisterModel v) =>
      v.attendees;
  static const Field<AttendancePackageRegisterModel, List<AttendeeModel>>
      _f$attendees = Field('attendees', _$attendees, opt: true);
  static List<StaffModel>? _$staff(AttendancePackageRegisterModel v) => v.staff;
  static const Field<AttendancePackageRegisterModel, List<StaffModel>>
      _f$staff = Field('staff', _$staff, opt: true);
  static AttendanceAuditDetails? _$auditDetails(
          AttendancePackageRegisterModel v) =>
      v.auditDetails;
  static const Field<AttendancePackageRegisterModel, AttendanceAuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);
  static int? _$completedDays(AttendancePackageRegisterModel v) =>
      v.completedDays;
  static const Field<AttendancePackageRegisterModel, int> _f$completedDays =
      Field('completedDays', _$completedDays, opt: true, def: 0);
  static List<Map<DateTime, bool>>? _$attendanceLog(
          AttendancePackageRegisterModel v) =>
      v.attendanceLog;
  static const Field<AttendancePackageRegisterModel, List<Map<DateTime, bool>>>
      _f$attendanceLog =
      Field('attendanceLog', _$attendanceLog, opt: true, def: const []);

  @override
  final MappableFields<AttendancePackageRegisterModel> fields = const {
    #additionalDetails: _f$additionalDetails,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #registerNumber: _f$registerNumber,
    #name: _f$name,
    #referenceId: _f$referenceId,
    #serviceCode: _f$serviceCode,
    #status: _f$status,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #attendees: _f$attendees,
    #staff: _f$staff,
    #auditDetails: _f$auditDetails,
    #completedDays: _f$completedDays,
    #attendanceLog: _f$attendanceLog,
  };
  @override
  final bool ignoreNull = true;

  static AttendancePackageRegisterModel _instantiate(DecodingData data) {
    return AttendancePackageRegisterModel(
        additionalDetails: data.dec(_f$additionalDetails),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        registerNumber: data.dec(_f$registerNumber),
        name: data.dec(_f$name),
        referenceId: data.dec(_f$referenceId),
        serviceCode: data.dec(_f$serviceCode),
        status: data.dec(_f$status),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        attendees: data.dec(_f$attendees),
        staff: data.dec(_f$staff),
        auditDetails: data.dec(_f$auditDetails),
        completedDays: data.dec(_f$completedDays),
        attendanceLog: data.dec(_f$attendanceLog));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendancePackageRegisterModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendancePackageRegisterModel>(map);
  }

  static AttendancePackageRegisterModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendancePackageRegisterModel>(json);
  }
}

mixin AttendancePackageRegisterModelMappable {
  String toJson() {
    return AttendancePackageRegisterModelMapper.ensureInitialized()
        .encodeJson<AttendancePackageRegisterModel>(
            this as AttendancePackageRegisterModel);
  }

  Map<String, dynamic> toMap() {
    return AttendancePackageRegisterModelMapper.ensureInitialized()
        .encodeMap<AttendancePackageRegisterModel>(
            this as AttendancePackageRegisterModel);
  }

  AttendancePackageRegisterModelCopyWith<AttendancePackageRegisterModel,
          AttendancePackageRegisterModel, AttendancePackageRegisterModel>
      get copyWith => _AttendancePackageRegisterModelCopyWithImpl(
          this as AttendancePackageRegisterModel, $identity, $identity);
  @override
  String toString() {
    return AttendancePackageRegisterModelMapper.ensureInitialized()
        .stringifyValue(this as AttendancePackageRegisterModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendancePackageRegisterModelMapper.ensureInitialized()
                .isValueEqual(this as AttendancePackageRegisterModel, other));
  }

  @override
  int get hashCode {
    return AttendancePackageRegisterModelMapper.ensureInitialized()
        .hashValue(this as AttendancePackageRegisterModel);
  }
}

extension AttendancePackageRegisterModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendancePackageRegisterModel, $Out> {
  AttendancePackageRegisterModelCopyWith<$R, AttendancePackageRegisterModel,
          $Out>
      get $asAttendancePackageRegisterModel => $base.as(
          (v, t, t2) => _AttendancePackageRegisterModelCopyWithImpl(v, t, t2));
}

abstract class AttendancePackageRegisterModelCopyWith<
    $R,
    $In extends AttendancePackageRegisterModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails;
  ListCopyWith<$R, AttendeeModel,
      AttendeeModelCopyWith<$R, AttendeeModel, AttendeeModel>>? get attendees;
  ListCopyWith<$R, StaffModel, StaffModelCopyWith<$R, StaffModel, StaffModel>>?
      get staff;
  AttendanceAuditDetailsCopyWith<$R, AttendanceAuditDetails,
      AttendanceAuditDetails>? get auditDetails;
  ListCopyWith<$R, Map<DateTime, bool>,
          ObjectCopyWith<$R, Map<DateTime, bool>, Map<DateTime, bool>>>?
      get attendanceLog;
  $R call(
      {Map<String, dynamic>? additionalDetails,
      String? id,
      String? tenantId,
      String? registerNumber,
      String? name,
      String? referenceId,
      String? serviceCode,
      String? status,
      bool? nonRecoverableError,
      int? rowVersion,
      int? startDate,
      int? endDate,
      List<AttendeeModel>? attendees,
      List<StaffModel>? staff,
      AttendanceAuditDetails? auditDetails,
      int? completedDays,
      List<Map<DateTime, bool>>? attendanceLog});
  AttendancePackageRegisterModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendancePackageRegisterModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendancePackageRegisterModel, $Out>
    implements
        AttendancePackageRegisterModelCopyWith<$R,
            AttendancePackageRegisterModel, $Out> {
  _AttendancePackageRegisterModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendancePackageRegisterModel> $mapper =
      AttendancePackageRegisterModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails => $value.additionalDetails != null
          ? MapCopyWith(
              $value.additionalDetails!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(additionalDetails: v))
          : null;
  @override
  ListCopyWith<$R, AttendeeModel,
          AttendeeModelCopyWith<$R, AttendeeModel, AttendeeModel>>?
      get attendees => $value.attendees != null
          ? ListCopyWith($value.attendees!, (v, t) => v.copyWith.$chain(t),
              (v) => call(attendees: v))
          : null;
  @override
  ListCopyWith<$R, StaffModel, StaffModelCopyWith<$R, StaffModel, StaffModel>>?
      get staff => $value.staff != null
          ? ListCopyWith($value.staff!, (v, t) => v.copyWith.$chain(t),
              (v) => call(staff: v))
          : null;
  @override
  AttendanceAuditDetailsCopyWith<$R, AttendanceAuditDetails,
          AttendanceAuditDetails>?
      get auditDetails =>
          $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ListCopyWith<$R, Map<DateTime, bool>,
          ObjectCopyWith<$R, Map<DateTime, bool>, Map<DateTime, bool>>>?
      get attendanceLog => $value.attendanceLog != null
          ? ListCopyWith(
              $value.attendanceLog!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(attendanceLog: v))
          : null;
  @override
  $R call(
          {Object? additionalDetails = $none,
          String? id,
          Object? tenantId = $none,
          Object? registerNumber = $none,
          Object? name = $none,
          Object? referenceId = $none,
          Object? serviceCode = $none,
          Object? status = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? attendees = $none,
          Object? staff = $none,
          Object? auditDetails = $none,
          Object? completedDays = $none,
          Object? attendanceLog = $none}) =>
      $apply(FieldCopyWithData({
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (id != null) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (registerNumber != $none) #registerNumber: registerNumber,
        if (name != $none) #name: name,
        if (referenceId != $none) #referenceId: referenceId,
        if (serviceCode != $none) #serviceCode: serviceCode,
        if (status != $none) #status: status,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (attendees != $none) #attendees: attendees,
        if (staff != $none) #staff: staff,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (completedDays != $none) #completedDays: completedDays,
        if (attendanceLog != $none) #attendanceLog: attendanceLog
      }));
  @override
  AttendancePackageRegisterModel $make(CopyWithData data) =>
      AttendancePackageRegisterModel(
          additionalDetails:
              data.get(#additionalDetails, or: $value.additionalDetails),
          id: data.get(#id, or: $value.id),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          registerNumber: data.get(#registerNumber, or: $value.registerNumber),
          name: data.get(#name, or: $value.name),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          serviceCode: data.get(#serviceCode, or: $value.serviceCode),
          status: data.get(#status, or: $value.status),
          nonRecoverableError:
              data.get(#nonRecoverableError, or: $value.nonRecoverableError),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion),
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate),
          attendees: data.get(#attendees, or: $value.attendees),
          staff: data.get(#staff, or: $value.staff),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          completedDays: data.get(#completedDays, or: $value.completedDays),
          attendanceLog: data.get(#attendanceLog, or: $value.attendanceLog));

  @override
  AttendancePackageRegisterModelCopyWith<$R2, AttendancePackageRegisterModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendancePackageRegisterModelCopyWithImpl($value, $cast, t);
}

class AttendanceRegisterAdditionalFieldsMapper
    extends ClassMapperBase<AttendanceRegisterAdditionalFields> {
  AttendanceRegisterAdditionalFieldsMapper._();

  static AttendanceRegisterAdditionalFieldsMapper? _instance;
  static AttendanceRegisterAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendanceRegisterAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceRegisterAdditionalFields';

  static Map<String, dynamic> _$description(
          AttendanceRegisterAdditionalFields v) =>
      v.description;
  static const Field<AttendanceRegisterAdditionalFields, Map<String, dynamic>>
      _f$description = Field('description', _$description);

  @override
  final MappableFields<AttendanceRegisterAdditionalFields> fields = const {
    #description: _f$description,
  };
  @override
  final bool ignoreNull = true;

  static AttendanceRegisterAdditionalFields _instantiate(DecodingData data) {
    return AttendanceRegisterAdditionalFields(
        description: data.dec(_f$description));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceRegisterAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<AttendanceRegisterAdditionalFields>(map);
  }

  static AttendanceRegisterAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<AttendanceRegisterAdditionalFields>(json);
  }
}

mixin AttendanceRegisterAdditionalFieldsMappable {
  String toJson() {
    return AttendanceRegisterAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<AttendanceRegisterAdditionalFields>(
            this as AttendanceRegisterAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return AttendanceRegisterAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<AttendanceRegisterAdditionalFields>(
            this as AttendanceRegisterAdditionalFields);
  }

  AttendanceRegisterAdditionalFieldsCopyWith<
          AttendanceRegisterAdditionalFields,
          AttendanceRegisterAdditionalFields,
          AttendanceRegisterAdditionalFields>
      get copyWith => _AttendanceRegisterAdditionalFieldsCopyWithImpl(
          this as AttendanceRegisterAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return AttendanceRegisterAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as AttendanceRegisterAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AttendanceRegisterAdditionalFieldsMapper.ensureInitialized()
                .isValueEqual(
                    this as AttendanceRegisterAdditionalFields, other));
  }

  @override
  int get hashCode {
    return AttendanceRegisterAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as AttendanceRegisterAdditionalFields);
  }
}

extension AttendanceRegisterAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceRegisterAdditionalFields, $Out> {
  AttendanceRegisterAdditionalFieldsCopyWith<$R,
          AttendanceRegisterAdditionalFields, $Out>
      get $asAttendanceRegisterAdditionalFields => $base.as((v, t, t2) =>
          _AttendanceRegisterAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class AttendanceRegisterAdditionalFieldsCopyWith<
    $R,
    $In extends AttendanceRegisterAdditionalFields,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get description;
  $R call({Map<String, dynamic>? description});
  AttendanceRegisterAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AttendanceRegisterAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceRegisterAdditionalFields, $Out>
    implements
        AttendanceRegisterAdditionalFieldsCopyWith<$R,
            AttendanceRegisterAdditionalFields, $Out> {
  _AttendanceRegisterAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceRegisterAdditionalFields> $mapper =
      AttendanceRegisterAdditionalFieldsMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get description => MapCopyWith(
          $value.description,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(description: v));
  @override
  $R call({Map<String, dynamic>? description}) => $apply(
      FieldCopyWithData({if (description != null) #description: description}));
  @override
  AttendanceRegisterAdditionalFields $make(CopyWithData data) =>
      AttendanceRegisterAdditionalFields(
          description: data.get(#description, or: $value.description));

  @override
  AttendanceRegisterAdditionalFieldsCopyWith<$R2,
      AttendanceRegisterAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendanceRegisterAdditionalFieldsCopyWithImpl($value, $cast, t);
}
