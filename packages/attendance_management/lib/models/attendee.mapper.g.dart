import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'attendee.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AttendeeSearchModelMapper._(),
  AttendeeModelMapper._(),
  AttendeeAdditionalFieldsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

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
  AttendeeModel fromMap(Map<String, dynamic> map) => AttendeeModel(additionalFields: Mapper.i.$getOpt(map, 'additionalFields'), id: Mapper.i.$get(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerId: Mapper.i.$getOpt(map, 'registerId'), individualId: Mapper.i.$getOpt(map, 'individualId'), enrollmentDate: Mapper.i.$getOpt(map, 'enrollmentDate'), denrollmentDate: Mapper.i.$getOpt(map, 'denrollmentDate'), nonRecoverableError: Mapper.i.$getOpt(map, 'nonRecoverableError') ?? false, rowVersion: Mapper.i.$getOpt(map, 'rowVersion'), name: Mapper.i.$getOpt(map, 'name'), identifierID: Mapper.i.$getOpt(map, 'identifierID'), individualNumber: Mapper.i.$getOpt(map, 'individualNumber'), status: Mapper.i.$getOpt(map, 'status') ?? -1);

  @override Function get encoder => (AttendeeModel v) => encode(v);
  dynamic encode(AttendeeModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendeeModel a) => {if (Mapper.i.$enc(a.additionalFields, 'additionalFields') != null) 'additionalFields': Mapper.i.$enc(a.additionalFields, 'additionalFields'), 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId'), if (Mapper.i.$enc(a.individualId, 'individualId') != null) 'individualId': Mapper.i.$enc(a.individualId, 'individualId'), if (Mapper.i.$enc(a.enrollmentDate, 'enrollmentDate') != null) 'enrollmentDate': Mapper.i.$enc(a.enrollmentDate, 'enrollmentDate'), if (Mapper.i.$enc(a.denrollmentDate, 'denrollmentDate') != null) 'denrollmentDate': Mapper.i.$enc(a.denrollmentDate, 'denrollmentDate'), if (Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError') != null) 'nonRecoverableError': Mapper.i.$enc(a.nonRecoverableError, 'nonRecoverableError'), if (Mapper.i.$enc(a.rowVersion, 'rowVersion') != null) 'rowVersion': Mapper.i.$enc(a.rowVersion, 'rowVersion'), if (Mapper.i.$enc(a.name, 'name') != null) 'name': Mapper.i.$enc(a.name, 'name'), if (Mapper.i.$enc(a.identifierID, 'identifierID') != null) 'identifierID': Mapper.i.$enc(a.identifierID, 'identifierID'), if (Mapper.i.$enc(a.individualNumber, 'individualNumber') != null) 'individualNumber': Mapper.i.$enc(a.individualNumber, 'individualNumber'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status')};

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
  @override $R call({Object? additionalFields = $none, String? id, Object? tenantId = $none, Object? registerId = $none, Object? individualId = $none, Object? enrollmentDate = $none, Object? denrollmentDate = $none, Object? nonRecoverableError = $none, Object? rowVersion = $none, Object? name = $none, Object? identifierID = $none, Object? individualNumber = $none, Object? status = $none}) => $then(AttendeeModel(additionalFields: or(additionalFields, $value.additionalFields), id: id ?? $value.id, tenantId: or(tenantId, $value.tenantId), registerId: or(registerId, $value.registerId), individualId: or(individualId, $value.individualId), enrollmentDate: or(enrollmentDate, $value.enrollmentDate), denrollmentDate: or(denrollmentDate, $value.denrollmentDate), nonRecoverableError: or(nonRecoverableError, $value.nonRecoverableError), rowVersion: or(rowVersion, $value.rowVersion), name: or(name, $value.name), identifierID: or(identifierID, $value.identifierID), individualNumber: or(individualNumber, $value.individualNumber), status: or(status, $value.status)));
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
