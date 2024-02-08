import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'attendance_log.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AttendanceLogSearchModelMapper._(),
  AttendanceLogModelMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

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
  AttendanceLogModel fromMap(Map<String, dynamic> map) => AttendanceLogModel(id: Mapper.i.$getOpt(map, 'id'), tenantId: Mapper.i.$getOpt(map, 'tenantId'), registerId: Mapper.i.$getOpt(map, 'registerId'), individualId: Mapper.i.$getOpt(map, 'individualId'), type: Mapper.i.$getOpt(map, 'type'), time: Mapper.i.$getOpt(map, 'time'), status: Mapper.i.$getOpt(map, 'status'), clientReferenceId: Mapper.i.$getOpt(map, 'clientReferenceId'), uploadToServer: Mapper.i.$getOpt(map, 'uploadToServer') ?? false, documentIds: Mapper.i.$getOpt(map, 'documentIds') ?? const []);

  @override Function get encoder => (AttendanceLogModel v) => encode(v);
  dynamic encode(AttendanceLogModel v) => toMap(v);
  Map<String, dynamic> toMap(AttendanceLogModel a) => {if (Mapper.i.$enc(a.id, 'id') != null) 'id': Mapper.i.$enc(a.id, 'id'), if (Mapper.i.$enc(a.tenantId, 'tenantId') != null) 'tenantId': Mapper.i.$enc(a.tenantId, 'tenantId'), if (Mapper.i.$enc(a.registerId, 'registerId') != null) 'registerId': Mapper.i.$enc(a.registerId, 'registerId'), if (Mapper.i.$enc(a.individualId, 'individualId') != null) 'individualId': Mapper.i.$enc(a.individualId, 'individualId'), if (Mapper.i.$enc(a.type, 'type') != null) 'type': Mapper.i.$enc(a.type, 'type'), if (Mapper.i.$enc(a.time, 'time') != null) 'time': Mapper.i.$enc(a.time, 'time'), if (Mapper.i.$enc(a.status, 'status') != null) 'status': Mapper.i.$enc(a.status, 'status'), if (Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId') != null) 'clientReferenceId': Mapper.i.$enc(a.clientReferenceId, 'clientReferenceId'), if (Mapper.i.$enc(a.uploadToServer, 'uploadToServer') != null) 'uploadToServer': Mapper.i.$enc(a.uploadToServer, 'uploadToServer'), if (Mapper.i.$enc(a.documentIds, 'documentIds') != null) 'documentIds': Mapper.i.$enc(a.documentIds, 'documentIds')};

  @override String stringify(AttendanceLogModel self) => 'AttendanceLogModel(id: ${Mapper.asString(self.id)}, tenantId: ${Mapper.asString(self.tenantId)}, registerId: ${Mapper.asString(self.registerId)}, individualId: ${Mapper.asString(self.individualId)}, time: ${Mapper.asString(self.time)}, status: ${Mapper.asString(self.status)}, type: ${Mapper.asString(self.type)}, clientReferenceId: ${Mapper.asString(self.clientReferenceId)}, uploadToServer: ${Mapper.asString(self.uploadToServer)}, documentIds: ${Mapper.asString(self.documentIds)})';
  @override int hash(AttendanceLogModel self) => Mapper.hash(self.id) ^ Mapper.hash(self.tenantId) ^ Mapper.hash(self.registerId) ^ Mapper.hash(self.individualId) ^ Mapper.hash(self.time) ^ Mapper.hash(self.status) ^ Mapper.hash(self.type) ^ Mapper.hash(self.clientReferenceId) ^ Mapper.hash(self.uploadToServer) ^ Mapper.hash(self.documentIds);
  @override bool equals(AttendanceLogModel self, AttendanceLogModel other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.tenantId, other.tenantId) && Mapper.isEqual(self.registerId, other.registerId) && Mapper.isEqual(self.individualId, other.individualId) && Mapper.isEqual(self.time, other.time) && Mapper.isEqual(self.status, other.status) && Mapper.isEqual(self.type, other.type) && Mapper.isEqual(self.clientReferenceId, other.clientReferenceId) && Mapper.isEqual(self.uploadToServer, other.uploadToServer) && Mapper.isEqual(self.documentIds, other.documentIds);

  @override Function get typeFactory => (f) => f<AttendanceLogModel>();
}

extension AttendanceLogModelMapperExtension  on AttendanceLogModel {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AttendanceLogModelCopyWith<AttendanceLogModel> get copyWith => AttendanceLogModelCopyWith(this, $identity);
}

abstract class AttendanceLogModelCopyWith<$R> {
  factory AttendanceLogModelCopyWith(AttendanceLogModel value, Then<AttendanceLogModel, $R> then) = _AttendanceLogModelCopyWithImpl<$R>;
  $R call({String? id, String? tenantId, String? registerId, String? individualId, String? type, int? time, String? status, String? clientReferenceId, bool? uploadToServer, List<String>? documentIds});
  $R apply(AttendanceLogModel Function(AttendanceLogModel) transform);
}

class _AttendanceLogModelCopyWithImpl<$R> extends BaseCopyWith<AttendanceLogModel, $R> implements AttendanceLogModelCopyWith<$R> {
  _AttendanceLogModelCopyWithImpl(AttendanceLogModel value, Then<AttendanceLogModel, $R> then) : super(value, then);

  @override $R call({Object? id = $none, Object? tenantId = $none, Object? registerId = $none, Object? individualId = $none, Object? type = $none, Object? time = $none, Object? status = $none, Object? clientReferenceId = $none, Object? uploadToServer = $none, Object? documentIds = $none}) => $then(AttendanceLogModel(id: or(id, $value.id), tenantId: or(tenantId, $value.tenantId), registerId: or(registerId, $value.registerId), individualId: or(individualId, $value.individualId), type: or(type, $value.type), time: or(time, $value.time), status: or(status, $value.status), clientReferenceId: or(clientReferenceId, $value.clientReferenceId), uploadToServer: or(uploadToServer, $value.uploadToServer), documentIds: or(documentIds, $value.documentIds)));
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
