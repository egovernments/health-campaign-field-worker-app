// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_attendance_log_model.dart';

class HCMAttendanceLogSearchModelMapper
    extends ClassMapperBase<HCMAttendanceLogSearchModel> {
  HCMAttendanceLogSearchModelMapper._();

  static HCMAttendanceLogSearchModelMapper? _instance;
  static HCMAttendanceLogSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceLogSearchModelMapper._());
      EntitySearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceLogSearchModel';

  static AttendanceLogSearchModel? _$attendanceSearchModel(
          HCMAttendanceLogSearchModel v) =>
      v.attendanceSearchModel;
  static const Field<HCMAttendanceLogSearchModel, AttendanceLogSearchModel>
      _f$attendanceSearchModel =
      Field('attendanceSearchModel', _$attendanceSearchModel, opt: true);
  static AdditionalFields? _$additionalFields(HCMAttendanceLogSearchModel v) =>
      v.additionalFields;
  static const Field<HCMAttendanceLogSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(HCMAttendanceLogSearchModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceLogSearchModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);

  @override
  final MappableFields<HCMAttendanceLogSearchModel> fields = const {
    #attendanceSearchModel: _f$attendanceSearchModel,
    #additionalFields: _f$additionalFields,
    #auditDetails: _f$auditDetails,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceLogSearchModel _instantiate(DecodingData data) {
    return HCMAttendanceLogSearchModel.ignoreDeleted(
        attendanceSearchModel: data.dec(_f$attendanceSearchModel),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceLogSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceLogSearchModel>(map);
  }

  static HCMAttendanceLogSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceLogSearchModel>(json);
  }
}

mixin HCMAttendanceLogSearchModelMappable {
  String toJson() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceLogSearchModel>(
            this as HCMAttendanceLogSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceLogSearchModel>(
            this as HCMAttendanceLogSearchModel);
  }

  HCMAttendanceLogSearchModelCopyWith<HCMAttendanceLogSearchModel,
          HCMAttendanceLogSearchModel, HCMAttendanceLogSearchModel>
      get copyWith => _HCMAttendanceLogSearchModelCopyWithImpl(
          this as HCMAttendanceLogSearchModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceLogSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceLogSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceLogSearchModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceLogSearchModel);
  }
}

extension HCMAttendanceLogSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceLogSearchModel, $Out> {
  HCMAttendanceLogSearchModelCopyWith<$R, HCMAttendanceLogSearchModel, $Out>
      get $asHCMAttendanceLogSearchModel => $base
          .as((v, t, t2) => _HCMAttendanceLogSearchModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceLogSearchModelCopyWith<
    $R,
    $In extends HCMAttendanceLogSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  AttendanceLogSearchModelCopyWith<$R, AttendanceLogSearchModel,
      AttendanceLogSearchModel>? get attendanceSearchModel;
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {AttendanceLogSearchModel? attendanceSearchModel,
      AdditionalFields? additionalFields,
      AuditDetails? auditDetails});
  HCMAttendanceLogSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceLogSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceLogSearchModel, $Out>
    implements
        HCMAttendanceLogSearchModelCopyWith<$R, HCMAttendanceLogSearchModel,
            $Out> {
  _HCMAttendanceLogSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceLogSearchModel> $mapper =
      HCMAttendanceLogSearchModelMapper.ensureInitialized();
  @override
  AttendanceLogSearchModelCopyWith<$R, AttendanceLogSearchModel,
          AttendanceLogSearchModel>?
      get attendanceSearchModel => $value.attendanceSearchModel?.copyWith
          .$chain((v) => call(attendanceSearchModel: v));
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? attendanceSearchModel = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (attendanceSearchModel != $none)
          #attendanceSearchModel: attendanceSearchModel,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  HCMAttendanceLogSearchModel $make(CopyWithData data) =>
      HCMAttendanceLogSearchModel.ignoreDeleted(
          attendanceSearchModel: data.get(#attendanceSearchModel,
              or: $value.attendanceSearchModel),
          additionalFields:
              data.get(#additionalFields, or: $value.additionalFields),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  HCMAttendanceLogSearchModelCopyWith<$R2, HCMAttendanceLogSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceLogSearchModelCopyWithImpl($value, $cast, t);
}

class HCMAttendanceLogModelMapper
    extends SubClassMapperBase<HCMAttendanceLogModel> {
  HCMAttendanceLogModelMapper._();

  static HCMAttendanceLogModelMapper? _instance;
  static HCMAttendanceLogModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HCMAttendanceLogModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceLogModel';

  static AttendanceLogModel? _$attendance(HCMAttendanceLogModel v) =>
      v.attendance;
  static const Field<HCMAttendanceLogModel, AttendanceLogModel> _f$attendance =
      Field('attendance', _$attendance, opt: true);
  static bool? _$nonRecoverableError(HCMAttendanceLogModel v) =>
      v.nonRecoverableError;
  static const Field<HCMAttendanceLogModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(HCMAttendanceLogModel v) => v.rowVersion;
  static const Field<HCMAttendanceLogModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AuditDetails? _$auditDetails(HCMAttendanceLogModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceLogModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HCMAttendanceLogModel v) =>
      v.clientAuditDetails;
  static const Field<HCMAttendanceLogModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HCMAttendanceLogModel v) => v.isDeleted;
  static const Field<HCMAttendanceLogModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HCMAttendanceLogModel> fields = const {
    #attendance: _f$attendance,
    #nonRecoverableError: _f$nonRecoverableError,
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

  static HCMAttendanceLogModel _instantiate(DecodingData data) {
    return HCMAttendanceLogModel(
        attendance: data.dec(_f$attendance),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceLogModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceLogModel>(map);
  }

  static HCMAttendanceLogModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceLogModel>(json);
  }
}

mixin HCMAttendanceLogModelMappable {
  String toJson() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceLogModel>(this as HCMAttendanceLogModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceLogModel>(this as HCMAttendanceLogModel);
  }

  HCMAttendanceLogModelCopyWith<HCMAttendanceLogModel, HCMAttendanceLogModel,
          HCMAttendanceLogModel>
      get copyWith => _HCMAttendanceLogModelCopyWithImpl(
          this as HCMAttendanceLogModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceLogModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceLogModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceLogModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceLogModel);
  }
}

extension HCMAttendanceLogModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceLogModel, $Out> {
  HCMAttendanceLogModelCopyWith<$R, HCMAttendanceLogModel, $Out>
      get $asHCMAttendanceLogModel =>
          $base.as((v, t, t2) => _HCMAttendanceLogModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceLogModelCopyWith<
    $R,
    $In extends HCMAttendanceLogModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  AttendanceLogModelCopyWith<$R, AttendanceLogModel, AttendanceLogModel>?
      get attendance;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {AttendanceLogModel? attendance,
      bool? nonRecoverableError,
      int? rowVersion,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HCMAttendanceLogModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceLogModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceLogModel, $Out>
    implements HCMAttendanceLogModelCopyWith<$R, HCMAttendanceLogModel, $Out> {
  _HCMAttendanceLogModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceLogModel> $mapper =
      HCMAttendanceLogModelMapper.ensureInitialized();
  @override
  AttendanceLogModelCopyWith<$R, AttendanceLogModel, AttendanceLogModel>?
      get attendance =>
          $value.attendance?.copyWith.$chain((v) => call(attendance: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? attendance = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (attendance != $none) #attendance: attendance,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HCMAttendanceLogModel $make(CopyWithData data) => HCMAttendanceLogModel(
      attendance: data.get(#attendance, or: $value.attendance),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HCMAttendanceLogModelCopyWith<$R2, HCMAttendanceLogModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceLogModelCopyWithImpl($value, $cast, t);
}
