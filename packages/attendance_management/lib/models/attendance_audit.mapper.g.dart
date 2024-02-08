import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'attendance_audit.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AttendanceAuditDetailsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AttendanceAuditDetailsMapper extends BaseMapper<AttendanceAuditDetails> {
  AttendanceAuditDetailsMapper._();

  @override Function get decoder => decode;
  AttendanceAuditDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  AttendanceAuditDetails fromMap(Map<String, dynamic> map) => AttendanceAuditDetails(createdBy: Mapper.i.$get(map, 'createdBy'), createdTime: Mapper.i.$get(map, 'createdTime'), lastModifiedBy: Mapper.i.$getOpt(map, 'lastModifiedBy'), lastModifiedTime: Mapper.i.$getOpt(map, 'lastModifiedTime'));

  @override Function get encoder => (AttendanceAuditDetails v) => encode(v);
  dynamic encode(AttendanceAuditDetails v) => toMap(v);
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
