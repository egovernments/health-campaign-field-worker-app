// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'attendance_register.dart';

class AttendanceRegisterSearchModelMapper
    extends SubClassMapperBase<AttendanceRegisterSearchModel> {
  AttendanceRegisterSearchModelMapper._();

  static AttendanceRegisterSearchModelMapper? _instance;
  static AttendanceRegisterSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendanceRegisterSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceRegisterSearchModel';

  static String? _$id(AttendanceRegisterSearchModel v) => v.id;
  static const Field<AttendanceRegisterSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$staffId(AttendanceRegisterSearchModel v) => v.staffId;
  static const Field<AttendanceRegisterSearchModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$registerNumber(AttendanceRegisterSearchModel v) =>
      v.registerNumber;
  static const Field<AttendanceRegisterSearchModel, String> _f$registerNumber =
      Field('registerNumber', _$registerNumber, opt: true);
  static String? _$status(AttendanceRegisterSearchModel v) => v.status;
  static const Field<AttendanceRegisterSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$serviceCode(AttendanceRegisterSearchModel v) =>
      v.serviceCode;
  static const Field<AttendanceRegisterSearchModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);
  static String? _$referenceId(AttendanceRegisterSearchModel v) =>
      v.referenceId;
  static const Field<AttendanceRegisterSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static int? _$offSet(AttendanceRegisterSearchModel v) => v.offSet;
  static const Field<AttendanceRegisterSearchModel, int> _f$offSet =
      Field('offSet', _$offSet, opt: true);
  static int? _$limit(AttendanceRegisterSearchModel v) => v.limit;
  static const Field<AttendanceRegisterSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static String? _$boundaryCode(AttendanceRegisterSearchModel v) =>
      v.boundaryCode;
  static const Field<AttendanceRegisterSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(AttendanceRegisterSearchModel v) =>
      v.auditDetails;
  static const Field<AttendanceRegisterSearchModel, AuditDetails>
      _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(
          AttendanceRegisterSearchModel v) =>
      v.additionalFields;
  static const Field<AttendanceRegisterSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<AttendanceRegisterSearchModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #registerNumber: _f$registerNumber,
    #status: _f$status,
    #serviceCode: _f$serviceCode,
    #referenceId: _f$referenceId,
    #offSet: _f$offSet,
    #limit: _f$limit,
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

  static AttendanceRegisterSearchModel _instantiate(DecodingData data) {
    return AttendanceRegisterSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        registerNumber: data.dec(_f$registerNumber),
        status: data.dec(_f$status),
        serviceCode: data.dec(_f$serviceCode),
        referenceId: data.dec(_f$referenceId),
        offSet: data.dec(_f$offSet),
        limit: data.dec(_f$limit),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceRegisterSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceRegisterSearchModel>(map);
  }

  static AttendanceRegisterSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceRegisterSearchModel>(json);
  }
}

mixin AttendanceRegisterSearchModelMappable {
  String toJson() {
    return AttendanceRegisterSearchModelMapper.ensureInitialized()
        .encodeJson<AttendanceRegisterSearchModel>(
            this as AttendanceRegisterSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AttendanceRegisterSearchModelMapper.ensureInitialized()
        .encodeMap<AttendanceRegisterSearchModel>(
            this as AttendanceRegisterSearchModel);
  }

  AttendanceRegisterSearchModelCopyWith<AttendanceRegisterSearchModel,
          AttendanceRegisterSearchModel, AttendanceRegisterSearchModel>
      get copyWith => _AttendanceRegisterSearchModelCopyWithImpl(
          this as AttendanceRegisterSearchModel, $identity, $identity);
  @override
  String toString() {
    return AttendanceRegisterSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AttendanceRegisterSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return AttendanceRegisterSearchModelMapper.ensureInitialized()
        .equalsValue(this as AttendanceRegisterSearchModel, other);
  }

  @override
  int get hashCode {
    return AttendanceRegisterSearchModelMapper.ensureInitialized()
        .hashValue(this as AttendanceRegisterSearchModel);
  }
}

extension AttendanceRegisterSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceRegisterSearchModel, $Out> {
  AttendanceRegisterSearchModelCopyWith<$R, AttendanceRegisterSearchModel, $Out>
      get $asAttendanceRegisterSearchModel => $base.as(
          (v, t, t2) => _AttendanceRegisterSearchModelCopyWithImpl(v, t, t2));
}

abstract class AttendanceRegisterSearchModelCopyWith<
    $R,
    $In extends AttendanceRegisterSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? staffId,
      String? registerNumber,
      String? status,
      String? serviceCode,
      String? referenceId,
      int? offSet,
      int? limit,
      String? boundaryCode});
  AttendanceRegisterSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceRegisterSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceRegisterSearchModel, $Out>
    implements
        AttendanceRegisterSearchModelCopyWith<$R, AttendanceRegisterSearchModel,
            $Out> {
  _AttendanceRegisterSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceRegisterSearchModel> $mapper =
      AttendanceRegisterSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? staffId = $none,
          Object? registerNumber = $none,
          Object? status = $none,
          Object? serviceCode = $none,
          Object? referenceId = $none,
          Object? offSet = $none,
          Object? limit = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (registerNumber != $none) #registerNumber: registerNumber,
        if (status != $none) #status: status,
        if (serviceCode != $none) #serviceCode: serviceCode,
        if (referenceId != $none) #referenceId: referenceId,
        if (offSet != $none) #offSet: offSet,
        if (limit != $none) #limit: limit,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  AttendanceRegisterSearchModel $make(CopyWithData data) =>
      AttendanceRegisterSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          staffId: data.get(#staffId, or: $value.staffId),
          registerNumber: data.get(#registerNumber, or: $value.registerNumber),
          status: data.get(#status, or: $value.status),
          serviceCode: data.get(#serviceCode, or: $value.serviceCode),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          offSet: data.get(#offSet, or: $value.offSet),
          limit: data.get(#limit, or: $value.limit),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  AttendanceRegisterSearchModelCopyWith<$R2, AttendanceRegisterSearchModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AttendanceRegisterSearchModelCopyWithImpl($value, $cast, t);
}

class AttendanceRegisterModelMapper
    extends SubClassMapperBase<AttendanceRegisterModel> {
  AttendanceRegisterModelMapper._();

  static AttendanceRegisterModelMapper? _instance;
  static AttendanceRegisterModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AttendanceRegisterModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AttendanceRegisterModel';

  static String _$id(AttendanceRegisterModel v) => v.id;
  static const Field<AttendanceRegisterModel, String> _f$id = Field('id', _$id);
  static String? _$tenantId(AttendanceRegisterModel v) => v.tenantId;
  static const Field<AttendanceRegisterModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$registerNumber(AttendanceRegisterModel v) =>
      v.registerNumber;
  static const Field<AttendanceRegisterModel, String> _f$registerNumber =
      Field('registerNumber', _$registerNumber, opt: true);
  static String? _$name(AttendanceRegisterModel v) => v.name;
  static const Field<AttendanceRegisterModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$referenceId(AttendanceRegisterModel v) => v.referenceId;
  static const Field<AttendanceRegisterModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$serviceCode(AttendanceRegisterModel v) => v.serviceCode;
  static const Field<AttendanceRegisterModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);
  static String? _$status(AttendanceRegisterModel v) => v.status;
  static const Field<AttendanceRegisterModel, String> _f$status =
      Field('status', _$status, opt: true);
  static bool? _$nonRecoverableError(AttendanceRegisterModel v) =>
      v.nonRecoverableError;
  static const Field<AttendanceRegisterModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(AttendanceRegisterModel v) => v.rowVersion;
  static const Field<AttendanceRegisterModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int? _$startDate(AttendanceRegisterModel v) => v.startDate;
  static const Field<AttendanceRegisterModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(AttendanceRegisterModel v) => v.endDate;
  static const Field<AttendanceRegisterModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static List<IndividualModel>? _$individualList(AttendanceRegisterModel v) =>
      v.individualList;
  static const Field<AttendanceRegisterModel, List<IndividualModel>>
      _f$individualList = Field('individualList', _$individualList, opt: true);
  static List<AttendeeModel>? _$attendees(AttendanceRegisterModel v) =>
      v.attendees;
  static const Field<AttendanceRegisterModel, List<AttendeeModel>>
      _f$attendees = Field('attendees', _$attendees, opt: true);
  static List<StaffModel>? _$staff(AttendanceRegisterModel v) => v.staff;
  static const Field<AttendanceRegisterModel, List<StaffModel>> _f$staff =
      Field('staff', _$staff, opt: true);
  static int? _$completedDays(AttendanceRegisterModel v) => v.completedDays;
  static const Field<AttendanceRegisterModel, int> _f$completedDays =
      Field('completedDays', _$completedDays, opt: true, def: 0);
  static List<Map<DateTime, bool>>? _$attendanceLog(
          AttendanceRegisterModel v) =>
      v.attendanceLog;
  static const Field<AttendanceRegisterModel, List<Map<DateTime, bool>>>
      _f$attendanceLog =
      Field('attendanceLog', _$attendanceLog, opt: true, def: const []);
  static Map<String, dynamic>? _$additionalDetails(AttendanceRegisterModel v) =>
      v.additionalDetails;
  static const Field<AttendanceRegisterModel, Map<String, dynamic>>
      _f$additionalDetails =
      Field('additionalDetails', _$additionalDetails, opt: true);
  static AuditDetails? _$auditDetails(AttendanceRegisterModel v) =>
      v.auditDetails;
  static const Field<AttendanceRegisterModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(AttendanceRegisterModel v) =>
      v.clientAuditDetails;
  static const Field<AttendanceRegisterModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(AttendanceRegisterModel v) => v.isDeleted;
  static const Field<AttendanceRegisterModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<AttendanceRegisterModel> fields = const {
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
    #individualList: _f$individualList,
    #attendees: _f$attendees,
    #staff: _f$staff,
    #completedDays: _f$completedDays,
    #attendanceLog: _f$attendanceLog,
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

  static AttendanceRegisterModel _instantiate(DecodingData data) {
    return AttendanceRegisterModel(
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
        individualList: data.dec(_f$individualList),
        attendees: data.dec(_f$attendees),
        staff: data.dec(_f$staff),
        completedDays: data.dec(_f$completedDays),
        attendanceLog: data.dec(_f$attendanceLog),
        additionalDetails: data.dec(_f$additionalDetails),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static AttendanceRegisterModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AttendanceRegisterModel>(map);
  }

  static AttendanceRegisterModel fromJson(String json) {
    return ensureInitialized().decodeJson<AttendanceRegisterModel>(json);
  }
}

mixin AttendanceRegisterModelMappable {
  String toJson() {
    return AttendanceRegisterModelMapper.ensureInitialized()
        .encodeJson<AttendanceRegisterModel>(this as AttendanceRegisterModel);
  }

  Map<String, dynamic> toMap() {
    return AttendanceRegisterModelMapper.ensureInitialized()
        .encodeMap<AttendanceRegisterModel>(this as AttendanceRegisterModel);
  }

  AttendanceRegisterModelCopyWith<AttendanceRegisterModel,
          AttendanceRegisterModel, AttendanceRegisterModel>
      get copyWith => _AttendanceRegisterModelCopyWithImpl(
          this as AttendanceRegisterModel, $identity, $identity);
  @override
  String toString() {
    return AttendanceRegisterModelMapper.ensureInitialized()
        .stringifyValue(this as AttendanceRegisterModel);
  }

  @override
  bool operator ==(Object other) {
    return AttendanceRegisterModelMapper.ensureInitialized()
        .equalsValue(this as AttendanceRegisterModel, other);
  }

  @override
  int get hashCode {
    return AttendanceRegisterModelMapper.ensureInitialized()
        .hashValue(this as AttendanceRegisterModel);
  }
}

extension AttendanceRegisterModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AttendanceRegisterModel, $Out> {
  AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel, $Out>
      get $asAttendanceRegisterModel => $base
          .as((v, t, t2) => _AttendanceRegisterModelCopyWithImpl(v, t, t2));
}

abstract class AttendanceRegisterModelCopyWith<
    $R,
    $In extends AttendanceRegisterModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList;
  ListCopyWith<$R, AttendeeModel,
      AttendeeModelCopyWith<$R, AttendeeModel, AttendeeModel>>? get attendees;
  ListCopyWith<$R, StaffModel, StaffModelCopyWith<$R, StaffModel, StaffModel>>?
      get staff;
  ListCopyWith<$R, Map<DateTime, bool>,
          ObjectCopyWith<$R, Map<DateTime, bool>, Map<DateTime, bool>>>?
      get attendanceLog;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get additionalDetails;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {String? id,
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
      List<IndividualModel>? individualList,
      List<AttendeeModel>? attendees,
      List<StaffModel>? staff,
      int? completedDays,
      List<Map<DateTime, bool>>? attendanceLog,
      Map<String, dynamic>? additionalDetails,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  AttendanceRegisterModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AttendanceRegisterModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AttendanceRegisterModel, $Out>
    implements
        AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel, $Out> {
  _AttendanceRegisterModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AttendanceRegisterModel> $mapper =
      AttendanceRegisterModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList => $value.individualList != null
          ? ListCopyWith($value.individualList!, (v, t) => v.copyWith.$chain(t),
              (v) => call(individualList: v))
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
  ListCopyWith<$R, Map<DateTime, bool>,
          ObjectCopyWith<$R, Map<DateTime, bool>, Map<DateTime, bool>>>?
      get attendanceLog => $value.attendanceLog != null
          ? ListCopyWith(
              $value.attendanceLog!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(attendanceLog: v))
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
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {String? id,
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
          Object? individualList = $none,
          Object? attendees = $none,
          Object? staff = $none,
          Object? completedDays = $none,
          Object? attendanceLog = $none,
          Object? additionalDetails = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
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
        if (individualList != $none) #individualList: individualList,
        if (attendees != $none) #attendees: attendees,
        if (staff != $none) #staff: staff,
        if (completedDays != $none) #completedDays: completedDays,
        if (attendanceLog != $none) #attendanceLog: attendanceLog,
        if (additionalDetails != $none) #additionalDetails: additionalDetails,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  AttendanceRegisterModel $make(CopyWithData data) => AttendanceRegisterModel(
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
      individualList: data.get(#individualList, or: $value.individualList),
      attendees: data.get(#attendees, or: $value.attendees),
      staff: data.get(#staff, or: $value.staff),
      completedDays: data.get(#completedDays, or: $value.completedDays),
      attendanceLog: data.get(#attendanceLog, or: $value.attendanceLog),
      additionalDetails:
          data.get(#additionalDetails, or: $value.additionalDetails),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  AttendanceRegisterModelCopyWith<$R2, AttendanceRegisterModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AttendanceRegisterModelCopyWithImpl($value, $cast, t);
}
