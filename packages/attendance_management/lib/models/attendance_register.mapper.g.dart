import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'attendance_audit.dart';
import 'attendance_log.dart';
import 'attendance_register.dart';
import 'attendee.dart';
import 'staff.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  RegisterAuditDetailsMapper._(),
  AttendanceAuditDetailsMapper._(),
  AttendancePackageRegisterModelMapper._(),
  AttendanceRegisterAdditionalFieldsMapper._(),
  AttendeeSearchModelMapper._(),
  AttendeeModelMapper._(),
  AttendeeAdditionalFieldsMapper._(),
  StaffSearchModelMapper._(),
  StaffModelMapper._(),
  StaffAdditionalFieldsMapper._(),
  AttendanceLogSearchModelMapper._(),
  AttendanceLogModelMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class RegisterAuditDetailsMapper extends BaseMapper<RegisterAuditDetails> {
  RegisterAuditDetailsMapper._();

  @override Function get decoder => decode;
  RegisterAuditDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  RegisterAuditDetails fromMap(Map<String, dynamic> map) => RegisterAuditDetails(createdBy: Mapper.i.$get(map, 'createdBy'), createdTime: Mapper.i.$get(map, 'createdTime'), lastModifiedBy: Mapper.i.$getOpt(map, 'lastModifiedBy'), lastModifiedTime: Mapper.i.$getOpt(map, 'lastModifiedTime'), registerId: Mapper.i.$getOpt(map, 'registerId'));

  @override Function get encoder => (RegisterAuditDetails v) => encode(v);
  dynamic encode(RegisterAuditDetails v) => toMap(v);
  Map<String, dynamic> toMap(RegisterAuditDetails r) => {'createdBy': Mapper.i.$enc(r.createdBy, 'createdBy'), 'createdTime': Mapper.i.$enc(r.createdTime, 'createdTime'), 'lastModifiedBy': Mapper.i.$enc(r.lastModifiedBy, 'lastModifiedBy'), 'lastModifiedTime': Mapper.i.$enc(r.lastModifiedTime, 'lastModifiedTime'), 'registerId': Mapper.i.$enc(r.registerId, 'registerId')};

  @override String stringify(RegisterAuditDetails self) => 'RegisterAuditDetails(createdBy: ${Mapper.asString(self.createdBy)}, lastModifiedBy: ${Mapper.asString(self.lastModifiedBy)}, createdTime: ${Mapper.asString(self.createdTime)}, lastModifiedTime: ${Mapper.asString(self.lastModifiedTime)}, registerId: ${Mapper.asString(self.registerId)})';
  @override int hash(RegisterAuditDetails self) => Mapper.hash(self.createdBy) ^ Mapper.hash(self.lastModifiedBy) ^ Mapper.hash(self.createdTime) ^ Mapper.hash(self.lastModifiedTime) ^ Mapper.hash(self.registerId);
  @override bool equals(RegisterAuditDetails self, RegisterAuditDetails other) => Mapper.isEqual(self.createdBy, other.createdBy) && Mapper.isEqual(self.lastModifiedBy, other.lastModifiedBy) && Mapper.isEqual(self.createdTime, other.createdTime) && Mapper.isEqual(self.lastModifiedTime, other.lastModifiedTime) && Mapper.isEqual(self.registerId, other.registerId);

  @override Function get typeFactory => (f) => f<RegisterAuditDetails>();
}

extension RegisterAuditDetailsMapperExtension  on RegisterAuditDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  RegisterAuditDetailsCopyWith<RegisterAuditDetails> get copyWith => RegisterAuditDetailsCopyWith(this, $identity);
}

abstract class RegisterAuditDetailsCopyWith<$R> {
  factory RegisterAuditDetailsCopyWith(RegisterAuditDetails value, Then<RegisterAuditDetails, $R> then) = _RegisterAuditDetailsCopyWithImpl<$R>;
  $R call({String? createdBy, int? createdTime, String? lastModifiedBy, int? lastModifiedTime, String? registerId});
  $R apply(RegisterAuditDetails Function(RegisterAuditDetails) transform);
}

class _RegisterAuditDetailsCopyWithImpl<$R> extends BaseCopyWith<RegisterAuditDetails, $R> implements RegisterAuditDetailsCopyWith<$R> {
  _RegisterAuditDetailsCopyWithImpl(RegisterAuditDetails value, Then<RegisterAuditDetails, $R> then) : super(value, then);

  @override $R call({String? createdBy, int? createdTime, Object? lastModifiedBy = $none, Object? lastModifiedTime = $none, Object? registerId = $none}) => $then(RegisterAuditDetails(createdBy: createdBy ?? $value.createdBy, createdTime: createdTime ?? $value.createdTime, lastModifiedBy: or(lastModifiedBy, $value.lastModifiedBy), lastModifiedTime: or(lastModifiedTime, $value.lastModifiedTime), registerId: or(registerId, $value.registerId)));
}

class AttendanceAuditDetailsMapper extends BaseMapper<AttendanceAuditDetails> {
  AttendanceAuditDetailsMapper._();

  @override Function get decoder => decode;
  AttendanceAuditDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceAuditDetails fromMap(Map<String, dynamic> map) => AttendanceAuditDetails(createdBy: Mapper.i.$get(map, 'createdBy'), createdTime: Mapper.i.$get(map, 'createdTime'), lastModifiedBy: Mapper.i.$getOpt(map, 'lastModifiedBy'), lastModifiedTime: Mapper.i.$getOpt(map, 'lastModifiedTime'));

  @override Function get encoder => (AttendanceAuditDetails v) => encode(v);
  dynamic encode(AttendanceAuditDetails v) {
    if (v is RegisterAuditDetails) { return RegisterAuditDetailsMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(AttendanceAuditDetails a) => {'createdBy': Mapper.i.$enc(a.createdBy, 'createdBy'), 'createdTime': Mapper.i.$enc(a.createdTime, 'createdTime'), 'lastModifiedBy': Mapper.i.$enc(a.lastModifiedBy, 'lastModifiedBy'), 'lastModifiedTime': Mapper.i.$enc(a.lastModifiedTime, 'lastModifiedTime')};

  @override String stringify(AttendanceAuditDetails self) => 'AttendanceAuditDetails(createdBy: ${Mapper.asString(self.createdBy)}, lastModifiedBy: ${Mapper.asString(self.lastModifiedBy)}, createdTime: ${Mapper.asString(self.createdTime)}, lastModifiedTime: ${Mapper.asString(self.lastModifiedTime)})';
  @override int hash(AttendanceAuditDetails self) => Mapper.hash(self.createdBy) ^ Mapper.hash(self.lastModifiedBy) ^ Mapper.hash(self.createdTime) ^ Mapper.hash(self.lastModifiedTime);
  @override bool equals(AttendanceAuditDetails self, AttendanceAuditDetails other) => Mapper.isEqual(self.createdBy, other.createdBy) && Mapper.isEqual(self.lastModifiedBy, other.lastModifiedBy) && Mapper.isEqual(self.createdTime, other.createdTime) && Mapper.isEqual(self.lastModifiedTime, other.lastModifiedTime);

  @override Function get typeFactory => (f) => f<AttendanceAuditDetails>();
}

extension AttendanceAuditDetailsMapperExtension  on AttendanceAuditDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceAuditDetailsCopyWith<AttendanceAuditDetails> get copyWith => AttendanceAuditDetailsCopyWith(this, $identity);
}

abstract class AttendanceAuditDetailsCopyWith<$R> {
  factory AttendanceAuditDetailsCopyWith(AttendanceAuditDetails value, Then<AttendanceAuditDetails, $R> then) = _AttendanceAuditDetailsCopyWithImpl<$R>;
  $R call({String? createdBy, int? createdTime, String? lastModifiedBy, int? lastModifiedTime});
  $R apply(AttendanceAuditDetails Function(AttendanceAuditDetails) transform);
}

class _AttendanceAuditDetailsCopyWithImpl<$R> extends BaseCopyWith<AttendanceAuditDetails, $R> implements AttendanceAuditDetailsCopyWith<$R> {
  _AttendanceAuditDetailsCopyWithImpl(AttendanceAuditDetails value, Then<AttendanceAuditDetails, $R> then) : super(value, then);

  @override $R call({String? createdBy, int? createdTime, Object? lastModifiedBy = $none, Object? lastModifiedTime = $none}) => $then(AttendanceAuditDetails(createdBy: createdBy ?? $value.createdBy, createdTime: createdTime ?? $value.createdTime, lastModifiedBy: or(lastModifiedBy, $value.lastModifiedBy), lastModifiedTime: or(lastModifiedTime, $value.lastModifiedTime)));
}

class AttendancePackageRegisterModelMapper extends BaseMapper<AttendancePackageRegisterModel> {
  AttendancePackageRegisterModelMapper._();

  @override Function get decoder => decode;
  AttendancePackageRegisterModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendancePackageRegisterModel fromMap(Map<String, dynamic> map) => AttendancePackageRegisterModel(additionalDetails: Mapper.i.$getOpt(map, 'additionalDetails'), id: Mapper.i.$get(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerNumber: Mapper.i.$getOpt(map, 'registerNumber'), name: Mapper.i.$getOpt(map, 'name'), referenceId: Mapper.i.$getOpt(map, 'referenceId'), serviceCode: Mapper.i.$getOpt(map, 'serviceCode'), status: Mapper.i.$getOpt(map, 'status'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'), startDate: Mapper.i.$getOpt(map, 'startDate'), endDate: Mapper.i.$getOpt(map, 'endDate'), attendees: Mapper.i.$getOpt(map, 'attendees'), staff: Mapper.i.$getOpt(map, 'staff'), auditDetails: Mapper.i.$getOpt(map, 'auditDetails'));

  @override Function get encoder => (AttendancePackageRegisterModel v) => encode(v);
  dynamic encode(AttendancePackageRegisterModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendancePackageRegisterModel a) => {if (Mapper.i.$enc(a.additionalDetails, 'additionalDetails') != null) 'additionalDetails': Mapper.i.$enc(a.additionalDetails, 'additionalDetails'), 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerNumber, 'registerNumber') != null) 'registerNumber': Mapper.i.$enc(a.registerNumber, 'registerNumber'), if (Mapper.i.$enc(a.name, 'name') != null) 'name': Mapper.i.$enc(a.name, 'name'), if (Mapper.i.$enc(a.referenceId, 'referenceId') != null) 'referenceId': Mapper.i.$enc(a.referenceId, 'referenceId'), if (Mapper.i.$enc(a.serviceCode, 'serviceCode') != null) 'serviceCode': Mapper.i.$enc(a.serviceCode, 'serviceCode'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status'), if (Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(a.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(a.rowVersion, 'rowVersion'), if (Mapper.i.$enc(a.startDate, 'startDate') != null) 'startDate': Mapper.i.$enc(a.startDate, 'startDate'), if (Mapper.i.$enc(a.endDate, 'endDate') != null) 'endDate': Mapper.i.$enc(a.endDate, 'endDate'), if (Mapper.i.$enc(a.attendees, 'attendees') != null) 'attendees': Mapper.i.$enc(a.attendees, 'attendees'), if (Mapper.i.$enc(a.staff, 'staff') != null) 'staff': Mapper.i.$enc(a.staff, 'staff'), if (Mapper.i.$enc(a.auditDetails, 'auditDetails') != null) 'auditDetails': Mapper.i.$enc(a.auditDetails, 'auditDetails')};

  @override String stringify(AttendancePackageRegisterModel self) => 'AttendancePackageRegisterModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerNumber: ${Mapper.asString(self.registerNumber)}, name: ${Mapper.asString(self.name)}, referenceId: ${Mapper.asString(self.referenceId)}, serviceCode: ${Mapper.asString(self.serviceCode)}, status: ${Mapper.asString(self.status)}, nonRecoverableError: ${Mapper.asString(self.nonRecoverableError)}, rowVersion: ${Mapper.asString(self.rowVersion)}, startDate: ${Mapper.asString(self.startDate)}, endDate: ${Mapper.asString(self.endDate)}, attendees: ${Mapper.asString(self.attendees)}, staff: ${Mapper.asString(self.staff)}, additionalDetails: ${Mapper.asString(self.additionalDetails)}, auditDetails: ${Mapper.asString(self.auditDetails)})';
  @override int hash(AttendancePackageRegisterModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerNumber) ^ Mapper.hash(self.name) ^ Mapper.hash(self.referenceId) ^ Mapper.hash(self.serviceCode) ^ Mapper.hash(self.status) ^ Mapper.hash(self.nonRecoverableError) ^ Mapper.hash(self.rowVersion) ^ Mapper.hash(self.startDate) ^ Mapper.hash(self.endDate) ^ Mapper.hash(self.attendees) ^ Mapper.hash(self.staff) ^ Mapper.hash(self.additionalDetails) ^ Mapper.hash(self.auditDetails);
  @override bool equals(AttendancePackageRegisterModel self, AttendancePackageRegisterModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerNumber, other.registerNumber) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.referenceId, other.referenceId) && Mapper.isEqual(self.serviceCode, other.serviceCode) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.nonRecoverableError, other.nonRecoverableError) && Mapper.isEqual(self.rowVersion, other.rowVersion) && Mapper.isEqual(self.startDate, other.startDate) && Mapper.isEqual(self.endDate, other.endDate) && Mapper.isEqual(self.attendees, other.attendees) && Mapper.isEqual(self.staff, other.staff) && Mapper.isEqual(self.additionalDetails, other.additionalDetails) && Mapper.isEqual(self.auditDetails, other.auditDetails);

  @override Function get typeFactory => (f) => f<AttendancePackageRegisterModel>();
}

extension AttendancePackageRegisterModelMapperExtension  on AttendancePackageRegisterModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendancePackageRegisterModelCopyWith<AttendancePackageRegisterModel> get copyWith => AttendancePackageRegisterModelCopyWith(this, $identity);
}

abstract class AttendancePackageRegisterModelCopyWith<$R> {
  factory AttendancePackageRegisterModelCopyWith(AttendancePackageRegisterModel value, Then<AttendancePackageRegisterModel, $R> then) = _AttendancePackageRegisterModelCopyWithImpl<$R>;
  ListCopyWith<$R, AttendeeModel, AttendeeModelCopyWith<$R>>? get attendees;
  ListCopyWith<$R, StaffModel, StaffModelCopyWith<$R>>? get staff;
  AttendanceAuditDetailsCopyWith<$R>? get auditDetails;
  $R call({Map<String, dynamic>? additionalDetails, String? id, String? tenantId, String? registerNumber, String? name, String? referenceId, String? serviceCode, String? status, bool? nonRecoverableError, int? rowVersion, int? startDate, int? endDate, List<AttendeeModel>? attendees, List<StaffModel>? staff, AttendanceAuditDetails? auditDetails});
  $R apply(AttendancePackageRegisterModel Function(AttendancePackageRegisterModel) transform);
}

class _AttendancePackageRegisterModelCopyWithImpl<$R> extends BaseCopyWith<AttendancePackageRegisterModel, $R> implements AttendancePackageRegisterModelCopyWith<$R> {
  _AttendancePackageRegisterModelCopyWithImpl(AttendancePackageRegisterModel value, Then<AttendancePackageRegisterModel, $R> then) : super(value, then);

  @override ListCopyWith<$R, AttendeeModel, AttendeeModelCopyWith<$R>>? get attendees => $value.attendees != null ? ListCopyWith($value.attendees!, (v, t) => AttendeeModelCopyWith(v, t), (v) => call(attendees: v)) : null;
  @override ListCopyWith<$R, StaffModel, StaffModelCopyWith<$R>>? get staff => $value.staff != null ? ListCopyWith($value.staff!, (v, t) => StaffModelCopyWith(v, t), (v) => call(staff: v)) : null;
  @override AttendanceAuditDetailsCopyWith<$R>? get auditDetails => $value.auditDetails != null ? AttendanceAuditDetailsCopyWith($value.auditDetails!, (v) => call(auditDetails: v)) : null;
  @override $R call({Object? additionalDetails = $none, String? id, Object? tenantId = $none, Object? registerNumber = $none, Object? name = $none, Object? referenceId = $none, Object? serviceCode = $none, Object? status = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none, Object? startDate = $none, Object? endDate = $none, Object? attendees = $none, Object? staff = $none, Object? auditDetails = $none}) => $then(AttendancePackageRegisterModel(additionalDetails: or(additionalDetails, $value.additionalDetails), id: id ?? $value.id, tenantId: or(tenantId, $value.tenantId), registerNumber: or(registerNumber, $value.registerNumber), name: or(name, $value.name), referenceId: or(referenceId, $value.referenceId), serviceCode: or(serviceCode, $value.serviceCode), status: or(status, $value.status), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion), startDate: or(startDate, $value.startDate), endDate: or(endDate, $value.endDate), attendees: or(attendees, $value.attendees), staff: or(staff, $value.staff), auditDetails: or(auditDetails, $value.auditDetails)));
}

class AttendanceRegisterAdditionalFieldsMapper extends BaseMapper<AttendanceRegisterAdditionalFields> {
  AttendanceRegisterAdditionalFieldsMapper._();

  @override Function get decoder => decode;
  AttendanceRegisterAdditionalFields decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceRegisterAdditionalFields fromMap(Map<String, dynamic> map) => AttendanceRegisterAdditionalFields(description: Mapper.i.$get(map, 'description'));

  @override Function get encoder => (AttendanceRegisterAdditionalFields v) => encode(v);
  dynamic encode(AttendanceRegisterAdditionalFields v) => toMap(v);
  Map<String, dynamic> toMap(AttendanceRegisterAdditionalFields a) => {'description': Mapper.i.$enc(a.description, 'description')};

  @override String stringify(AttendanceRegisterAdditionalFields self) => 'AttendanceRegisterAdditionalFields(description: ${Mapper.asString(self.description)})';
  @override int hash(AttendanceRegisterAdditionalFields self) => Mapper.hash(self.description);
  @override bool equals(AttendanceRegisterAdditionalFields self, AttendanceRegisterAdditionalFields other) => Mapper.isEqual(self.description, other.description);

  @override Function get typeFactory => (f) => f<AttendanceRegisterAdditionalFields>();
}

extension AttendanceRegisterAdditionalFieldsMapperExtension  on AttendanceRegisterAdditionalFields {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceRegisterAdditionalFieldsCopyWith<AttendanceRegisterAdditionalFields> get copyWith => AttendanceRegisterAdditionalFieldsCopyWith(this, $identity);
}

abstract class AttendanceRegisterAdditionalFieldsCopyWith<$R> {
  factory AttendanceRegisterAdditionalFieldsCopyWith(AttendanceRegisterAdditionalFields value, Then<AttendanceRegisterAdditionalFields, $R> then) = _AttendanceRegisterAdditionalFieldsCopyWithImpl<$R>;
  $R call({Map<String, dynamic>? description});
  $R apply(AttendanceRegisterAdditionalFields Function(AttendanceRegisterAdditionalFields) transform);
}

class _AttendanceRegisterAdditionalFieldsCopyWithImpl<$R> extends BaseCopyWith<AttendanceRegisterAdditionalFields, $R> implements AttendanceRegisterAdditionalFieldsCopyWith<$R> {
  _AttendanceRegisterAdditionalFieldsCopyWithImpl(AttendanceRegisterAdditionalFields value, Then<AttendanceRegisterAdditionalFields, $R> then) : super(value, then);

  @override $R call({Map<String, dynamic>? description}) => $then(AttendanceRegisterAdditionalFields(description: description ?? $value.description));
}

class AttendeeSearchModelMapper extends BaseMapper<AttendeeSearchModel> {
  AttendeeSearchModelMapper._();

  @override Function get decoder => decode;
  AttendeeSearchModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendeeSearchModel fromMap(Map<String, dynamic> map) => AttendeeSearchModel.ignoreDeleted(id: Mapper.i.$getOpt(map, 'id'), registerId: Mapper.i.$getOpt(map, 'registerId'));

  @override Function get encoder => (AttendeeSearchModel v) => encode(v);
  dynamic encode(AttendeeSearchModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendeeSearchModel a) => {if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId')};

  @override String stringify(AttendeeSearchModel self) => 'AttendeeSearchModel(id: ${Mapper.asString(self.id)}, registerId: ${Mapper.asString(self.registerId)})';
  @override int hash(AttendeeSearchModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.registerId);
  @override bool equals(AttendeeSearchModel self, AttendeeSearchModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.registerId, other.registerId);

  @override Function get typeFactory => (f) => f<AttendeeSearchModel>();
}

extension AttendeeSearchModelMapperExtension  on AttendeeSearchModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendeeSearchModelCopyWith<AttendeeSearchModel> get copyWith => AttendeeSearchModelCopyWith(this, $identity);
}

abstract class AttendeeSearchModelCopyWith<$R> {
  factory AttendeeSearchModelCopyWith(AttendeeSearchModel value, Then<AttendeeSearchModel, $R> then) = _AttendeeSearchModelCopyWithImpl<$R>;
  $R call({String? id, String? registerId});
  $R apply(AttendeeSearchModel Function(AttendeeSearchModel) transform);
}

class _AttendeeSearchModelCopyWithImpl<$R> extends BaseCopyWith<AttendeeSearchModel, $R> implements AttendeeSearchModelCopyWith<$R> {
  _AttendeeSearchModelCopyWithImpl(AttendeeSearchModel value, Then<AttendeeSearchModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? registerId = $none}) => $then(AttendeeSearchModel.ignoreDeleted(id: or(id, $value.id), registerId: or(registerId, $value.registerId)));
}

class AttendeeModelMapper extends BaseMapper<AttendeeModel> {
  AttendeeModelMapper._();

  @override Function get decoder => decode;
  AttendeeModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendeeModel fromMap(Map<String, dynamic> map) => AttendeeModel(additionalFields: Mapper.i.$getOpt(map, 'additionalFields'), id: Mapper.i.$getOpt(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerId: Mapper.i.$getOpt(map, 'registerId'), individualId: Mapper.i.$getOpt(map, 'individualId'), enrollmentDate: Mapper.i.$getOpt(map, 'enrollmentDate'), denrollmentDate: Mapper.i.$getOpt(map, 'denrollmentDate'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'), name: Mapper.i.$getOpt(map, 'name'), identifierID: Mapper.i.$getOpt(map, 'identifierID'), individualNumber: Mapper.i.$getOpt(map, 'individualNumber'), status: Mapper.i.$getOpt(map, 'status') ?? -1);

  @override Function get encoder => (AttendeeModel v) => encode(v);
  dynamic encode(AttendeeModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendeeModel a) => {if (Mapper.i.$enc(a.additionalFields, 'additionalFields') != null) 'additionalFields': Mapper.i.$enc(a.additionalFields, 'additionalFields'), if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId'), if (Mapper.i.$enc(a.individualId, 'individualId') != null) 'individualId': Mapper.i.$enc(a.individualId, 'individualId'), if (Mapper.i.$enc(a.enrollmentDate, 'enrollmentDate') != null) 'enrollmentDate': Mapper.i.$enc(a.enrollmentDate, 'enrollmentDate'), if (Mapper.i.$enc(a.denrollmentDate, 'denrollmentDate') != null) 'denrollmentDate': Mapper.i.$enc(a.denrollmentDate, 'denrollmentDate'), if (Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(a.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(a.rowVersion, 'rowVersion'), if (Mapper.i.$enc(a.name, 'name') != null) 'name': Mapper.i.$enc(a.name, 'name'), if (Mapper.i.$enc(a.identifierID, 'identifierID') != null) 'identifierID': Mapper.i.$enc(a.identifierID, 'identifierID'), if (Mapper.i.$enc(a.individualNumber, 'individualNumber') != null) 'individualNumber': Mapper.i.$enc(a.individualNumber, 'individualNumber'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status')};

  @override String stringify(AttendeeModel self) => 'AttendeeModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerId: ${Mapper.asString(self.registerId)}, individualId: ${Mapper.asString(self.individualId)}, enrollmentDate: ${Mapper.asString(self.enrollmentDate)}, denrollmentDate: ${Mapper.asString(self.denrollmentDate)}, nonRecoverableError: ${Mapper.asString(self.nonRecoverableError)}, name: ${Mapper.asString(self.name)}, rowVersion: ${Mapper.asString(self.rowVersion)}, status: ${Mapper.asString(self.status)}, identifierID: ${Mapper.asString(self.identifierID)}, individualNumber: ${Mapper.asString(self.individualNumber)}, additionalFields: ${Mapper.asString(self.additionalFields)})';
  @override int hash(AttendeeModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerId) ^ Mapper.hash(self.individualId) ^ Mapper.hash(self.enrollmentDate) ^ Mapper.hash(self.denrollmentDate) ^ Mapper.hash(self.nonRecoverableError) ^ Mapper.hash(self.name) ^ Mapper.hash(self.rowVersion) ^ Mapper.hash(self.status) ^ Mapper.hash(self.identifierID) ^ Mapper.hash(self.individualNumber) ^ Mapper.hash(self.additionalFields);
  @override bool equals(AttendeeModel self, AttendeeModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerId, other.registerId) && Mapper.isEqual(self.individualId, other.individualId) && Mapper.isEqual(self.enrollmentDate, other.enrollmentDate) && Mapper.isEqual(self.denrollmentDate, other.denrollmentDate) && Mapper.isEqual(self.nonRecoverableError, other.nonRecoverableError) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.rowVersion, other.rowVersion) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.identifierID, other.identifierID) && Mapper.isEqual(self.individualNumber, other.individualNumber) && Mapper.isEqual(self.additionalFields, other.additionalFields);

  @override Function get typeFactory => (f) => f<AttendeeModel>();
}

extension AttendeeModelMapperExtension  on AttendeeModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendeeModelCopyWith<AttendeeModel> get copyWith => AttendeeModelCopyWith(this, $identity);
}

abstract class AttendeeModelCopyWith<$R> {
  factory AttendeeModelCopyWith(AttendeeModel value, Then<AttendeeModel, $R> then) = _AttendeeModelCopyWithImpl<$R>;
  AttendeeAdditionalFieldsCopyWith<$R>? get additionalFields;
  $R call({AttendeeAdditionalFields? additionalFields, String? id, String? tenantId, String? registerId, String? individualId, int? enrollmentDate, int? denrollmentDate, bool? nonRecoverableError, int? rowVersion, String? name, String? identifierID, String? individualNumber, int? status});
  $R apply(AttendeeModel Function(AttendeeModel) transform);
}

class _AttendeeModelCopyWithImpl<$R> extends BaseCopyWith<AttendeeModel, $R> implements AttendeeModelCopyWith<$R> {
  _AttendeeModelCopyWithImpl(AttendeeModel value, Then<AttendeeModel, $R> then) : super(value, then);

  @override AttendeeAdditionalFieldsCopyWith<$R>? get additionalFields => $value.additionalFields != null ? AttendeeAdditionalFieldsCopyWith($value.additionalFields!, (v) => call(additionalFields: v)) : null;
  @override $R call({Object? additionalFields = $none, Object? id = $none, Object? tenantId = $none, Object? registerId = $none, Object? individualId = $none, Object? enrollmentDate = $none, Object? denrollmentDate = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none, Object? name = $none, Object? identifierID = $none, Object? individualNumber = $none, Object? status = $none}) => $then(AttendeeModel(additionalFields: or(additionalFields, $value.additionalFields), id: or(id, $value.id), tenantId: or(tenantId, $value.tenantId), registerId: or(registerId, $value.registerId), individualId: or(individualId, $value.individualId), enrollmentDate: or(enrollmentDate, $value.enrollmentDate), denrollmentDate: or(denrollmentDate, $value.denrollmentDate), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion), name: or(name, $value.name), identifierID: or(identifierID, $value.identifierID), individualNumber: or(individualNumber, $value.individualNumber), status: or(status, $value.status)));
}

class AttendeeAdditionalFieldsMapper extends BaseMapper<AttendeeAdditionalFields> {
  AttendeeAdditionalFieldsMapper._();

  @override Function get decoder => decode;
  AttendeeAdditionalFields decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendeeAdditionalFields fromMap(Map<String, dynamic> map) => AttendeeAdditionalFields();

  @override Function get encoder => (AttendeeAdditionalFields v) => encode(v);
  dynamic encode(AttendeeAdditionalFields v) => toMap(v);
  Map<String, dynamic> toMap(AttendeeAdditionalFields a) => {};

  @override String stringify(AttendeeAdditionalFields self) => 'AttendeeAdditionalFields()';
  @override int hash(AttendeeAdditionalFields self) => 0;
  @override bool equals(AttendeeAdditionalFields self, AttendeeAdditionalFields other) => true;

  @override Function get typeFactory => (f) => f<AttendeeAdditionalFields>();
}

extension AttendeeAdditionalFieldsMapperExtension  on AttendeeAdditionalFields {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendeeAdditionalFieldsCopyWith<AttendeeAdditionalFields> get copyWith => AttendeeAdditionalFieldsCopyWith(this, $identity);
}

abstract class AttendeeAdditionalFieldsCopyWith<$R> {
  factory AttendeeAdditionalFieldsCopyWith(AttendeeAdditionalFields value, Then<AttendeeAdditionalFields, $R> then) = _AttendeeAdditionalFieldsCopyWithImpl<$R>;
  $R call();
  $R apply(AttendeeAdditionalFields Function(AttendeeAdditionalFields) transform);
}

class _AttendeeAdditionalFieldsCopyWithImpl<$R> extends BaseCopyWith<AttendeeAdditionalFields, $R> implements AttendeeAdditionalFieldsCopyWith<$R> {
  _AttendeeAdditionalFieldsCopyWithImpl(AttendeeAdditionalFields value, Then<AttendeeAdditionalFields, $R> then) : super(value, then);

  @override $R call() => $then(AttendeeAdditionalFields());
}

class StaffSearchModelMapper extends BaseMapper<StaffSearchModel> {
  StaffSearchModelMapper._();

  @override Function get decoder => decode;
  StaffSearchModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  StaffSearchModel fromMap(Map<String, dynamic> map) => StaffSearchModel.ignoreDeleted(id: Mapper.i.$getOpt(map, 'id'), userId: Mapper.i.$getOpt(map, 'userId'));

  @override Function get encoder => (StaffSearchModel v) => encode(v);
  dynamic encode(StaffSearchModel v) => toMap(v);
  Map<String, dynamic> toMap(StaffSearchModel s) => {if (Mapper.i.$enc(s.id, 'id') != null) 'id': Mapper.i.$enc(s.id, 'id'), if (Mapper.i.$enc(s.userId, 'userId') != null) 'userId': Mapper.i.$enc(s.userId, 'userId')};

  @override String stringify(StaffSearchModel self) => 'StaffSearchModel(id: ${Mapper.asString(self.id)}, userId: ${Mapper.asString(self.userId)})';
  @override int hash(StaffSearchModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.userId);
  @override bool equals(StaffSearchModel self, StaffSearchModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.userId, other.userId);

  @override Function get typeFactory => (f) => f<StaffSearchModel>();
}

extension StaffSearchModelMapperExtension  on StaffSearchModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  StaffSearchModelCopyWith<StaffSearchModel> get copyWith => StaffSearchModelCopyWith(this, $identity);
}

abstract class StaffSearchModelCopyWith<$R> {
  factory StaffSearchModelCopyWith(StaffSearchModel value, Then<StaffSearchModel, $R> then) = _StaffSearchModelCopyWithImpl<$R>;
  $R call({String? id, List<String>? userId});
  $R apply(StaffSearchModel Function(StaffSearchModel) transform);
}

class _StaffSearchModelCopyWithImpl<$R> extends BaseCopyWith<StaffSearchModel, $R> implements StaffSearchModelCopyWith<$R> {
  _StaffSearchModelCopyWithImpl(StaffSearchModel value, Then<StaffSearchModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? userId = $none}) => $then(StaffSearchModel.ignoreDeleted(id: or(id, $value.id), userId: or(userId, $value.userId)));
}

class StaffModelMapper extends BaseMapper<StaffModel> {
  StaffModelMapper._();

  @override Function get decoder => decode;
  StaffModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  StaffModel fromMap(Map<String, dynamic> map) => StaffModel(additionalFields: Mapper.i.$getOpt(map, 'additionalFields'), id: Mapper.i.$getOpt(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerId: Mapper.i.$getOpt(map, 'registerId'), userId: Mapper.i.$getOpt(map, 'userId'), enrollmentDate: Mapper.i.$getOpt(map, 'enrollmentDate'), denrollmentDate: Mapper.i.$getOpt(map, 'denrollmentDate'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'));

  @override Function get encoder => (StaffModel v) => encode(v);
  dynamic encode(StaffModel v) => toMap(v);
  Map<String, dynamic> toMap(StaffModel s) => {if (Mapper.i.$enc(s.additionalFields, 'additionalFields') != null) 'additionalFields': Mapper.i.$enc(s.additionalFields, 'additionalFields'), if (Mapper.i.$enc(s.id, 'id') != null) 'id': Mapper.i.$enc(s.id, 'id'), if (Mapper.i.$enc(s.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(s.tenantId, 'tenantId'), if (Mapper.i.$enc(s.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(s.registerId, 'registerId'), if (Mapper.i.$enc(s.userId, 'userId') != null) 'userId': Mapper.i.$enc(s.userId, 'userId'), if (Mapper.i.$enc(s.enrollmentDate, 'enrollmentDate') != null) 'enrollmentDate': Mapper.i.$enc(s.enrollmentDate, 'enrollmentDate'), if (Mapper.i.$enc(s.denrollmentDate, 'denrollmentDate') != null) 'denrollmentDate': Mapper.i.$enc(s.denrollmentDate, 'denrollmentDate'), if (Mapper.i.$enc(s.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(s.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(s.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(s.rowVersion, 'rowVersion')};

  @override String stringify(StaffModel self) => 'StaffModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerId: ${Mapper.asString(self.registerId)}, userId: ${Mapper.asString(self.userId)}, enrollmentDate: ${Mapper.asString(self.enrollmentDate)}, denrollmentDate: ${Mapper.asString(self.denrollmentDate)}, nonRecoverableError: ${Mapper.asString(self.nonRecoverableError)}, rowVersion: ${Mapper.asString(self.rowVersion)}, additionalFields: ${Mapper.asString(self.additionalFields)})';
  @override int hash(StaffModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerId) ^ Mapper.hash(self.userId) ^ Mapper.hash(self.enrollmentDate) ^ Mapper.hash(self.denrollmentDate) ^ Mapper.hash(self.nonRecoverableError) ^ Mapper.hash(self.rowVersion) ^ Mapper.hash(self.additionalFields);
  @override bool equals(StaffModel self, StaffModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerId, other.registerId) && Mapper.isEqual(self.userId, other.userId) && Mapper.isEqual(self.enrollmentDate, other.enrollmentDate) && Mapper.isEqual(self.denrollmentDate, other.denrollmentDate) && Mapper.isEqual(self.nonRecoverableError, other.nonRecoverableError) && Mapper.isEqual(self.rowVersion, other.rowVersion) && Mapper.isEqual(self.additionalFields, other.additionalFields);

  @override Function get typeFactory => (f) => f<StaffModel>();
}

extension StaffModelMapperExtension  on StaffModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  StaffModelCopyWith<StaffModel> get copyWith => StaffModelCopyWith(this, $identity);
}

abstract class StaffModelCopyWith<$R> {
  factory StaffModelCopyWith(StaffModel value, Then<StaffModel, $R> then) = _StaffModelCopyWithImpl<$R>;
  StaffAdditionalFieldsCopyWith<$R>? get additionalFields;
  $R call({StaffAdditionalFields? additionalFields, String? id, String? tenantId, String? registerId, String? userId, int? enrollmentDate, int? denrollmentDate, bool? nonRecoverableError, int? rowVersion});
  $R apply(StaffModel Function(StaffModel) transform);
}

class _StaffModelCopyWithImpl<$R> extends BaseCopyWith<StaffModel, $R> implements StaffModelCopyWith<$R> {
  _StaffModelCopyWithImpl(StaffModel value, Then<StaffModel, $R> then) : super(value, then);

  @override StaffAdditionalFieldsCopyWith<$R>? get additionalFields => $value.additionalFields != null ? StaffAdditionalFieldsCopyWith($value.additionalFields!, (v) => call(additionalFields: v)) : null;
  @override $R call({Object? additionalFields = $none, Object? id = $none, Object? tenantId = $none, Object? registerId = $none, Object? userId = $none, Object? enrollmentDate = $none, Object? denrollmentDate = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none}) => $then(StaffModel(additionalFields: or(additionalFields, $value.additionalFields), id: or(id, $value.id), tenantId: or(tenantId, $value.tenantId), registerId: or(registerId, $value.registerId), userId: or(userId, $value.userId), enrollmentDate: or(enrollmentDate, $value.enrollmentDate), denrollmentDate: or(denrollmentDate, $value.denrollmentDate), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion)));
}

class StaffAdditionalFieldsMapper extends BaseMapper<StaffAdditionalFields> {
  StaffAdditionalFieldsMapper._();

  @override Function get decoder => decode;
  StaffAdditionalFields decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  StaffAdditionalFields fromMap(Map<String, dynamic> map) => StaffAdditionalFields();

  @override Function get encoder => (StaffAdditionalFields v) => encode(v);
  dynamic encode(StaffAdditionalFields v) => toMap(v);
  Map<String, dynamic> toMap(StaffAdditionalFields s) => {};

  @override String stringify(StaffAdditionalFields self) => 'StaffAdditionalFields()';
  @override int hash(StaffAdditionalFields self) => 0;
  @override bool equals(StaffAdditionalFields self, StaffAdditionalFields other) => true;

  @override Function get typeFactory => (f) => f<StaffAdditionalFields>();
}

extension StaffAdditionalFieldsMapperExtension  on StaffAdditionalFields {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  StaffAdditionalFieldsCopyWith<StaffAdditionalFields> get copyWith => StaffAdditionalFieldsCopyWith(this, $identity);
}

abstract class StaffAdditionalFieldsCopyWith<$R> {
  factory StaffAdditionalFieldsCopyWith(StaffAdditionalFields value, Then<StaffAdditionalFields, $R> then) = _StaffAdditionalFieldsCopyWithImpl<$R>;
  $R call();
  $R apply(StaffAdditionalFields Function(StaffAdditionalFields) transform);
}

class _StaffAdditionalFieldsCopyWithImpl<$R> extends BaseCopyWith<StaffAdditionalFields, $R> implements StaffAdditionalFieldsCopyWith<$R> {
  _StaffAdditionalFieldsCopyWithImpl(StaffAdditionalFields value, Then<StaffAdditionalFields, $R> then) : super(value, then);

  @override $R call() => $then(StaffAdditionalFields());
}

class AttendanceLogSearchModelMapper extends BaseMapper<AttendanceLogSearchModel> {
  AttendanceLogSearchModelMapper._();

  @override Function get decoder => decode;
  AttendanceLogSearchModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceLogSearchModel fromMap(Map<String, dynamic> map) => AttendanceLogSearchModel.ignoreDeleted(id: Mapper.i.$getOpt(map, 'id'), registerId: Mapper.i.$getOpt(map, 'registerId'));

  @override Function get encoder => (AttendanceLogSearchModel v) => encode(v);
  dynamic encode(AttendanceLogSearchModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendanceLogSearchModel a) => {if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId')};

  @override String stringify(AttendanceLogSearchModel self) => 'AttendanceLogSearchModel(id: ${Mapper.asString(self.id)}, registerId: ${Mapper.asString(self.registerId)})';
  @override int hash(AttendanceLogSearchModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.registerId);
  @override bool equals(AttendanceLogSearchModel self, AttendanceLogSearchModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.registerId, other.registerId);

  @override Function get typeFactory => (f) => f<AttendanceLogSearchModel>();
}

extension AttendanceLogSearchModelMapperExtension  on AttendanceLogSearchModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceLogSearchModelCopyWith<AttendanceLogSearchModel> get copyWith => AttendanceLogSearchModelCopyWith(this, $identity);
}

abstract class AttendanceLogSearchModelCopyWith<$R> {
  factory AttendanceLogSearchModelCopyWith(AttendanceLogSearchModel value, Then<AttendanceLogSearchModel, $R> then) = _AttendanceLogSearchModelCopyWithImpl<$R>;
  $R call({String? id, String? registerId});
  $R apply(AttendanceLogSearchModel Function(AttendanceLogSearchModel) transform);
}

class _AttendanceLogSearchModelCopyWithImpl<$R> extends BaseCopyWith<AttendanceLogSearchModel, $R> implements AttendanceLogSearchModelCopyWith<$R> {
  _AttendanceLogSearchModelCopyWithImpl(AttendanceLogSearchModel value, Then<AttendanceLogSearchModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? registerId = $none}) => $then(AttendanceLogSearchModel.ignoreDeleted(id: or(id, $value.id), registerId: or(registerId, $value.registerId)));
}

class AttendanceLogModelMapper extends BaseMapper<AttendanceLogModel> {
  AttendanceLogModelMapper._();

  @override Function get decoder => decode;
  AttendanceLogModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceLogModel fromMap(Map<String, dynamic> map) => AttendanceLogModel(id: Mapper.i.$getOpt(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerId: Mapper.i.$getOpt(map, 'registerId'), individualId: Mapper.i.$getOpt(map, 'individualId'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'), type: Mapper.i.$getOpt(map, 'type'), time: Mapper.i.$getOpt(map, 'time'), status: Mapper.i.$getOpt(map, 'status'), clientReferenceId: Mapper.i.$getOpt(map, 'clientReferenceId'));

  @override Function get encoder => (AttendanceLogModel v) => encode(v);
  dynamic encode(AttendanceLogModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendanceLogModel a) => {if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId'), if (Mapper.i.$enc(a.individualId, 'individualId') != null) 'individualId': Mapper.i.$enc(a.individualId, 'individualId'), if (Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(a.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(a.rowVersion, 'rowVersion'), if (Mapper.i.$enc(a.type, 'type') != null) 'type': Mapper.i.$enc(a.type, 'type'), if (Mapper.i.$enc(a.time, 'time') != null) 'time': Mapper.i.$enc(a.time, 'time'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status'), if (Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId') != null) 'clientReferenceId': Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId')};

  @override String stringify(AttendanceLogModel self) => 'AttendanceLogModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerId: ${Mapper.asString(self.registerId)}, individualId: ${Mapper.asString(self.individualId)}, time: ${Mapper.asString(self.time)}, nonRecoverableError: ${Mapper.asString(self.nonRecoverableError)}, rowVersion: ${Mapper.asString(self.rowVersion)}, status: ${Mapper.asString(self.status)}, type: ${Mapper.asString(self.type)}, clientReferenceId: ${Mapper.asString(self.clientReferenceId)})';
  @override int hash(AttendanceLogModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerId) ^ Mapper.hash(self.individualId) ^ Mapper.hash(self.time) ^ Mapper.hash(self.nonRecoverableError) ^ Mapper.hash(self.rowVersion) ^ Mapper.hash(self.status) ^ Mapper.hash(self.type) ^ Mapper.hash(self.clientReferenceId);
  @override bool equals(AttendanceLogModel self, AttendanceLogModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerId, other.registerId) && Mapper.isEqual(self.individualId, other.individualId) && Mapper.isEqual(self.time, other.time) && Mapper.isEqual(self.nonRecoverableError, other.nonRecoverableError) && Mapper.isEqual(self.rowVersion, other.rowVersion) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.type, other.type) && Mapper.isEqual(self.clientReferenceId, other.clientReferenceId);

  @override Function get typeFactory => (f) => f<AttendanceLogModel>();
}

extension AttendanceLogModelMapperExtension  on AttendanceLogModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceLogModelCopyWith<AttendanceLogModel> get copyWith => AttendanceLogModelCopyWith(this, $identity);
}

abstract class AttendanceLogModelCopyWith<$R> {
  factory AttendanceLogModelCopyWith(AttendanceLogModel value, Then<AttendanceLogModel, $R> then) = _AttendanceLogModelCopyWithImpl<$R>;
  $R call({String? id, String? tenantId, String? registerId, String? individualId, bool? nonRecoverableError, int? rowVersion, String? type, int? time, String? status, String? clientReferenceId});
  $R apply(AttendanceLogModel Function(AttendanceLogModel) transform);
}

class _AttendanceLogModelCopyWithImpl<$R> extends BaseCopyWith<AttendanceLogModel, $R> implements AttendanceLogModelCopyWith<$R> {
  _AttendanceLogModelCopyWithImpl(AttendanceLogModel value, Then<AttendanceLogModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? tenantId = $none, Object? registerId = $none, Object? individualId = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none, Object? type = $none, Object? time = $none, Object? status = $none, Object? clientReferenceId = $none}) => $then(AttendanceLogModel(id: or(id, $value.id), tenantId: or(tenantId, $value.tenantId), registerId: or(registerId, $value.registerId), individualId: or(individualId, $value.individualId), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion), type: or(type, $value.type), time: or(time, $value.time), status: or(status, $value.status), clientReferenceId: or(clientReferenceId, $value.clientReferenceId)));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
