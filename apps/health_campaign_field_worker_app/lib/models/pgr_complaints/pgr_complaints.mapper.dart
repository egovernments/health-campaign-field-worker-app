// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pgr_complaints.dart';

class PgrServiceApplicationStatusMapper
    extends EnumMapper<PgrServiceApplicationStatus> {
  PgrServiceApplicationStatusMapper._();

  static PgrServiceApplicationStatusMapper? _instance;
  static PgrServiceApplicationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PgrServiceApplicationStatusMapper._());
    }
    return _instance!;
  }

  static PgrServiceApplicationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PgrServiceApplicationStatus decode(dynamic value) {
    switch (value) {
      case 'CREATED':
        return PgrServiceApplicationStatus.created;
      case 'PENDING_ASSIGNMENT':
        return PgrServiceApplicationStatus.pendingAssignment;
      case 'RESOLVED':
        return PgrServiceApplicationStatus.resolved;
      case 'REJECTED':
        return PgrServiceApplicationStatus.rejected;
      case 'CANCELLED':
        return PgrServiceApplicationStatus.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PgrServiceApplicationStatus self) {
    switch (self) {
      case PgrServiceApplicationStatus.created:
        return 'CREATED';
      case PgrServiceApplicationStatus.pendingAssignment:
        return 'PENDING_ASSIGNMENT';
      case PgrServiceApplicationStatus.resolved:
        return 'RESOLVED';
      case PgrServiceApplicationStatus.rejected:
        return 'REJECTED';
      case PgrServiceApplicationStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension PgrServiceApplicationStatusMapperExtension
    on PgrServiceApplicationStatus {
  dynamic toValue() {
    PgrServiceApplicationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PgrServiceApplicationStatus>(this);
  }
}

class PgrComplaintModelMapper extends ClassMapperBase<PgrComplaintModel> {
  PgrComplaintModelMapper._();

  static PgrComplaintModelMapper? _instance;
  static PgrComplaintModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrComplaintModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrComplaintModel';

  static PgrServiceModel _$service(PgrComplaintModel v) => v.service;
  static const Field<PgrComplaintModel, PgrServiceModel> _f$service =
      Field('service', _$service);
  static PgrWorkflowModel? _$workflow(PgrComplaintModel v) => v.workflow;
  static const Field<PgrComplaintModel, PgrWorkflowModel> _f$workflow =
      Field('workflow', _$workflow, opt: true);
  static bool? _$isDeleted(PgrComplaintModel v) => v.isDeleted;
  static const Field<PgrComplaintModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static AuditDetails? _$auditDetails(PgrComplaintModel v) => v.auditDetails;
  static const Field<PgrComplaintModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(PgrComplaintModel v) =>
      v.clientAuditDetails;
  static const Field<PgrComplaintModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrComplaintModel> fields = const {
    #service: _f$service,
    #workflow: _f$workflow,
    #isDeleted: _f$isDeleted,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrComplaintModel _instantiate(DecodingData data) {
    return PgrComplaintModel(
        service: data.dec(_f$service),
        workflow: data.dec(_f$workflow),
        isDeleted: data.dec(_f$isDeleted),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrComplaintModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrComplaintModel>(map);
  }

  static PgrComplaintModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrComplaintModel>(json);
  }
}

mixin PgrComplaintModelMappable {
  String toJson() {
    return PgrComplaintModelMapper.ensureInitialized()
        .encodeJson<PgrComplaintModel>(this as PgrComplaintModel);
  }

  Map<String, dynamic> toMap() {
    return PgrComplaintModelMapper.ensureInitialized()
        .encodeMap<PgrComplaintModel>(this as PgrComplaintModel);
  }

  PgrComplaintModelCopyWith<PgrComplaintModel, PgrComplaintModel,
          PgrComplaintModel>
      get copyWith => _PgrComplaintModelCopyWithImpl(
          this as PgrComplaintModel, $identity, $identity);
  @override
  String toString() {
    return PgrComplaintModelMapper.ensureInitialized()
        .stringifyValue(this as PgrComplaintModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrComplaintModelMapper.ensureInitialized()
                .isValueEqual(this as PgrComplaintModel, other));
  }

  @override
  int get hashCode {
    return PgrComplaintModelMapper.ensureInitialized()
        .hashValue(this as PgrComplaintModel);
  }
}

extension PgrComplaintModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrComplaintModel, $Out> {
  PgrComplaintModelCopyWith<$R, PgrComplaintModel, $Out>
      get $asPgrComplaintModel =>
          $base.as((v, t, t2) => _PgrComplaintModelCopyWithImpl(v, t, t2));
}

abstract class PgrComplaintModelCopyWith<$R, $In extends PgrComplaintModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  PgrServiceModelCopyWith<$R, PgrServiceModel, PgrServiceModel> get service;
  PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, PgrWorkflowModel>?
      get workflow;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {PgrServiceModel? service,
      PgrWorkflowModel? workflow,
      bool? isDeleted,
      AuditDetails? auditDetails});
  PgrComplaintModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrComplaintModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrComplaintModel, $Out>
    implements PgrComplaintModelCopyWith<$R, PgrComplaintModel, $Out> {
  _PgrComplaintModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrComplaintModel> $mapper =
      PgrComplaintModelMapper.ensureInitialized();
  @override
  PgrServiceModelCopyWith<$R, PgrServiceModel, PgrServiceModel> get service =>
      $value.service.copyWith.$chain((v) => call(service: v));
  @override
  PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, PgrWorkflowModel>?
      get workflow =>
          $value.workflow?.copyWith.$chain((v) => call(workflow: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {PgrServiceModel? service,
          Object? workflow = $none,
          Object? isDeleted = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (service != null) #service: service,
        if (workflow != $none) #workflow: workflow,
        if (isDeleted != $none) #isDeleted: isDeleted,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  PgrComplaintModel $make(CopyWithData data) => PgrComplaintModel(
      service: data.get(#service, or: $value.service),
      workflow: data.get(#workflow, or: $value.workflow),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  PgrComplaintModelCopyWith<$R2, PgrComplaintModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrComplaintModelCopyWithImpl($value, $cast, t);
}

class PgrServiceModelMapper extends ClassMapperBase<PgrServiceModel> {
  PgrServiceModelMapper._();

  static PgrServiceModelMapper? _instance;
  static PgrServiceModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrServiceModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrServiceModel';

  static String _$clientReferenceId(PgrServiceModel v) => v.clientReferenceId;
  static const Field<PgrServiceModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static bool _$active(PgrServiceModel v) => v.active;
  static const Field<PgrServiceModel, bool> _f$active =
      Field('active', _$active, opt: true, def: true);
  static String? _$id(PgrServiceModel v) => v.id;
  static const Field<PgrServiceModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String _$tenantId(PgrServiceModel v) => v.tenantId;
  static const Field<PgrServiceModel, String> _f$tenantId =
      Field('tenantId', _$tenantId);
  static String _$serviceCode(PgrServiceModel v) => v.serviceCode;
  static const Field<PgrServiceModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode);
  static String? _$serviceRequestId(PgrServiceModel v) => v.serviceRequestId;
  static const Field<PgrServiceModel, String> _f$serviceRequestId =
      Field('serviceRequestId', _$serviceRequestId, opt: true);
  static String _$description(PgrServiceModel v) => v.description;
  static const Field<PgrServiceModel, String> _f$description =
      Field('description', _$description);
  static String? _$accountId(PgrServiceModel v) => v.accountId;
  static const Field<PgrServiceModel, String> _f$accountId =
      Field('accountId', _$accountId, opt: true);
  static PgrServiceApplicationStatus _$applicationStatus(PgrServiceModel v) =>
      v.applicationStatus;
  static const Field<PgrServiceModel, PgrServiceApplicationStatus>
      _f$applicationStatus = Field('applicationStatus', _$applicationStatus);
  static String? _$source(PgrServiceModel v) => v.source;
  static const Field<PgrServiceModel, String> _f$source =
      Field('source', _$source, opt: true);
  static PgrComplainantModel _$user(PgrServiceModel v) => v.user;
  static const Field<PgrServiceModel, PgrComplainantModel> _f$user =
      Field('user', _$user);
  static bool _$isDeleted(PgrServiceModel v) => v.isDeleted;
  static const Field<PgrServiceModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static int _$rowVersion(PgrServiceModel v) => v.rowVersion;
  static const Field<PgrServiceModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true, def: 1);
  static PgrAddressModel _$address(PgrServiceModel v) => v.address;
  static const Field<PgrServiceModel, PgrAddressModel> _f$address =
      Field('address', _$address);
  static String? _$additionalDetail(PgrServiceModel v) => v.additionalDetail;
  static const Field<PgrServiceModel, String> _f$additionalDetail =
      Field('additionalDetail', _$additionalDetail, opt: true);
  static AuditDetails? _$auditDetails(PgrServiceModel v) => v.auditDetails;
  static const Field<PgrServiceModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(PgrServiceModel v) =>
      v.clientAuditDetails;
  static const Field<PgrServiceModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrServiceModel> fields = const {
    #clientReferenceId: _f$clientReferenceId,
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
    #isDeleted: _f$isDeleted,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
    #additionalDetail: _f$additionalDetail,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrServiceModel _instantiate(DecodingData data) {
    return PgrServiceModel(
        clientReferenceId: data.dec(_f$clientReferenceId),
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
        isDeleted: data.dec(_f$isDeleted),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address),
        additionalDetail: data.dec(_f$additionalDetail),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrServiceModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrServiceModel>(map);
  }

  static PgrServiceModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrServiceModel>(json);
  }
}

mixin PgrServiceModelMappable {
  String toJson() {
    return PgrServiceModelMapper.ensureInitialized()
        .encodeJson<PgrServiceModel>(this as PgrServiceModel);
  }

  Map<String, dynamic> toMap() {
    return PgrServiceModelMapper.ensureInitialized()
        .encodeMap<PgrServiceModel>(this as PgrServiceModel);
  }

  PgrServiceModelCopyWith<PgrServiceModel, PgrServiceModel, PgrServiceModel>
      get copyWith => _PgrServiceModelCopyWithImpl(
          this as PgrServiceModel, $identity, $identity);
  @override
  String toString() {
    return PgrServiceModelMapper.ensureInitialized()
        .stringifyValue(this as PgrServiceModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrServiceModelMapper.ensureInitialized()
                .isValueEqual(this as PgrServiceModel, other));
  }

  @override
  int get hashCode {
    return PgrServiceModelMapper.ensureInitialized()
        .hashValue(this as PgrServiceModel);
  }
}

extension PgrServiceModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrServiceModel, $Out> {
  PgrServiceModelCopyWith<$R, PgrServiceModel, $Out> get $asPgrServiceModel =>
      $base.as((v, t, t2) => _PgrServiceModelCopyWithImpl(v, t, t2));
}

abstract class PgrServiceModelCopyWith<$R, $In extends PgrServiceModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  PgrComplainantModelCopyWith<$R, PgrComplainantModel, PgrComplainantModel>
      get user;
  PgrAddressModelCopyWith<$R, PgrAddressModel, PgrAddressModel> get address;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? clientReferenceId,
      bool? active,
      String? id,
      String? tenantId,
      String? serviceCode,
      String? serviceRequestId,
      String? description,
      String? accountId,
      PgrServiceApplicationStatus? applicationStatus,
      String? source,
      PgrComplainantModel? user,
      covariant bool? isDeleted,
      int? rowVersion,
      PgrAddressModel? address,
      String? additionalDetail,
      AuditDetails? auditDetails});
  PgrServiceModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrServiceModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrServiceModel, $Out>
    implements PgrServiceModelCopyWith<$R, PgrServiceModel, $Out> {
  _PgrServiceModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrServiceModel> $mapper =
      PgrServiceModelMapper.ensureInitialized();
  @override
  PgrComplainantModelCopyWith<$R, PgrComplainantModel, PgrComplainantModel>
      get user => $value.user.copyWith.$chain((v) => call(user: v));
  @override
  PgrAddressModelCopyWith<$R, PgrAddressModel, PgrAddressModel> get address =>
      $value.address.copyWith.$chain((v) => call(address: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {String? clientReferenceId,
          bool? active,
          Object? id = $none,
          String? tenantId,
          String? serviceCode,
          Object? serviceRequestId = $none,
          String? description,
          Object? accountId = $none,
          PgrServiceApplicationStatus? applicationStatus,
          Object? source = $none,
          PgrComplainantModel? user,
          bool? isDeleted,
          int? rowVersion,
          PgrAddressModel? address,
          Object? additionalDetail = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (active != null) #active: active,
        if (id != $none) #id: id,
        if (tenantId != null) #tenantId: tenantId,
        if (serviceCode != null) #serviceCode: serviceCode,
        if (serviceRequestId != $none) #serviceRequestId: serviceRequestId,
        if (description != null) #description: description,
        if (accountId != $none) #accountId: accountId,
        if (applicationStatus != null) #applicationStatus: applicationStatus,
        if (source != $none) #source: source,
        if (user != null) #user: user,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (rowVersion != null) #rowVersion: rowVersion,
        if (address != null) #address: address,
        if (additionalDetail != $none) #additionalDetail: additionalDetail,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  PgrServiceModel $make(CopyWithData data) => PgrServiceModel(
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
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
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address),
      additionalDetail:
          data.get(#additionalDetail, or: $value.additionalDetail),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  PgrServiceModelCopyWith<$R2, PgrServiceModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrServiceModelCopyWithImpl($value, $cast, t);
}

class PgrComplainantModelMapper extends ClassMapperBase<PgrComplainantModel> {
  PgrComplainantModelMapper._();

  static PgrComplainantModelMapper? _instance;
  static PgrComplainantModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrComplainantModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrComplainantModel';

  static int? _$id(PgrComplainantModel v) => v.id;
  static const Field<PgrComplainantModel, int> _f$id =
      Field('id', _$id, opt: true);
  static String _$clientReferenceId(PgrComplainantModel v) =>
      v.clientReferenceId;
  static const Field<PgrComplainantModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String _$complaintClientReferenceId(PgrComplainantModel v) =>
      v.complaintClientReferenceId;
  static const Field<PgrComplainantModel, String>
      _f$complaintClientReferenceId =
      Field('complaintClientReferenceId', _$complaintClientReferenceId);
  static String? _$userName(PgrComplainantModel v) => v.userName;
  static const Field<PgrComplainantModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$name(PgrComplainantModel v) => v.name;
  static const Field<PgrComplainantModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$type(PgrComplainantModel v) => v.type;
  static const Field<PgrComplainantModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$mobileNumber(PgrComplainantModel v) => v.mobileNumber;
  static const Field<PgrComplainantModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static String? _$emailId(PgrComplainantModel v) => v.emailId;
  static const Field<PgrComplainantModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static List<PgrRolesModel> _$roles(PgrComplainantModel v) => v.roles;
  static const Field<PgrComplainantModel, List<PgrRolesModel>> _f$roles =
      Field('roles', _$roles, opt: true, def: const []);
  static String _$tenantId(PgrComplainantModel v) => v.tenantId;
  static const Field<PgrComplainantModel, String> _f$tenantId =
      Field('tenantId', _$tenantId);
  static String? _$uuid(PgrComplainantModel v) => v.uuid;
  static const Field<PgrComplainantModel, String> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static bool _$active(PgrComplainantModel v) => v.active;
  static const Field<PgrComplainantModel, bool> _f$active =
      Field('active', _$active, opt: true, def: true);
  static bool _$isDeleted(PgrComplainantModel v) => v.isDeleted;
  static const Field<PgrComplainantModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static int _$rowVersion(PgrComplainantModel v) => v.rowVersion;
  static const Field<PgrComplainantModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true, def: 1);
  static AuditDetails? _$auditDetails(PgrComplainantModel v) => v.auditDetails;
  static const Field<PgrComplainantModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(PgrComplainantModel v) =>
      v.clientAuditDetails;
  static const Field<PgrComplainantModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrComplainantModel> fields = const {
    #id: _f$id,
    #clientReferenceId: _f$clientReferenceId,
    #complaintClientReferenceId: _f$complaintClientReferenceId,
    #userName: _f$userName,
    #name: _f$name,
    #type: _f$type,
    #mobileNumber: _f$mobileNumber,
    #emailId: _f$emailId,
    #roles: _f$roles,
    #tenantId: _f$tenantId,
    #uuid: _f$uuid,
    #active: _f$active,
    #isDeleted: _f$isDeleted,
    #rowVersion: _f$rowVersion,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrComplainantModel _instantiate(DecodingData data) {
    return PgrComplainantModel(
        id: data.dec(_f$id),
        clientReferenceId: data.dec(_f$clientReferenceId),
        complaintClientReferenceId: data.dec(_f$complaintClientReferenceId),
        userName: data.dec(_f$userName),
        name: data.dec(_f$name),
        type: data.dec(_f$type),
        mobileNumber: data.dec(_f$mobileNumber),
        emailId: data.dec(_f$emailId),
        roles: data.dec(_f$roles),
        tenantId: data.dec(_f$tenantId),
        uuid: data.dec(_f$uuid),
        active: data.dec(_f$active),
        isDeleted: data.dec(_f$isDeleted),
        rowVersion: data.dec(_f$rowVersion),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrComplainantModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrComplainantModel>(map);
  }

  static PgrComplainantModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrComplainantModel>(json);
  }
}

mixin PgrComplainantModelMappable {
  String toJson() {
    return PgrComplainantModelMapper.ensureInitialized()
        .encodeJson<PgrComplainantModel>(this as PgrComplainantModel);
  }

  Map<String, dynamic> toMap() {
    return PgrComplainantModelMapper.ensureInitialized()
        .encodeMap<PgrComplainantModel>(this as PgrComplainantModel);
  }

  PgrComplainantModelCopyWith<PgrComplainantModel, PgrComplainantModel,
          PgrComplainantModel>
      get copyWith => _PgrComplainantModelCopyWithImpl(
          this as PgrComplainantModel, $identity, $identity);
  @override
  String toString() {
    return PgrComplainantModelMapper.ensureInitialized()
        .stringifyValue(this as PgrComplainantModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrComplainantModelMapper.ensureInitialized()
                .isValueEqual(this as PgrComplainantModel, other));
  }

  @override
  int get hashCode {
    return PgrComplainantModelMapper.ensureInitialized()
        .hashValue(this as PgrComplainantModel);
  }
}

extension PgrComplainantModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrComplainantModel, $Out> {
  PgrComplainantModelCopyWith<$R, PgrComplainantModel, $Out>
      get $asPgrComplainantModel =>
          $base.as((v, t, t2) => _PgrComplainantModelCopyWithImpl(v, t, t2));
}

abstract class PgrComplainantModelCopyWith<$R, $In extends PgrComplainantModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PgrRolesModel,
      PgrRolesModelCopyWith<$R, PgrRolesModel, PgrRolesModel>> get roles;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {int? id,
      String? clientReferenceId,
      String? complaintClientReferenceId,
      String? userName,
      String? name,
      String? type,
      String? mobileNumber,
      String? emailId,
      List<PgrRolesModel>? roles,
      String? tenantId,
      String? uuid,
      bool? active,
      covariant bool? isDeleted,
      int? rowVersion,
      AuditDetails? auditDetails});
  PgrComplainantModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrComplainantModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrComplainantModel, $Out>
    implements PgrComplainantModelCopyWith<$R, PgrComplainantModel, $Out> {
  _PgrComplainantModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrComplainantModel> $mapper =
      PgrComplainantModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PgrRolesModel,
          PgrRolesModelCopyWith<$R, PgrRolesModel, PgrRolesModel>>
      get roles => ListCopyWith(
          $value.roles, (v, t) => v.copyWith.$chain(t), (v) => call(roles: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          String? clientReferenceId,
          String? complaintClientReferenceId,
          Object? userName = $none,
          Object? name = $none,
          Object? type = $none,
          Object? mobileNumber = $none,
          Object? emailId = $none,
          List<PgrRolesModel>? roles,
          String? tenantId,
          Object? uuid = $none,
          bool? active,
          bool? isDeleted,
          int? rowVersion,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (complaintClientReferenceId != null)
          #complaintClientReferenceId: complaintClientReferenceId,
        if (userName != $none) #userName: userName,
        if (name != $none) #name: name,
        if (type != $none) #type: type,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (emailId != $none) #emailId: emailId,
        if (roles != null) #roles: roles,
        if (tenantId != null) #tenantId: tenantId,
        if (uuid != $none) #uuid: uuid,
        if (active != null) #active: active,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (rowVersion != null) #rowVersion: rowVersion,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  PgrComplainantModel $make(CopyWithData data) => PgrComplainantModel(
      id: data.get(#id, or: $value.id),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      complaintClientReferenceId: data.get(#complaintClientReferenceId,
          or: $value.complaintClientReferenceId),
      userName: data.get(#userName, or: $value.userName),
      name: data.get(#name, or: $value.name),
      type: data.get(#type, or: $value.type),
      mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
      emailId: data.get(#emailId, or: $value.emailId),
      roles: data.get(#roles, or: $value.roles),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      uuid: data.get(#uuid, or: $value.uuid),
      active: data.get(#active, or: $value.active),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  PgrComplainantModelCopyWith<$R2, PgrComplainantModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrComplainantModelCopyWithImpl($value, $cast, t);
}

class PgrRolesModelMapper extends ClassMapperBase<PgrRolesModel> {
  PgrRolesModelMapper._();

  static PgrRolesModelMapper? _instance;
  static PgrRolesModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrRolesModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrRolesModel';

  static String _$name(PgrRolesModel v) => v.name;
  static const Field<PgrRolesModel, String> _f$name = Field('name', _$name);
  static String _$code(PgrRolesModel v) => v.code;
  static const Field<PgrRolesModel, String> _f$code = Field('code', _$code);
  static bool? _$isDeleted(PgrRolesModel v) => v.isDeleted;
  static const Field<PgrRolesModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static AuditDetails? _$auditDetails(PgrRolesModel v) => v.auditDetails;
  static const Field<PgrRolesModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(PgrRolesModel v) =>
      v.clientAuditDetails;
  static const Field<PgrRolesModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrRolesModel> fields = const {
    #name: _f$name,
    #code: _f$code,
    #isDeleted: _f$isDeleted,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrRolesModel _instantiate(DecodingData data) {
    return PgrRolesModel(
        name: data.dec(_f$name),
        code: data.dec(_f$code),
        isDeleted: data.dec(_f$isDeleted),
        auditDetails: data.dec(_f$auditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrRolesModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrRolesModel>(map);
  }

  static PgrRolesModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrRolesModel>(json);
  }
}

mixin PgrRolesModelMappable {
  String toJson() {
    return PgrRolesModelMapper.ensureInitialized()
        .encodeJson<PgrRolesModel>(this as PgrRolesModel);
  }

  Map<String, dynamic> toMap() {
    return PgrRolesModelMapper.ensureInitialized()
        .encodeMap<PgrRolesModel>(this as PgrRolesModel);
  }

  PgrRolesModelCopyWith<PgrRolesModel, PgrRolesModel, PgrRolesModel>
      get copyWith => _PgrRolesModelCopyWithImpl(
          this as PgrRolesModel, $identity, $identity);
  @override
  String toString() {
    return PgrRolesModelMapper.ensureInitialized()
        .stringifyValue(this as PgrRolesModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrRolesModelMapper.ensureInitialized()
                .isValueEqual(this as PgrRolesModel, other));
  }

  @override
  int get hashCode {
    return PgrRolesModelMapper.ensureInitialized()
        .hashValue(this as PgrRolesModel);
  }
}

extension PgrRolesModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrRolesModel, $Out> {
  PgrRolesModelCopyWith<$R, PgrRolesModel, $Out> get $asPgrRolesModel =>
      $base.as((v, t, t2) => _PgrRolesModelCopyWithImpl(v, t, t2));
}

abstract class PgrRolesModelCopyWith<$R, $In extends PgrRolesModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? name,
      String? code,
      bool? isDeleted,
      AuditDetails? auditDetails});
  PgrRolesModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PgrRolesModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrRolesModel, $Out>
    implements PgrRolesModelCopyWith<$R, PgrRolesModel, $Out> {
  _PgrRolesModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrRolesModel> $mapper =
      PgrRolesModelMapper.ensureInitialized();
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {String? name,
          String? code,
          Object? isDeleted = $none,
          Object? auditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (code != null) #code: code,
        if (isDeleted != $none) #isDeleted: isDeleted,
        if (auditDetails != $none) #auditDetails: auditDetails
      }));
  @override
  PgrRolesModel $make(CopyWithData data) => PgrRolesModel(
      name: data.get(#name, or: $value.name),
      code: data.get(#code, or: $value.code),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails));

  @override
  PgrRolesModelCopyWith<$R2, PgrRolesModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrRolesModelCopyWithImpl($value, $cast, t);
}

class PgrWorkflowModelMapper extends ClassMapperBase<PgrWorkflowModel> {
  PgrWorkflowModelMapper._();

  static PgrWorkflowModelMapper? _instance;
  static PgrWorkflowModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrWorkflowModelMapper._());
      EntityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrWorkflowModel';

  static String _$action(PgrWorkflowModel v) => v.action;
  static const Field<PgrWorkflowModel, String> _f$action =
      Field('action', _$action);
  static List<String> _$assignees(PgrWorkflowModel v) => v.assignees;
  static const Field<PgrWorkflowModel, List<String>> _f$assignees = Field(
      'assignees', _$assignees,
      key: 'assignes', opt: true, def: const []);
  static String _$comments(PgrWorkflowModel v) => v.comments;
  static const Field<PgrWorkflowModel, String> _f$comments =
      Field('comments', _$comments);
  static AuditDetails? _$auditDetails(PgrWorkflowModel v) => v.auditDetails;
  static const Field<PgrWorkflowModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static bool? _$isDeleted(PgrWorkflowModel v) => v.isDeleted;
  static const Field<PgrWorkflowModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static ClientAuditDetails? _$clientAuditDetails(PgrWorkflowModel v) =>
      v.clientAuditDetails;
  static const Field<PgrWorkflowModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, mode: FieldMode.member);

  @override
  final MappableFields<PgrWorkflowModel> fields = const {
    #action: _f$action,
    #assignees: _f$assignees,
    #comments: _f$comments,
    #auditDetails: _f$auditDetails,
    #isDeleted: _f$isDeleted,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static PgrWorkflowModel _instantiate(DecodingData data) {
    return PgrWorkflowModel(
        action: data.dec(_f$action),
        assignees: data.dec(_f$assignees),
        comments: data.dec(_f$comments),
        auditDetails: data.dec(_f$auditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrWorkflowModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrWorkflowModel>(map);
  }

  static PgrWorkflowModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrWorkflowModel>(json);
  }
}

mixin PgrWorkflowModelMappable {
  String toJson() {
    return PgrWorkflowModelMapper.ensureInitialized()
        .encodeJson<PgrWorkflowModel>(this as PgrWorkflowModel);
  }

  Map<String, dynamic> toMap() {
    return PgrWorkflowModelMapper.ensureInitialized()
        .encodeMap<PgrWorkflowModel>(this as PgrWorkflowModel);
  }

  PgrWorkflowModelCopyWith<PgrWorkflowModel, PgrWorkflowModel, PgrWorkflowModel>
      get copyWith => _PgrWorkflowModelCopyWithImpl(
          this as PgrWorkflowModel, $identity, $identity);
  @override
  String toString() {
    return PgrWorkflowModelMapper.ensureInitialized()
        .stringifyValue(this as PgrWorkflowModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrWorkflowModelMapper.ensureInitialized()
                .isValueEqual(this as PgrWorkflowModel, other));
  }

  @override
  int get hashCode {
    return PgrWorkflowModelMapper.ensureInitialized()
        .hashValue(this as PgrWorkflowModel);
  }
}

extension PgrWorkflowModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrWorkflowModel, $Out> {
  PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, $Out>
      get $asPgrWorkflowModel =>
          $base.as((v, t, t2) => _PgrWorkflowModelCopyWithImpl(v, t, t2));
}

abstract class PgrWorkflowModelCopyWith<$R, $In extends PgrWorkflowModel, $Out>
    implements EntityModelCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get assignees;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  $R call(
      {String? action,
      List<String>? assignees,
      String? comments,
      AuditDetails? auditDetails,
      bool? isDeleted});
  PgrWorkflowModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrWorkflowModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrWorkflowModel, $Out>
    implements PgrWorkflowModelCopyWith<$R, PgrWorkflowModel, $Out> {
  _PgrWorkflowModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrWorkflowModel> $mapper =
      PgrWorkflowModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get assignees =>
      ListCopyWith($value.assignees, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(assignees: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  $R call(
          {String? action,
          List<String>? assignees,
          String? comments,
          Object? auditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (action != null) #action: action,
        if (assignees != null) #assignees: assignees,
        if (comments != null) #comments: comments,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  PgrWorkflowModel $make(CopyWithData data) => PgrWorkflowModel(
      action: data.get(#action, or: $value.action),
      assignees: data.get(#assignees, or: $value.assignees),
      comments: data.get(#comments, or: $value.comments),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  PgrWorkflowModelCopyWith<$R2, PgrWorkflowModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrWorkflowModelCopyWithImpl($value, $cast, t);
}

class PgrServiceSearchModelMapper
    extends ClassMapperBase<PgrServiceSearchModel> {
  PgrServiceSearchModelMapper._();

  static PgrServiceSearchModelMapper? _instance;
  static PgrServiceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrServiceSearchModelMapper._());
      EntitySearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PgrServiceSearchModel';

  static String? _$complaintAssignedTo(PgrServiceSearchModel v) =>
      v.complaintAssignedTo;
  static const Field<PgrServiceSearchModel, String> _f$complaintAssignedTo =
      Field('complaintAssignedTo', _$complaintAssignedTo, opt: true);
  static String? _$currentUserName(PgrServiceSearchModel v) =>
      v.currentUserName;
  static const Field<PgrServiceSearchModel, String> _f$currentUserName =
      Field('currentUserName', _$currentUserName, opt: true);
  static String? _$complaintTypeCode(PgrServiceSearchModel v) =>
      v.complaintTypeCode;
  static const Field<PgrServiceSearchModel, String> _f$complaintTypeCode =
      Field('complaintTypeCode', _$complaintTypeCode, opt: true);
  static String? _$locality(PgrServiceSearchModel v) => v.locality;
  static const Field<PgrServiceSearchModel, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static List<PgrServiceApplicationStatus>? _$complaintStatus(
          PgrServiceSearchModel v) =>
      v.complaintStatus;
  static const Field<PgrServiceSearchModel, List<PgrServiceApplicationStatus>>
      _f$complaintStatus =
      Field('complaintStatus', _$complaintStatus, opt: true);
  static String? _$tenantId(PgrServiceSearchModel v) => v.tenantId;
  static const Field<PgrServiceSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$serviceRequestId(PgrServiceSearchModel v) =>
      v.serviceRequestId;
  static const Field<PgrServiceSearchModel, String> _f$serviceRequestId =
      Field('serviceRequestId', _$serviceRequestId, opt: true);
  static String? _$clientReferenceId(PgrServiceSearchModel v) =>
      v.clientReferenceId;
  static const Field<PgrServiceSearchModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$complainantMobileNumber(PgrServiceSearchModel v) =>
      v.complainantMobileNumber;
  static const Field<PgrServiceSearchModel, String> _f$complainantMobileNumber =
      Field('complainantMobileNumber', _$complainantMobileNumber, opt: true);
  static String? _$complaintNumber(PgrServiceSearchModel v) =>
      v.complaintNumber;
  static const Field<PgrServiceSearchModel, String> _f$complaintNumber =
      Field('complaintNumber', _$complaintNumber, opt: true);
  static bool? _$isDeleted(PgrServiceSearchModel v) => v.isDeleted;
  static const Field<PgrServiceSearchModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);
  static AuditDetails? _$auditDetails(PgrServiceSearchModel v) =>
      v.auditDetails;
  static const Field<PgrServiceSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static AdditionalFields? _$additionalFields(PgrServiceSearchModel v) =>
      v.additionalFields;
  static const Field<PgrServiceSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$boundaryCode(PgrServiceSearchModel v) => v.boundaryCode;
  static const Field<PgrServiceSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);

  @override
  final MappableFields<PgrServiceSearchModel> fields = const {
    #complaintAssignedTo: _f$complaintAssignedTo,
    #currentUserName: _f$currentUserName,
    #complaintTypeCode: _f$complaintTypeCode,
    #locality: _f$locality,
    #complaintStatus: _f$complaintStatus,
    #tenantId: _f$tenantId,
    #serviceRequestId: _f$serviceRequestId,
    #clientReferenceId: _f$clientReferenceId,
    #complainantMobileNumber: _f$complainantMobileNumber,
    #complaintNumber: _f$complaintNumber,
    #isDeleted: _f$isDeleted,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
    #boundaryCode: _f$boundaryCode,
  };
  @override
  final bool ignoreNull = true;

  static PgrServiceSearchModel _instantiate(DecodingData data) {
    return PgrServiceSearchModel(
        complaintAssignedTo: data.dec(_f$complaintAssignedTo),
        currentUserName: data.dec(_f$currentUserName),
        complaintTypeCode: data.dec(_f$complaintTypeCode),
        locality: data.dec(_f$locality),
        complaintStatus: data.dec(_f$complaintStatus),
        tenantId: data.dec(_f$tenantId),
        serviceRequestId: data.dec(_f$serviceRequestId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        complainantMobileNumber: data.dec(_f$complainantMobileNumber),
        complaintNumber: data.dec(_f$complaintNumber),
        isDeleted: data.dec(_f$isDeleted),
        auditDetails: data.dec(_f$auditDetails),
        additionalFields: data.dec(_f$additionalFields),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrServiceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrServiceSearchModel>(map);
  }

  static PgrServiceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<PgrServiceSearchModel>(json);
  }
}

mixin PgrServiceSearchModelMappable {
  String toJson() {
    return PgrServiceSearchModelMapper.ensureInitialized()
        .encodeJson<PgrServiceSearchModel>(this as PgrServiceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return PgrServiceSearchModelMapper.ensureInitialized()
        .encodeMap<PgrServiceSearchModel>(this as PgrServiceSearchModel);
  }

  PgrServiceSearchModelCopyWith<PgrServiceSearchModel, PgrServiceSearchModel,
          PgrServiceSearchModel>
      get copyWith => _PgrServiceSearchModelCopyWithImpl(
          this as PgrServiceSearchModel, $identity, $identity);
  @override
  String toString() {
    return PgrServiceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as PgrServiceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrServiceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as PgrServiceSearchModel, other));
  }

  @override
  int get hashCode {
    return PgrServiceSearchModelMapper.ensureInitialized()
        .hashValue(this as PgrServiceSearchModel);
  }
}

extension PgrServiceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrServiceSearchModel, $Out> {
  PgrServiceSearchModelCopyWith<$R, PgrServiceSearchModel, $Out>
      get $asPgrServiceSearchModel =>
          $base.as((v, t, t2) => _PgrServiceSearchModelCopyWithImpl(v, t, t2));
}

abstract class PgrServiceSearchModelCopyWith<
    $R,
    $In extends PgrServiceSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      PgrServiceApplicationStatus,
      ObjectCopyWith<$R, PgrServiceApplicationStatus,
          PgrServiceApplicationStatus>>? get complaintStatus;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields;
  @override
  $R call(
      {String? complaintAssignedTo,
      String? currentUserName,
      String? complaintTypeCode,
      String? locality,
      List<PgrServiceApplicationStatus>? complaintStatus,
      String? tenantId,
      String? serviceRequestId,
      String? clientReferenceId,
      String? complainantMobileNumber,
      String? complaintNumber,
      bool? isDeleted,
      AuditDetails? auditDetails,
      AdditionalFields? additionalFields,
      String? boundaryCode});
  PgrServiceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrServiceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrServiceSearchModel, $Out>
    implements PgrServiceSearchModelCopyWith<$R, PgrServiceSearchModel, $Out> {
  _PgrServiceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrServiceSearchModel> $mapper =
      PgrServiceSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      PgrServiceApplicationStatus,
      ObjectCopyWith<$R, PgrServiceApplicationStatus,
          PgrServiceApplicationStatus>>? get complaintStatus =>
      $value.complaintStatus != null
          ? ListCopyWith(
              $value.complaintStatus!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(complaintStatus: v))
          : null;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  $R call(
          {Object? complaintAssignedTo = $none,
          Object? currentUserName = $none,
          Object? complaintTypeCode = $none,
          Object? locality = $none,
          Object? complaintStatus = $none,
          Object? tenantId = $none,
          Object? serviceRequestId = $none,
          Object? clientReferenceId = $none,
          Object? complainantMobileNumber = $none,
          Object? complaintNumber = $none,
          Object? isDeleted = $none,
          Object? auditDetails = $none,
          Object? additionalFields = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (complaintAssignedTo != $none)
          #complaintAssignedTo: complaintAssignedTo,
        if (currentUserName != $none) #currentUserName: currentUserName,
        if (complaintTypeCode != $none) #complaintTypeCode: complaintTypeCode,
        if (locality != $none) #locality: locality,
        if (complaintStatus != $none) #complaintStatus: complaintStatus,
        if (tenantId != $none) #tenantId: tenantId,
        if (serviceRequestId != $none) #serviceRequestId: serviceRequestId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (complainantMobileNumber != $none)
          #complainantMobileNumber: complainantMobileNumber,
        if (complaintNumber != $none) #complaintNumber: complaintNumber,
        if (isDeleted != $none) #isDeleted: isDeleted,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  PgrServiceSearchModel $make(CopyWithData data) => PgrServiceSearchModel(
      complaintAssignedTo:
          data.get(#complaintAssignedTo, or: $value.complaintAssignedTo),
      currentUserName: data.get(#currentUserName, or: $value.currentUserName),
      complaintTypeCode:
          data.get(#complaintTypeCode, or: $value.complaintTypeCode),
      locality: data.get(#locality, or: $value.locality),
      complaintStatus: data.get(#complaintStatus, or: $value.complaintStatus),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      serviceRequestId:
          data.get(#serviceRequestId, or: $value.serviceRequestId),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      complainantMobileNumber: data.get(#complainantMobileNumber,
          or: $value.complainantMobileNumber),
      complaintNumber: data.get(#complaintNumber, or: $value.complaintNumber),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  PgrServiceSearchModelCopyWith<$R2, PgrServiceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrServiceSearchModelCopyWithImpl($value, $cast, t);
}

class PgrFiltersMapper extends ClassMapperBase<PgrFilters> {
  PgrFiltersMapper._();

  static PgrFiltersMapper? _instance;
  static PgrFiltersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrFiltersMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PgrFilters';

  static String? _$complaintAssignedTo(PgrFilters v) => v.complaintAssignedTo;
  static const Field<PgrFilters, String> _f$complaintAssignedTo =
      Field('complaintAssignedTo', _$complaintAssignedTo, opt: true);
  static String? _$complaintTypeCode(PgrFilters v) => v.complaintTypeCode;
  static const Field<PgrFilters, String> _f$complaintTypeCode =
      Field('complaintTypeCode', _$complaintTypeCode, opt: true);
  static String? _$locality(PgrFilters v) => v.locality;
  static const Field<PgrFilters, String> _f$locality =
      Field('locality', _$locality, opt: true);
  static List<PgrServiceApplicationStatus>? _$complaintStatus(PgrFilters v) =>
      v.complaintStatus;
  static const Field<PgrFilters, List<PgrServiceApplicationStatus>>
      _f$complaintStatus =
      Field('complaintStatus', _$complaintStatus, opt: true);

  @override
  final MappableFields<PgrFilters> fields = const {
    #complaintAssignedTo: _f$complaintAssignedTo,
    #complaintTypeCode: _f$complaintTypeCode,
    #locality: _f$locality,
    #complaintStatus: _f$complaintStatus,
  };
  @override
  final bool ignoreNull = true;

  static PgrFilters _instantiate(DecodingData data) {
    return PgrFilters(
        complaintAssignedTo: data.dec(_f$complaintAssignedTo),
        complaintTypeCode: data.dec(_f$complaintTypeCode),
        locality: data.dec(_f$locality),
        complaintStatus: data.dec(_f$complaintStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrFilters fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrFilters>(map);
  }

  static PgrFilters fromJson(String json) {
    return ensureInitialized().decodeJson<PgrFilters>(json);
  }
}

mixin PgrFiltersMappable {
  String toJson() {
    return PgrFiltersMapper.ensureInitialized()
        .encodeJson<PgrFilters>(this as PgrFilters);
  }

  Map<String, dynamic> toMap() {
    return PgrFiltersMapper.ensureInitialized()
        .encodeMap<PgrFilters>(this as PgrFilters);
  }

  PgrFiltersCopyWith<PgrFilters, PgrFilters, PgrFilters> get copyWith =>
      _PgrFiltersCopyWithImpl(this as PgrFilters, $identity, $identity);
  @override
  String toString() {
    return PgrFiltersMapper.ensureInitialized()
        .stringifyValue(this as PgrFilters);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrFiltersMapper.ensureInitialized()
                .isValueEqual(this as PgrFilters, other));
  }

  @override
  int get hashCode {
    return PgrFiltersMapper.ensureInitialized().hashValue(this as PgrFilters);
  }
}

extension PgrFiltersValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrFilters, $Out> {
  PgrFiltersCopyWith<$R, PgrFilters, $Out> get $asPgrFilters =>
      $base.as((v, t, t2) => _PgrFiltersCopyWithImpl(v, t, t2));
}

abstract class PgrFiltersCopyWith<$R, $In extends PgrFilters, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      PgrServiceApplicationStatus,
      ObjectCopyWith<$R, PgrServiceApplicationStatus,
          PgrServiceApplicationStatus>>? get complaintStatus;
  $R call(
      {String? complaintAssignedTo,
      String? complaintTypeCode,
      String? locality,
      List<PgrServiceApplicationStatus>? complaintStatus});
  PgrFiltersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PgrFiltersCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrFilters, $Out>
    implements PgrFiltersCopyWith<$R, PgrFilters, $Out> {
  _PgrFiltersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrFilters> $mapper =
      PgrFiltersMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      PgrServiceApplicationStatus,
      ObjectCopyWith<$R, PgrServiceApplicationStatus,
          PgrServiceApplicationStatus>>? get complaintStatus =>
      $value.complaintStatus != null
          ? ListCopyWith(
              $value.complaintStatus!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(complaintStatus: v))
          : null;
  @override
  $R call(
          {Object? complaintAssignedTo = $none,
          Object? complaintTypeCode = $none,
          Object? locality = $none,
          Object? complaintStatus = $none}) =>
      $apply(FieldCopyWithData({
        if (complaintAssignedTo != $none)
          #complaintAssignedTo: complaintAssignedTo,
        if (complaintTypeCode != $none) #complaintTypeCode: complaintTypeCode,
        if (locality != $none) #locality: locality,
        if (complaintStatus != $none) #complaintStatus: complaintStatus
      }));
  @override
  PgrFilters $make(CopyWithData data) => PgrFilters(
      complaintAssignedTo:
          data.get(#complaintAssignedTo, or: $value.complaintAssignedTo),
      complaintTypeCode:
          data.get(#complaintTypeCode, or: $value.complaintTypeCode),
      locality: data.get(#locality, or: $value.locality),
      complaintStatus: data.get(#complaintStatus, or: $value.complaintStatus));

  @override
  PgrFiltersCopyWith<$R2, PgrFilters, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrFiltersCopyWithImpl($value, $cast, t);
}

class PgrSearchKeysMapper extends ClassMapperBase<PgrSearchKeys> {
  PgrSearchKeysMapper._();

  static PgrSearchKeysMapper? _instance;
  static PgrSearchKeysMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrSearchKeysMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PgrSearchKeys';

  static String? _$complaintNumber(PgrSearchKeys v) => v.complaintNumber;
  static const Field<PgrSearchKeys, String> _f$complaintNumber =
      Field('complaintNumber', _$complaintNumber, opt: true);
  static String? _$complainantMobileNumber(PgrSearchKeys v) =>
      v.complainantMobileNumber;
  static const Field<PgrSearchKeys, String> _f$complainantMobileNumber =
      Field('complainantMobileNumber', _$complainantMobileNumber, opt: true);

  @override
  final MappableFields<PgrSearchKeys> fields = const {
    #complaintNumber: _f$complaintNumber,
    #complainantMobileNumber: _f$complainantMobileNumber,
  };
  @override
  final bool ignoreNull = true;

  static PgrSearchKeys _instantiate(DecodingData data) {
    return PgrSearchKeys(
        complaintNumber: data.dec(_f$complaintNumber),
        complainantMobileNumber: data.dec(_f$complainantMobileNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrSearchKeys fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrSearchKeys>(map);
  }

  static PgrSearchKeys fromJson(String json) {
    return ensureInitialized().decodeJson<PgrSearchKeys>(json);
  }
}

mixin PgrSearchKeysMappable {
  String toJson() {
    return PgrSearchKeysMapper.ensureInitialized()
        .encodeJson<PgrSearchKeys>(this as PgrSearchKeys);
  }

  Map<String, dynamic> toMap() {
    return PgrSearchKeysMapper.ensureInitialized()
        .encodeMap<PgrSearchKeys>(this as PgrSearchKeys);
  }

  PgrSearchKeysCopyWith<PgrSearchKeys, PgrSearchKeys, PgrSearchKeys>
      get copyWith => _PgrSearchKeysCopyWithImpl(
          this as PgrSearchKeys, $identity, $identity);
  @override
  String toString() {
    return PgrSearchKeysMapper.ensureInitialized()
        .stringifyValue(this as PgrSearchKeys);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrSearchKeysMapper.ensureInitialized()
                .isValueEqual(this as PgrSearchKeys, other));
  }

  @override
  int get hashCode {
    return PgrSearchKeysMapper.ensureInitialized()
        .hashValue(this as PgrSearchKeys);
  }
}

extension PgrSearchKeysValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrSearchKeys, $Out> {
  PgrSearchKeysCopyWith<$R, PgrSearchKeys, $Out> get $asPgrSearchKeys =>
      $base.as((v, t, t2) => _PgrSearchKeysCopyWithImpl(v, t, t2));
}

abstract class PgrSearchKeysCopyWith<$R, $In extends PgrSearchKeys, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? complaintNumber, String? complainantMobileNumber});
  PgrSearchKeysCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PgrSearchKeysCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrSearchKeys, $Out>
    implements PgrSearchKeysCopyWith<$R, PgrSearchKeys, $Out> {
  _PgrSearchKeysCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrSearchKeys> $mapper =
      PgrSearchKeysMapper.ensureInitialized();
  @override
  $R call(
          {Object? complaintNumber = $none,
          Object? complainantMobileNumber = $none}) =>
      $apply(FieldCopyWithData({
        if (complaintNumber != $none) #complaintNumber: complaintNumber,
        if (complainantMobileNumber != $none)
          #complainantMobileNumber: complainantMobileNumber
      }));
  @override
  PgrSearchKeys $make(CopyWithData data) => PgrSearchKeys(
      complaintNumber: data.get(#complaintNumber, or: $value.complaintNumber),
      complainantMobileNumber: data.get(#complainantMobileNumber,
          or: $value.complainantMobileNumber));

  @override
  PgrSearchKeysCopyWith<$R2, PgrSearchKeys, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PgrSearchKeysCopyWithImpl($value, $cast, t);
}

class PgrAdditionalDetailsMapper extends ClassMapperBase<PgrAdditionalDetails> {
  PgrAdditionalDetailsMapper._();

  static PgrAdditionalDetailsMapper? _instance;
  static PgrAdditionalDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PgrAdditionalDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PgrAdditionalDetails';

  static String? _$supervisorName(PgrAdditionalDetails v) => v.supervisorName;
  static const Field<PgrAdditionalDetails, String> _f$supervisorName =
      Field('supervisorName', _$supervisorName, opt: true);
  static String? _$supervisorContactNumber(PgrAdditionalDetails v) =>
      v.supervisorContactNumber;
  static const Field<PgrAdditionalDetails, String> _f$supervisorContactNumber =
      Field('supervisorContactNumber', _$supervisorContactNumber, opt: true);
  static String? _$otherComplaintDescription(PgrAdditionalDetails v) =>
      v.otherComplaintDescription;
  static const Field<PgrAdditionalDetails, String>
      _f$otherComplaintDescription = Field(
          'otherComplaintDescription', _$otherComplaintDescription,
          opt: true);

  @override
  final MappableFields<PgrAdditionalDetails> fields = const {
    #supervisorName: _f$supervisorName,
    #supervisorContactNumber: _f$supervisorContactNumber,
    #otherComplaintDescription: _f$otherComplaintDescription,
  };
  @override
  final bool ignoreNull = true;

  static PgrAdditionalDetails _instantiate(DecodingData data) {
    return PgrAdditionalDetails(
        supervisorName: data.dec(_f$supervisorName),
        supervisorContactNumber: data.dec(_f$supervisorContactNumber),
        otherComplaintDescription: data.dec(_f$otherComplaintDescription));
  }

  @override
  final Function instantiate = _instantiate;

  static PgrAdditionalDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PgrAdditionalDetails>(map);
  }

  static PgrAdditionalDetails fromJson(String json) {
    return ensureInitialized().decodeJson<PgrAdditionalDetails>(json);
  }
}

mixin PgrAdditionalDetailsMappable {
  String toJson() {
    return PgrAdditionalDetailsMapper.ensureInitialized()
        .encodeJson<PgrAdditionalDetails>(this as PgrAdditionalDetails);
  }

  Map<String, dynamic> toMap() {
    return PgrAdditionalDetailsMapper.ensureInitialized()
        .encodeMap<PgrAdditionalDetails>(this as PgrAdditionalDetails);
  }

  PgrAdditionalDetailsCopyWith<PgrAdditionalDetails, PgrAdditionalDetails,
          PgrAdditionalDetails>
      get copyWith => _PgrAdditionalDetailsCopyWithImpl(
          this as PgrAdditionalDetails, $identity, $identity);
  @override
  String toString() {
    return PgrAdditionalDetailsMapper.ensureInitialized()
        .stringifyValue(this as PgrAdditionalDetails);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PgrAdditionalDetailsMapper.ensureInitialized()
                .isValueEqual(this as PgrAdditionalDetails, other));
  }

  @override
  int get hashCode {
    return PgrAdditionalDetailsMapper.ensureInitialized()
        .hashValue(this as PgrAdditionalDetails);
  }
}

extension PgrAdditionalDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PgrAdditionalDetails, $Out> {
  PgrAdditionalDetailsCopyWith<$R, PgrAdditionalDetails, $Out>
      get $asPgrAdditionalDetails =>
          $base.as((v, t, t2) => _PgrAdditionalDetailsCopyWithImpl(v, t, t2));
}

abstract class PgrAdditionalDetailsCopyWith<
    $R,
    $In extends PgrAdditionalDetails,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? supervisorName,
      String? supervisorContactNumber,
      String? otherComplaintDescription});
  PgrAdditionalDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PgrAdditionalDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PgrAdditionalDetails, $Out>
    implements PgrAdditionalDetailsCopyWith<$R, PgrAdditionalDetails, $Out> {
  _PgrAdditionalDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PgrAdditionalDetails> $mapper =
      PgrAdditionalDetailsMapper.ensureInitialized();
  @override
  $R call(
          {Object? supervisorName = $none,
          Object? supervisorContactNumber = $none,
          Object? otherComplaintDescription = $none}) =>
      $apply(FieldCopyWithData({
        if (supervisorName != $none) #supervisorName: supervisorName,
        if (supervisorContactNumber != $none)
          #supervisorContactNumber: supervisorContactNumber,
        if (otherComplaintDescription != $none)
          #otherComplaintDescription: otherComplaintDescription
      }));
  @override
  PgrAdditionalDetails $make(CopyWithData data) => PgrAdditionalDetails(
      supervisorName: data.get(#supervisorName, or: $value.supervisorName),
      supervisorContactNumber: data.get(#supervisorContactNumber,
          or: $value.supervisorContactNumber),
      otherComplaintDescription: data.get(#otherComplaintDescription,
          or: $value.otherComplaintDescription));

  @override
  PgrAdditionalDetailsCopyWith<$R2, PgrAdditionalDetails, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PgrAdditionalDetailsCopyWithImpl($value, $cast, t);
}
