// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_attendance_model.dart';

class HCMAttendanceSearchModelMapper
    extends ClassMapperBase<HCMAttendanceSearchModel> {
  HCMAttendanceSearchModelMapper._();

  static HCMAttendanceSearchModelMapper? _instance;
  static HCMAttendanceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceSearchModelMapper._());
      EntitySearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceSearchModel';

  static String? _$id(HCMAttendanceSearchModel v) => v.id;
  static const Field<HCMAttendanceSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$staffId(HCMAttendanceSearchModel v) => v.staffId;
  static const Field<HCMAttendanceSearchModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$registerNumber(HCMAttendanceSearchModel v) =>
      v.registerNumber;
  static const Field<HCMAttendanceSearchModel, String> _f$registerNumber =
      Field('registerNumber', _$registerNumber, opt: true);
  static String? _$status(HCMAttendanceSearchModel v) => v.status;
  static const Field<HCMAttendanceSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$referenceId(HCMAttendanceSearchModel v) => v.referenceId;
  static const Field<HCMAttendanceSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$serviceCode(HCMAttendanceSearchModel v) => v.serviceCode;
  static const Field<HCMAttendanceSearchModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);
  static AdditionalFields? _$additionalFields(HCMAttendanceSearchModel v) =>
      v.additionalFields;
  static const Field<HCMAttendanceSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(HCMAttendanceSearchModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);

  @override
  final MappableFields<HCMAttendanceSearchModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #registerNumber: _f$registerNumber,
    #status: _f$status,
    #referenceId: _f$referenceId,
    #serviceCode: _f$serviceCode,
    #additionalFields: _f$additionalFields,
    #auditDetails: _f$auditDetails,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceSearchModel _instantiate(DecodingData data) {
    return HCMAttendanceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        registerNumber: data.dec(_f$registerNumber),
        status: data.dec(_f$status),
        referenceId: data.dec(_f$referenceId),
        serviceCode: data.dec(_f$serviceCode),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceSearchModel>(map);
  }

  static HCMAttendanceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceSearchModel>(json);
  }
}

mixin HCMAttendanceSearchModelMappable {
  String toJson() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceSearchModel>(this as HCMAttendanceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceSearchModel>(this as HCMAttendanceSearchModel);
  }

  HCMAttendanceSearchModelCopyWith<HCMAttendanceSearchModel,
          HCMAttendanceSearchModel, HCMAttendanceSearchModel>
      get copyWith => _HCMAttendanceSearchModelCopyWithImpl(
          this as HCMAttendanceSearchModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceSearchModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceSearchModel);
  }
}

extension HCMAttendanceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceSearchModel, $Out> {
  HCMAttendanceSearchModelCopyWith<$R, HCMAttendanceSearchModel, $Out>
      get $asHCMAttendanceSearchModel => $base
          .as((v, t, t2) => _HCMAttendanceSearchModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceSearchModelCopyWith<
    $R,
    $In extends HCMAttendanceSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? id,
      String? staffId,
      String? registerNumber,
      String? status,
      String? referenceId,
      String? serviceCode,
      AdditionalFields? additionalFields,
      AuditDetails? auditDetails});
  HCMAttendanceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceSearchModel, $Out>
    implements
        HCMAttendanceSearchModelCopyWith<$R, HCMAttendanceSearchModel, $Out> {
  _HCMAttendanceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceSearchModel> $mapper =
      HCMAttendanceSearchModelMapper.ensureInitialized();
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          Object? staffId = $none,
          Object? registerNumber = $none,
          Object? status = $none,
          Object? referenceId = $none,
          Object? serviceCode = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (registerNumber != $none) #registerNumber: registerNumber,
        if (status != $none) #status: status,
        if (referenceId != $none) #referenceId: referenceId,
        if (serviceCode != $none) #serviceCode: serviceCode,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  HCMAttendanceSearchModel $make(CopyWithData data) =>
      HCMAttendanceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          staffId: data.get(#staffId, or: $value.staffId),
          registerNumber: data.get(#registerNumber, or: $value.registerNumber),
          status: data.get(#status, or: $value.status),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          serviceCode: data.get(#serviceCode, or: $value.serviceCode),
          additionalFields:
              data.get(#additionalFields, or: $value.additionalFields),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  HCMAttendanceSearchModelCopyWith<$R2, HCMAttendanceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceSearchModelCopyWithImpl($value, $cast, t);
}

class HCMAttendanceAdditionalModelMapper
    extends ClassMapperBase<HCMAttendanceAdditionalModel> {
  HCMAttendanceAdditionalModelMapper._();

  static HCMAttendanceAdditionalModelMapper? _instance;
  static HCMAttendanceAdditionalModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceAdditionalModelMapper._());
      AdditionalFieldsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceAdditionalModel';

  static AttendanceRegisterAdditionalFields _$attendanceAdditionalFields(
          HCMAttendanceAdditionalModel v) =>
      v.attendanceAdditionalFields;
  static const Field<HCMAttendanceAdditionalModel,
          AttendanceRegisterAdditionalFields> _f$attendanceAdditionalFields =
      Field('attendanceAdditionalFields', _$attendanceAdditionalFields);
  static String _$schema(HCMAttendanceAdditionalModel v) => v.schema;
  static const Field<HCMAttendanceAdditionalModel, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'AttendanceRegister');
  static int _$version(HCMAttendanceAdditionalModel v) => v.version;
  static const Field<HCMAttendanceAdditionalModel, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HCMAttendanceAdditionalModel v) =>
      v.fields;
  static const Field<HCMAttendanceAdditionalModel, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, mode: FieldMode.member);

  @override
  final MappableFields<HCMAttendanceAdditionalModel> fields = const {
    #attendanceAdditionalFields: _f$attendanceAdditionalFields,
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceAdditionalModel _instantiate(DecodingData data) {
    return HCMAttendanceAdditionalModel(
        attendanceAdditionalFields: data.dec(_f$attendanceAdditionalFields),
        schema: data.dec(_f$schema),
        version: data.dec(_f$version));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceAdditionalModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceAdditionalModel>(map);
  }

  static HCMAttendanceAdditionalModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceAdditionalModel>(json);
  }
}

mixin HCMAttendanceAdditionalModelMappable {
  String toJson() {
    return HCMAttendanceAdditionalModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceAdditionalModel>(
            this as HCMAttendanceAdditionalModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceAdditionalModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceAdditionalModel>(
            this as HCMAttendanceAdditionalModel);
  }

  HCMAttendanceAdditionalModelCopyWith<HCMAttendanceAdditionalModel,
          HCMAttendanceAdditionalModel, HCMAttendanceAdditionalModel>
      get copyWith => _HCMAttendanceAdditionalModelCopyWithImpl(
          this as HCMAttendanceAdditionalModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceAdditionalModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceAdditionalModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceAdditionalModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceAdditionalModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceAdditionalModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceAdditionalModel);
  }
}

extension HCMAttendanceAdditionalModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceAdditionalModel, $Out> {
  HCMAttendanceAdditionalModelCopyWith<$R, HCMAttendanceAdditionalModel, $Out>
      get $asHCMAttendanceAdditionalModel => $base.as(
          (v, t, t2) => _HCMAttendanceAdditionalModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceAdditionalModelCopyWith<
    $R,
    $In extends HCMAttendanceAdditionalModel,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  AttendanceRegisterAdditionalFieldsCopyWith<
      $R,
      AttendanceRegisterAdditionalFields,
      AttendanceRegisterAdditionalFields> get attendanceAdditionalFields;
  @override
  $R call(
      {AttendanceRegisterAdditionalFields? attendanceAdditionalFields,
      String? schema,
      int? version});
  HCMAttendanceAdditionalModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceAdditionalModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceAdditionalModel, $Out>
    implements
        HCMAttendanceAdditionalModelCopyWith<$R, HCMAttendanceAdditionalModel,
            $Out> {
  _HCMAttendanceAdditionalModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceAdditionalModel> $mapper =
      HCMAttendanceAdditionalModelMapper.ensureInitialized();
  @override
  AttendanceRegisterAdditionalFieldsCopyWith<
          $R,
          AttendanceRegisterAdditionalFields,
          AttendanceRegisterAdditionalFields>
      get attendanceAdditionalFields =>
          $value.attendanceAdditionalFields.copyWith
              .$chain((v) => call(attendanceAdditionalFields: v));
  @override
  $R call(
          {AttendanceRegisterAdditionalFields? attendanceAdditionalFields,
          String? schema,
          int? version}) =>
      $apply(FieldCopyWithData({
        if (attendanceAdditionalFields != null)
          #attendanceAdditionalFields: attendanceAdditionalFields,
        if (schema != null) #schema: schema,
        if (version != null) #version: version
      }));
  @override
  HCMAttendanceAdditionalModel $make(CopyWithData data) =>
      HCMAttendanceAdditionalModel(
          attendanceAdditionalFields: data.get(#attendanceAdditionalFields,
              or: $value.attendanceAdditionalFields),
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version));

  @override
  HCMAttendanceAdditionalModelCopyWith<$R2, HCMAttendanceAdditionalModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceAdditionalModelCopyWithImpl($value, $cast, t);
}

class HCMAttendanceRegisterModelMapper
    extends ClassMapperBase<HCMAttendanceRegisterModel> {
  HCMAttendanceRegisterModelMapper._();

  static HCMAttendanceRegisterModelMapper? _instance;
  static HCMAttendanceRegisterModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceRegisterModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceRegisterModel';

  static AttendanceRegisterModel _$attendanceRegister(
          HCMAttendanceRegisterModel v) =>
      v.attendanceRegister;
  static const Field<HCMAttendanceRegisterModel, AttendanceRegisterModel>
      _f$attendanceRegister = Field('attendanceRegister', _$attendanceRegister);
  static List<IndividualModel>? _$individualList(
          HCMAttendanceRegisterModel v) =>
      v.individualList;
  static const Field<HCMAttendanceRegisterModel, List<IndividualModel>>
      _f$individualList = Field('individualList', _$individualList, opt: true);
  static AuditDetails? _$auditDetails(HCMAttendanceRegisterModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceRegisterModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(
          HCMAttendanceRegisterModel v) =>
      v.clientAuditDetails;
  static const Field<HCMAttendanceRegisterModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(HCMAttendanceRegisterModel v) => v.isDeleted;
  static const Field<HCMAttendanceRegisterModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<HCMAttendanceRegisterModel> fields = const {
    #attendanceRegister: _f$attendanceRegister,
    #individualList: _f$individualList,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceRegisterModel _instantiate(DecodingData data) {
    return HCMAttendanceRegisterModel(
        attendanceRegister: data.dec(_f$attendanceRegister),
        individualList: data.dec(_f$individualList),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceRegisterModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceRegisterModel>(map);
  }

  static HCMAttendanceRegisterModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceRegisterModel>(json);
  }
}

mixin HCMAttendanceRegisterModelMappable {
  String toJson() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceRegisterModel>(
            this as HCMAttendanceRegisterModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceRegisterModel>(
            this as HCMAttendanceRegisterModel);
  }

  HCMAttendanceRegisterModelCopyWith<HCMAttendanceRegisterModel,
          HCMAttendanceRegisterModel, HCMAttendanceRegisterModel>
      get copyWith => _HCMAttendanceRegisterModelCopyWithImpl(
          this as HCMAttendanceRegisterModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceRegisterModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceRegisterModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceRegisterModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceRegisterModel);
  }
}

extension HCMAttendanceRegisterModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceRegisterModel, $Out> {
  HCMAttendanceRegisterModelCopyWith<$R, HCMAttendanceRegisterModel, $Out>
      get $asHCMAttendanceRegisterModel => $base
          .as((v, t, t2) => _HCMAttendanceRegisterModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceRegisterModelCopyWith<
    $R,
    $In extends HCMAttendanceRegisterModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel,
      AttendanceRegisterModel> get attendanceRegister;
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {AttendanceRegisterModel? attendanceRegister,
      List<IndividualModel>? individualList,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  HCMAttendanceRegisterModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceRegisterModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceRegisterModel, $Out>
    implements
        HCMAttendanceRegisterModelCopyWith<$R, HCMAttendanceRegisterModel,
            $Out> {
  _HCMAttendanceRegisterModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceRegisterModel> $mapper =
      HCMAttendanceRegisterModelMapper.ensureInitialized();
  @override
  AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel,
          AttendanceRegisterModel>
      get attendanceRegister => $value.attendanceRegister.copyWith
          .$chain((v) => call(attendanceRegister: v));
  @override
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList => $value.individualList != null
          ? ListCopyWith($value.individualList!, (v, t) => v.copyWith.$chain(t),
              (v) => call(individualList: v))
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
          {AttendanceRegisterModel? attendanceRegister,
          Object? individualList = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (attendanceRegister != null) #attendanceRegister: attendanceRegister,
        if (individualList != $none) #individualList: individualList,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  HCMAttendanceRegisterModel $make(
          CopyWithData data) =>
      HCMAttendanceRegisterModel(
          attendanceRegister:
              data.get(#attendanceRegister, or: $value.attendanceRegister),
          individualList: data.get(#individualList, or: $value.individualList),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          clientAuditDetails:
              data.get(#clientAuditDetails, or: $value.clientAuditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  HCMAttendanceRegisterModelCopyWith<$R2, HCMAttendanceRegisterModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceRegisterModelCopyWithImpl($value, $cast, t);
}
