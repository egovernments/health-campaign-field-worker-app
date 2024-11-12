// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pgr_complaints_response.dart';

class PgrServiceCreateResponseModelMapper
    extends ClassMapperBase<PgrServiceCreateResponseModel> {
  PgrServiceCreateResponseModelMapper._();

  static PgrServiceCreateResponseModelMapper? _instance;
  static PgrServiceCreateResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrServiceCreateResponseModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrServiceCreateResponseModel';

  static List<PgrComplaintResponseModel> _$serviceWrappers(
          PgrServiceCreateResponseModel v) =>
      v.serviceWrappers;
  static const Field<PgrServiceCreateResponseModel,
          List<PgrComplaintResponseModel>> _f$serviceWrappers =
      Field('serviceWrappers', _$serviceWrappers,
          key: 'ServiceWrappers', opt: true, def: const []);
  static AuditDetails? _$auditDetails(PgrServiceCreateResponseModel v) =>
      v.auditDetails;
  static const Field<PgrServiceCreateResponseModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);
  static bool? _$isDeleted(PgrServiceCreateResponseModel v) => v.isDeleted;
  static const Field<PgrServiceCreateResponseModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static ClientAuditDetails? _$clientAuditDetails(
          PgrServiceCreateResponseModel v) =>
      v.clientAuditDetails;
  static const Field<PgrServiceCreateResponseModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrServiceCreateResponseModel> fields = const {
    #serviceWrappers: _f$serviceWrappers,
    #auditDetails: _f$auditDetails,
    #isDeleted: _f$isDeleted,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrServiceCreateResponseModel _instantiate(DecodingData data) {
    return PgrServiceCreateResponseModel(
        serviceWrappers: data.dec(_f$serviceWrappers),
        auditDetails: data.dec(_f$auditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrServiceCreateResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrServiceCreateResponseModel>(map);
  }

  static PgrServiceCreateResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrServiceCreateResponseModel>(json);
  }
}

mixin PgrServiceCreateResponseModelMappable {
  String toJson() {
    return PgrServiceCreateResponseModelMapper.ensureInitialized()
        .encodeJson<PgrServiceCreateResponseModel>(
            this as PgrServiceCreateResponseModel);
  }

  Map<String, dynamic> toMap() {
    return PgrServiceCreateResponseModelMapper.ensureInitialized()
        .encodeMap<PgrServiceCreateResponseModel>(
            this as PgrServiceCreateResponseModel);
  }

  PgrServiceCreateResponseModelCopyWith<PgrServiceCreateResponseModel,
          PgrServiceCreateResponseModel, PgrServiceCreateResponseModel>
      get copyWith => _PgrServiceCreateResponseModelCopyWithImpl(
          this as PgrServiceCreateResponseModel, $identity, $identity);
  @override
  String toString() {
    return PgrServiceCreateResponseModelMapper.ensureInitialized()
        .stringifyValue(this as PgrServiceCreateResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrServiceCreateResponseModelMapper.ensureInitialized()
                .isValueEqual(this as PgrServiceCreateResponseModel, other));
  }

  @override
  int get hashCode {
    return PgrServiceCreateResponseModelMapper.ensureInitialized()
        .hashValue(this as PgrServiceCreateResponseModel);
  }
}

extension PgrServiceCreateResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrServiceCreateResponseModel, $Out> {
  PgrServiceCreateResponseModelCopyWith<$R, PgrServiceCreateResponseModel, $Out>
      get $asPgrServiceCreateResponseModel => $base.as(
          (v, t, t2) => _PgrServiceCreateResponseModelCopyWithImpl(v, t, t2));
}

abstract class PgrServiceCreateResponseModelCopyWith<
    $R,
    $In extends PgrServiceCreateResponseModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      PgrComplaintResponseModel,
      PgrComplaintResponseModelCopyWith<$R, PgrComplaintResponseModel,
          PgrComplaintResponseModel>> get serviceWrappers;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {List<PgrComplaintResponseModel>? serviceWrappers,
      AuditDetails? auditDetails,
      bool? isDeleted});
  PgrServiceCreateResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrServiceCreateResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrServiceCreateResponseModel, $Out>
    implements
        PgrServiceCreateResponseModelCopyWith<$R, PgrServiceCreateResponseModel,
            $Out> {
  _PgrServiceCreateResponseModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrServiceCreateResponseModel> $mapper =
      PgrServiceCreateResponseModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      PgrComplaintResponseModel,
      PgrComplaintResponseModelCopyWith<$R, PgrComplaintResponseModel,
          PgrComplaintResponseModel>> get serviceWrappers => ListCopyWith(
      $value.serviceWrappers,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(serviceWrappers: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {List<PgrComplaintResponseModel>? serviceWrappers,
          Object? auditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (serviceWrappers != null) #serviceWrappers: serviceWrappers,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  PgrServiceCreateResponseModel $make(CopyWithData data) =>
      PgrServiceCreateResponseModel(
          serviceWrappers:
              data.get(#serviceWrappers, or: $value.serviceWrappers),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  PgrServiceCreateResponseModelCopyWith<$R2, PgrServiceCreateResponseModel,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrServiceCreateResponseModelCopyWithImpl($value, $cast, t);
}

class PgrComplaintResponseModelMapper
    extends ClassMapperBase<PgrComplaintResponseModel> {
  PgrComplaintResponseModelMapper._();

  static PgrComplaintResponseModelMapper? _instance;
  static PgrComplaintResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrComplaintResponseModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrComplaintResponseModel';

  static PgrServiceResponseModel _$service(PgrComplaintResponseModel v) =>
      v.service;
  static const Field<PgrComplaintResponseModel, PgrServiceResponseModel>
      _f$service = Field('service', _$service);
  static PgrWorkflowModel? _$workflow(PgrComplaintResponseModel v) =>
      v.workflow;
  static const Field<PgrComplaintResponseModel, PgrWorkflowModel> _f$workflow =
      Field('workflow', _$workflow, opt: true);
  static AuditDetails? _$auditDetails(PgrComplaintResponseModel v) =>
      v.auditDetails;
  static const Field<PgrComplaintResponseModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static bool? _$isDeleted(PgrComplaintResponseModel v) => v.isDeleted;
  static const Field<PgrComplaintResponseModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static ClientAuditDetails? _$clientAuditDetails(
          PgrComplaintResponseModel v) =>
      v.clientAuditDetails;
  static const Field<PgrComplaintResponseModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrComplaintResponseModel> fields = const {
    #service: _f$service,
    #workflow: _f$workflow,
    #auditDetails: _f$auditDetails,
    #isDeleted: _f$isDeleted,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrComplaintResponseModel _instantiate(DecodingData data) {
    return PgrComplaintResponseModel(
        service: data.dec(_f$service),
        workflow: data.dec(_f$workflow),
        auditDetails: data.dec(_f$auditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrComplaintResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrComplaintResponseModel>(map);
  }

  static PgrComplaintResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrComplaintResponseModel>(json);
  }
}

mixin PgrComplaintResponseModelMappable {
  String toJson() {
    return PgrComplaintResponseModelMapper.ensureInitialized()
        .encodeJson<PgrComplaintResponseModel>(
            this as PgrComplaintResponseModel);
  }

  Map<String, dynamic> toMap() {
    return PgrComplaintResponseModelMapper.ensureInitialized()
        .encodeMap<PgrComplaintResponseModel>(
            this as PgrComplaintResponseModel);
  }

  PgrComplaintResponseModelCopyWith<PgrComplaintResponseModel,
          PgrComplaintResponseModel, PgrComplaintResponseModel>
      get copyWith => _PgrComplaintResponseModelCopyWithImpl(
          this as PgrComplaintResponseModel, $identity, $identity);
  @override
  String toString() {
    return PgrComplaintResponseModelMapper.ensureInitialized()
        .stringifyValue(this as PgrComplaintResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrComplaintResponseModelMapper.ensureInitialized()
                .isValueEqual(this as PgrComplaintResponseModel, other));
  }

  @override
  int get hashCode {
    return PgrComplaintResponseModelMapper.ensureInitialized()
        .hashValue(this as PgrComplaintResponseModel);
  }
}

extension PgrComplaintResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrComplaintResponseModel, $Out> {
  PgrComplaintResponseModelCopyWith<$R, PgrComplaintResponseModel, $Out>
      get $asPgrComplaintResponseModel => $base
          .as((v, t, t2) => _PgrComplaintResponseModelCopyWithImpl(v, t, t2));
}

abstract class PgrComplaintResponseModelCopyWith<
    $R,
    $In extends PgrComplaintResponseModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  PgrServiceResponseModelCopyWith<$R, PgrServiceResponseModel,
      PgrServiceResponseModel> get service;
  PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, PgrWorkflowModel>?
      get workflow;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {PgrServiceResponseModel? service,
      PgrWorkflowModel? workflow,
      AuditDetails? auditDetails,
      bool? isDeleted});
  PgrComplaintResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrComplaintResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrComplaintResponseModel, $Out>
    implements
        PgrComplaintResponseModelCopyWith<$R, PgrComplaintResponseModel, $Out> {
  _PgrComplaintResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrComplaintResponseModel> $mapper =
      PgrComplaintResponseModelMapper.ensureInitialized();
  @override
  PgrServiceResponseModelCopyWith<$R, PgrServiceResponseModel,
          PgrServiceResponseModel>
      get service => $value.service.copyWith.$chain((v) => call(service: v));
  @override
  PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, PgrWorkflowModel>?
      get workflow =>
          $value.workflow?.copyWith.$chain((v) => call(workflow: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {PgrServiceResponseModel? service,
          Object? workflow = $none,
          Object? auditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (service != null) #service: service,
        if (workflow != $none) #workflow: workflow,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  PgrComplaintResponseModel $make(CopyWithData data) =>
      PgrComplaintResponseModel(
          service: data.get(#service, or: $value.service),
          workflow: data.get(#workflow, or: $value.workflow),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  PgrComplaintResponseModelCopyWith<$R2, PgrComplaintResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrComplaintResponseModelCopyWithImpl($value, $cast, t);
}

class PgrServiceResponseModelMapper
    extends ClassMapperBase<PgrServiceResponseModel> {
  PgrServiceResponseModelMapper._();

  static PgrServiceResponseModelMapper? _instance;
  static PgrServiceResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrServiceResponseModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrServiceResponseModel';

  static bool? _$active(PgrServiceResponseModel v) => v.active;
  static const Field<PgrServiceResponseModel, bool> _f$active =
      Field('active', _$active, opt: true, def: true);
  static String? _$id(PgrServiceResponseModel v) => v.id;
  static const Field<PgrServiceResponseModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(PgrServiceResponseModel v) => v.tenantId;
  static const Field<PgrServiceResponseModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$serviceCode(PgrServiceResponseModel v) => v.serviceCode;
  static const Field<PgrServiceResponseModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);
  static String? _$serviceRequestId(PgrServiceResponseModel v) =>
      v.serviceRequestId;
  static const Field<PgrServiceResponseModel, String> _f$serviceRequestId =
      Field('serviceRequestId', _$serviceRequestId, opt: true);
  static String? _$description(PgrServiceResponseModel v) => v.description;
  static const Field<PgrServiceResponseModel, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$accountId(PgrServiceResponseModel v) => v.accountId;
  static const Field<PgrServiceResponseModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static PgrServiceApplicationStatus? _$applicationStatus(
          PgrServiceResponseModel v) =>
      v.applicationStatus;
  static const Field<PgrServiceResponseModel, PgrServiceApplicationStatus>
      _f$applicationStatus =
      Field('applicationStatus', _$applicationStatus, opt: true);
  static String? _$source(PgrServiceResponseModel v) => v.source;
  static const Field<PgrServiceResponseModel, String> _f$source =
      Field('source', _$source, opt: true);
  static PgrComplainantResponseModel? _$user(PgrServiceResponseModel v) =>
      v.user;
  static const Field<PgrServiceResponseModel, PgrComplainantResponseModel>
      _f$user = Field('user', _$user, opt: true);
  static int? _$rowVersion(PgrServiceResponseModel v) => v.rowVersion;
  static const Field<PgrServiceResponseModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true, def: 1);
  static AuditDetails? _$auditDetails(PgrServiceResponseModel v) =>
      v.auditDetails;
  static const Field<PgrServiceResponseModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static bool? _$isDeleted(PgrServiceResponseModel v) => v.isDeleted;
  static const Field<PgrServiceResponseModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static ClientAuditDetails? _$clientAuditDetails(PgrServiceResponseModel v) =>
      v.clientAuditDetails;
  static const Field<PgrServiceResponseModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrServiceResponseModel> fields = const {
    #active: _f$active,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #serviceCode: _f$serviceCode,
    #serviceRequestId: _f$serviceRequestId,
    #description: _f$description,
    #accountId: _f$accountId,
    #applicationStatus: _f$applicationStatus,
    #source: _f$source,
    #user: _f$user,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #isDeleted: _f$isDeleted,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrServiceResponseModel _instantiate(DecodingData data) {
    return PgrServiceResponseModel(
        active: data.dec(_f$active),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        serviceCode: data.dec(_f$serviceCode),
        serviceRequestId: data.dec(_f$serviceRequestId),
        description: data.dec(_f$description),
        accountId: data.dec(_f$accountId),
        applicationStatus: data.dec(_f$applicationStatus),
        source: data.dec(_f$source),
        user: data.dec(_f$user),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrServiceResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrServiceResponseModel>(map);
  }

  static PgrServiceResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrServiceResponseModel>(json);
  }
}

mixin PgrServiceResponseModelMappable {
  String toJson() {
    return PgrServiceResponseModelMapper.ensureInitialized()
        .encodeJson<PgrServiceResponseModel>(this as PgrServiceResponseModel);
  }

  Map<String, dynamic> toMap() {
    return PgrServiceResponseModelMapper.ensureInitialized()
        .encodeMap<PgrServiceResponseModel>(this as PgrServiceResponseModel);
  }

  PgrServiceResponseModelCopyWith<PgrServiceResponseModel,
          PgrServiceResponseModel, PgrServiceResponseModel>
      get copyWith => _PgrServiceResponseModelCopyWithImpl(
          this as PgrServiceResponseModel, $identity, $identity);
  @override
  String toString() {
    return PgrServiceResponseModelMapper.ensureInitialized()
        .stringifyValue(this as PgrServiceResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrServiceResponseModelMapper.ensureInitialized()
                .isValueEqual(this as PgrServiceResponseModel, other));
  }

  @override
  int get hashCode {
    return PgrServiceResponseModelMapper.ensureInitialized()
        .hashValue(this as PgrServiceResponseModel);
  }
}

extension PgrServiceResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrServiceResponseModel, $Out> {
  PgrServiceResponseModelCopyWith<$R, PgrServiceResponseModel, $Out>
      get $asPgrServiceResponseModel => $base
          .as((v, t, t2) => _PgrServiceResponseModelCopyWithImpl(v, t, t2));
}

abstract class PgrServiceResponseModelCopyWith<
    $R,
    $In extends PgrServiceResponseModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  PgrComplainantResponseModelCopyWith<$R, PgrComplainantResponseModel,
      PgrComplainantResponseModel>? get user;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {bool? active,
      String? id,
      String? tenantId,
      String? serviceCode,
      String? serviceRequestId,
      String? description,
      String? accountId,
      PgrServiceApplicationStatus? applicationStatus,
      String? source,
      PgrComplainantResponseModel? user,
      int? rowVersion,
      AuditDetails? auditDetails,
      bool? isDeleted});
  PgrServiceResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrServiceResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrServiceResponseModel, $Out>
    implements
        PgrServiceResponseModelCopyWith<$R, PgrServiceResponseModel, $Out> {
  _PgrServiceResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrServiceResponseModel> $mapper =
      PgrServiceResponseModelMapper.ensureInitialized();
  @override
  PgrComplainantResponseModelCopyWith<$R, PgrComplainantResponseModel,
          PgrComplainantResponseModel>?
      get user => $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? active = $none,
          Object? id = $none,
          Object? tenantId = $none,
          Object? serviceCode = $none,
          Object? serviceRequestId = $none,
          Object? description = $none,
          Object? accountId = $none,
          Object? applicationStatus = $none,
          Object? source = $none,
          Object? user = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (active != $none) #active: active,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (serviceCode != $none) #serviceCode: serviceCode,
        if (serviceRequestId != $none) #serviceRequestId: serviceRequestId,
        if (description != $none) #description: description,
        if (accountId != $none) #accountId: accountId,
        if (applicationStatus != $none) #applicationStatus: applicationStatus,
        if (source != $none) #source: source,
        if (user != $none) #user: user,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  PgrServiceResponseModel $make(CopyWithData data) => PgrServiceResponseModel(
      active: data.get(#active, or: $value.active),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      serviceCode: data.get(#serviceCode, or: $value.serviceCode),
      serviceRequestId:
          data.get(#serviceRequestId, or: $value.serviceRequestId),
      description: data.get(#description, or: $value.description),
      accountId: data.get(#accountId, or: $value.accountId),
      applicationStatus:
          data.get(#applicationStatus, or: $value.applicationStatus),
      source: data.get(#source, or: $value.source),
      user: data.get(#user, or: $value.user),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  PgrServiceResponseModelCopyWith<$R2, PgrServiceResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrServiceResponseModelCopyWithImpl($value, $cast, t);
}

class PgrComplainantResponseModelMapper
    extends ClassMapperBase<PgrComplainantResponseModel> {
  PgrComplainantResponseModelMapper._();

  static PgrComplainantResponseModelMapper? _instance;
  static PgrComplainantResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrComplainantResponseModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrComplainantResponseModel';

  static int? _$id(PgrComplainantResponseModel v) => v.id;
  static const Field<PgrComplainantResponseModel, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$userName(PgrComplainantResponseModel v) => v.userName;
  static const Field<PgrComplainantResponseModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$name(PgrComplainantResponseModel v) => v.name;
  static const Field<PgrComplainantResponseModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$type(PgrComplainantResponseModel v) => v.type;
  static const Field<PgrComplainantResponseModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$mobileNumber(PgrComplainantResponseModel v) =>
      v.mobileNumber;
  static const Field<PgrComplainantResponseModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static String? _$emailId(PgrComplainantResponseModel v) => v.emailId;
  static const Field<PgrComplainantResponseModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static List<PgrRolesModel>? _$roles(PgrComplainantResponseModel v) => v.roles;
  static const Field<PgrComplainantResponseModel, List<PgrRolesModel>>
      _f$roles = Field('roles', _$roles, opt: true, def: const []);
  static String? _$tenantId(PgrComplainantResponseModel v) => v.tenantId;
  static const Field<PgrComplainantResponseModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$uuid(PgrComplainantResponseModel v) => v.uuid;
  static const Field<PgrComplainantResponseModel, String> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static bool? _$active(PgrComplainantResponseModel v) => v.active;
  static const Field<PgrComplainantResponseModel, bool> _f$active =
      Field('active', _$active, opt: true, def: true);
  static int? _$rowVersion(PgrComplainantResponseModel v) => v.rowVersion;
  static const Field<PgrComplainantResponseModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true, def: 1);
  static AuditDetails? _$auditDetails(PgrComplainantResponseModel v) =>
      v.auditDetails;
  static const Field<PgrComplainantResponseModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails, opt: true);
  static bool? _$isDeleted(PgrComplainantResponseModel v) => v.isDeleted;
  static const Field<PgrComplainantResponseModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static ClientAuditDetails? _$clientAuditDetails(
          PgrComplainantResponseModel v) =>
      v.clientAuditDetails;
  static const Field<PgrComplainantResponseModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrComplainantResponseModel> fields = const {
    #id: _f$id,
    #userName: _f$userName,
    #name: _f$name,
    #type: _f$type,
    #mobileNumber: _f$mobileNumber,
    #emailId: _f$emailId,
    #roles: _f$roles,
    #tenantId: _f$tenantId,
    #uuid: _f$uuid,
    #active: _f$active,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #isDeleted: _f$isDeleted,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrComplainantResponseModel _instantiate(DecodingData data) {
    return PgrComplainantResponseModel(
        id: data.dec(_f$id),
        userName: data.dec(_f$userName),
        name: data.dec(_f$name),
        type: data.dec(_f$type),
        mobileNumber: data.dec(_f$mobileNumber),
        emailId: data.dec(_f$emailId),
        roles: data.dec(_f$roles),
        tenantId: data.dec(_f$tenantId),
        uuid: data.dec(_f$uuid),
        active: data.dec(_f$active),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrComplainantResponseModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrComplainantResponseModel>(map);
  }

  static PgrComplainantResponseModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrComplainantResponseModel>(json);
  }
}

mixin PgrComplainantResponseModelMappable {
  String toJson() {
    return PgrComplainantResponseModelMapper.ensureInitialized()
        .encodeJson<PgrComplainantResponseModel>(
            this as PgrComplainantResponseModel);
  }

  Map<String, dynamic> toMap() {
    return PgrComplainantResponseModelMapper.ensureInitialized()
        .encodeMap<PgrComplainantResponseModel>(
            this as PgrComplainantResponseModel);
  }

  PgrComplainantResponseModelCopyWith<PgrComplainantResponseModel,
          PgrComplainantResponseModel, PgrComplainantResponseModel>
      get copyWith => _PgrComplainantResponseModelCopyWithImpl(
          this as PgrComplainantResponseModel, $identity, $identity);
  @override
  String toString() {
    return PgrComplainantResponseModelMapper.ensureInitialized()
        .stringifyValue(this as PgrComplainantResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrComplainantResponseModelMapper.ensureInitialized()
                .isValueEqual(this as PgrComplainantResponseModel, other));
  }

  @override
  int get hashCode {
    return PgrComplainantResponseModelMapper.ensureInitialized()
        .hashValue(this as PgrComplainantResponseModel);
  }
}

extension PgrComplainantResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrComplainantResponseModel, $Out> {
  PgrComplainantResponseModelCopyWith<$R, PgrComplainantResponseModel, $Out>
      get $asPgrComplainantResponseModel => $base
          .as((v, t, t2) => _PgrComplainantResponseModelCopyWithImpl(v, t, t2));
}

abstract class PgrComplainantResponseModelCopyWith<
    $R,
    $In extends PgrComplainantResponseModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PgrRolesModel,
      PgrRolesModelCopyWith<$R, PgrRolesModel, PgrRolesModel>>? get roles;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {int? id,
      String? userName,
      String? name,
      String? type,
      String? mobileNumber,
      String? emailId,
      List<PgrRolesModel>? roles,
      String? tenantId,
      String? uuid,
      bool? active,
      int? rowVersion,
      AuditDetails? auditDetails,
      bool? isDeleted});
  PgrComplainantResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrComplainantResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrComplainantResponseModel, $Out>
    implements
        PgrComplainantResponseModelCopyWith<$R, PgrComplainantResponseModel,
            $Out> {
  _PgrComplainantResponseModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrComplainantResponseModel> $mapper =
      PgrComplainantResponseModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PgrRolesModel,
          PgrRolesModelCopyWith<$R, PgrRolesModel, PgrRolesModel>>?
      get roles => $value.roles != null
          ? ListCopyWith($value.roles!, (v, t) => v.copyWith.$chain(t),
              (v) => call(roles: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          Object? userName = $none,
          Object? name = $none,
          Object? type = $none,
          Object? mobileNumber = $none,
          Object? emailId = $none,
          Object? roles = $none,
          Object? tenantId = $none,
          Object? uuid = $none,
          Object? active = $none,
          Object? rowVersion = $none,
          Object? auditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userName != $none) #userName: userName,
        if (name != $none) #name: name,
        if (type != $none) #type: type,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (emailId != $none) #emailId: emailId,
        if (roles != $none) #roles: roles,
        if (tenantId != $none) #tenantId: tenantId,
        if (uuid != $none) #uuid: uuid,
        if (active != $none) #active: active,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  PgrComplainantResponseModel $make(CopyWithData data) =>
      PgrComplainantResponseModel(
          id: data.get(#id, or: $value.id),
          userName: data.get(#userName, or: $value.userName),
          name: data.get(#name, or: $value.name),
          type: data.get(#type, or: $value.type),
          mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
          emailId: data.get(#emailId, or: $value.emailId),
          roles: data.get(#roles, or: $value.roles),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          uuid: data.get(#uuid, or: $value.uuid),
          active: data.get(#active, or: $value.active),
          rowVersion: data.get(#rowVersion, or: $value.rowVersion),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  PgrComplainantResponseModelCopyWith<$R2, PgrComplainantResponseModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrComplainantResponseModelCopyWithImpl($value, $cast, t);
}
