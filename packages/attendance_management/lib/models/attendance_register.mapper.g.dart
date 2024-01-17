import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'attendance_register.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AttendanceRegisterSearchModelMapper._(),
  AttendancePackageRegisterModelMapper._(),
  AttendanceRegisterAdditionalFieldsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AttendanceRegisterSearchModelMapper extends BaseMapper<AttendanceRegisterSearchModel> {
  AttendanceRegisterSearchModelMapper._();

  @override Function get decoder => decode;
  AttendanceRegisterSearchModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceRegisterSearchModel fromMap(Map<String, dynamic> map) => AttendanceRegisterSearchModel.ignoreDeleted(id: Mapper.i.$getOpt(map, 'id'), clientReferenceId: Mapper.i.$getOpt(map, 'clientReferenceId'));

  @override Function get encoder => (AttendanceRegisterSearchModel v) => encode(v);
  dynamic encode(AttendanceRegisterSearchModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendanceRegisterSearchModel a) => {if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId') != null) 'clientReferenceId': Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId')};

  @override String stringify(AttendanceRegisterSearchModel self) => 'AttendanceRegisterSearchModel(id: ${Mapper.asString(self.id)}, clientReferenceId: ${Mapper.asString(self.clientReferenceId)})';
  @override int hash(AttendanceRegisterSearchModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.clientReferenceId);
  @override bool equals(AttendanceRegisterSearchModel self, AttendanceRegisterSearchModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.clientReferenceId, other.clientReferenceId);

  @override Function get typeFactory => (f) => f<AttendanceRegisterSearchModel>();
}

extension AttendanceRegisterSearchModelMapperExtension  on AttendanceRegisterSearchModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceRegisterSearchModelCopyWith<AttendanceRegisterSearchModel> get copyWith => AttendanceRegisterSearchModelCopyWith(this, $identity);
}

abstract class AttendanceRegisterSearchModelCopyWith<$R> {
  factory AttendanceRegisterSearchModelCopyWith(AttendanceRegisterSearchModel value, Then<AttendanceRegisterSearchModel, $R> then) = _AttendanceRegisterSearchModelCopyWithImpl<$R>;
  $R call({String? id, List<String>? clientReferenceId});
  $R apply(AttendanceRegisterSearchModel Function(AttendanceRegisterSearchModel) transform);
}

class _AttendanceRegisterSearchModelCopyWithImpl<$R> extends BaseCopyWith<AttendanceRegisterSearchModel, $R> implements AttendanceRegisterSearchModelCopyWith<$R> {
  _AttendanceRegisterSearchModelCopyWithImpl(AttendanceRegisterSearchModel value, Then<AttendanceRegisterSearchModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? clientReferenceId = $none}) => $then(AttendanceRegisterSearchModel.ignoreDeleted(id: or(id, $value.id), clientReferenceId: or(clientReferenceId, $value.clientReferenceId)));
}

class AttendancePackageRegisterModelMapper extends BaseMapper<AttendancePackageRegisterModel> {
  AttendancePackageRegisterModelMapper._();

  @override Function get decoder => decode;
  AttendancePackageRegisterModel decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendancePackageRegisterModel fromMap(Map<String, dynamic> map) => AttendancePackageRegisterModel(additionalFields: Mapper.i.$getOpt(map, 'additionalFields'), id: Mapper.i.$get(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerNumber: Mapper.i.$getOpt(map, 'registerNumber'), name: Mapper.i.$getOpt(map, 'name'), referenceId: Mapper.i.$getOpt(map, 'referenceId'), serviceCode: Mapper.i.$getOpt(map, 'serviceCode'), status: Mapper.i.$getOpt(map, 'status'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'), startDate: Mapper.i.$getOpt(map, 'startDate'), endDate: Mapper.i.$getOpt(map, 'endDate'));

  @override Function get encoder => (AttendancePackageRegisterModel v) => encode(v);
  dynamic encode(AttendancePackageRegisterModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendancePackageRegisterModel a) => {if (Mapper.i.$enc(a.additionalFields, 'additionalFields') != null) 'additionalFields': Mapper.i.$enc(a.additionalFields, 'additionalFields'), 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerNumber, 'registerNumber') != null) 'registerNumber': Mapper.i.$enc(a.registerNumber, 'registerNumber'), if (Mapper.i.$enc(a.name, 'name') != null) 'name': Mapper.i.$enc(a.name, 'name'), if (Mapper.i.$enc(a.referenceId, 'referenceId') != null) 'referenceId': Mapper.i.$enc(a.referenceId, 'referenceId'), if (Mapper.i.$enc(a.serviceCode, 'serviceCode') != null) 'serviceCode': Mapper.i.$enc(a.serviceCode, 'serviceCode'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status'), if (Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(a.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(a.rowVersion, 'rowVersion'), if (Mapper.i.$enc(a.startDate, 'startDate') != null) 'startDate': Mapper.i.$enc(a.startDate, 'startDate'), if (Mapper.i.$enc(a.endDate, 'endDate') != null) 'endDate': Mapper.i.$enc(a.endDate, 'endDate')};

  @override String stringify(AttendancePackageRegisterModel self) => 'AttendancePackageRegisterModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerNumber: ${Mapper.asString(self.registerNumber)}, name: ${Mapper.asString(self.name)}, referenceId: ${Mapper.asString(self.referenceId)}, serviceCode: ${Mapper.asString(self.serviceCode)}, status: ${Mapper.asString(self.status)}, nonRecoverableError: ${Mapper.asString(self.nonRecoverableError)}, rowVersion: ${Mapper.asString(self.rowVersion)}, startDateTime: ${Mapper.asString(self.startDateTime)}, endDateTime: ${Mapper.asString(self.endDateTime)}, additionalFields: ${Mapper.asString(self.additionalFields)})';
  @override int hash(AttendancePackageRegisterModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerNumber) ^ Mapper.hash(self.name) ^ Mapper.hash(self.referenceId) ^ Mapper.hash(self.serviceCode) ^ Mapper.hash(self.status) ^ Mapper.hash(self.nonRecoverableError) ^ Mapper.hash(self.rowVersion) ^ Mapper.hash(self.startDateTime) ^ Mapper.hash(self.endDateTime) ^ Mapper.hash(self.additionalFields);
  @override bool equals(AttendancePackageRegisterModel self, AttendancePackageRegisterModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerNumber, other.registerNumber) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.referenceId, other.referenceId) && Mapper.isEqual(self.serviceCode, other.serviceCode) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.nonRecoverableError, other.nonRecoverableError) && Mapper.isEqual(self.rowVersion, other.rowVersion) && Mapper.isEqual(self.startDateTime, other.startDateTime) && Mapper.isEqual(self.endDateTime, other.endDateTime) && Mapper.isEqual(self.additionalFields, other.additionalFields);

  @override Function get typeFactory => (f) => f<AttendancePackageRegisterModel>();
}

extension AttendancePackageRegisterModelMapperExtension  on AttendancePackageRegisterModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendancePackageRegisterModelCopyWith<AttendancePackageRegisterModel> get copyWith => AttendancePackageRegisterModelCopyWith(this, $identity);
}

abstract class AttendancePackageRegisterModelCopyWith<$R> {
  factory AttendancePackageRegisterModelCopyWith(AttendancePackageRegisterModel value, Then<AttendancePackageRegisterModel, $R> then) = _AttendancePackageRegisterModelCopyWithImpl<$R>;
  AttendanceRegisterAdditionalFieldsCopyWith<$R>? get additionalFields;
  $R call({AttendanceRegisterAdditionalFields? additionalFields, String? id, String? tenantId, String? registerNumber, String? name, String? referenceId, String? serviceCode, String? status, bool? nonRecoverableError, int? rowVersion, int? startDate, int? endDate});
  $R apply(AttendancePackageRegisterModel Function(AttendancePackageRegisterModel) transform);
}

class _AttendancePackageRegisterModelCopyWithImpl<$R> extends BaseCopyWith<AttendancePackageRegisterModel, $R> implements AttendancePackageRegisterModelCopyWith<$R> {
  _AttendancePackageRegisterModelCopyWithImpl(AttendancePackageRegisterModel value, Then<AttendancePackageRegisterModel, $R> then) : super(value, then);

  @override AttendanceRegisterAdditionalFieldsCopyWith<$R>? get additionalFields => $value.additionalFields != null ? AttendanceRegisterAdditionalFieldsCopyWith($value.additionalFields!, (v) => call(additionalFields: v)) : null;
  @override $R call({Object? additionalFields = $none, String? id, Object? tenantId = $none, Object? registerNumber = $none, Object? name = $none, Object? referenceId = $none, Object? serviceCode = $none, Object? status = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none, Object? startDate = $none, Object? endDate = $none}) => $then(AttendancePackageRegisterModel(additionalFields: or(additionalFields, $value.additionalFields), id: id ?? $value.id, tenantId: or(tenantId, $value.tenantId), registerNumber: or(registerNumber, $value.registerNumber), name: or(name, $value.name), referenceId: or(referenceId, $value.referenceId), serviceCode: or(serviceCode, $value.serviceCode), status: or(status, $value.status), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion), startDate: or(startDate, $value.startDate), endDate: or(endDate, $value.endDate)));
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
