import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'staff.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  StaffSearchModelMapper._(),
  StaffModelMapper._(),
  StaffAdditionalFieldsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

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
