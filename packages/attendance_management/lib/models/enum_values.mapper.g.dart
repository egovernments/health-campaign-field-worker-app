import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'enum_values.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  // enum mappers
  EnumValuesMapper._(),
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===




// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class EnumValuesMapper extends EnumMapper<EnumValues> {
  EnumValuesMapper._();

  @override  EnumValues decode(dynamic value) {
    switch (value) {
      case "campaignName": return EnumValues.campaignName;
      case "eventType": return EnumValues.eventType;
      case "Draft": return EnumValues.draft;
      case "Submit": return EnumValues.submit;
      case "sessions": return EnumValues.sessions;
      case "dateOfDelivery": return EnumValues.dateOfDelivery;
      case "entryTime": return EnumValues.entryTime;
      case "exitTime": return EnumValues.exitTime;
      case "ENTRY": return EnumValues.entry;
      case "EXIT": return EnumValues.exit;
      case "ACTIVE": return EnumValues.active;
      case "INACTIVE": return EnumValues.inactive;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(EnumValues self) {
    switch (self) {
      case EnumValues.campaignName: return "campaignName";
      case EnumValues.eventType: return "eventType";
      case EnumValues.draft: return "Draft";
      case EnumValues.submit: return "Submit";
      case EnumValues.sessions: return "sessions";
      case EnumValues.dateOfDelivery: return "dateOfDelivery";
      case EnumValues.entryTime: return "entryTime";
      case EnumValues.exitTime: return "exitTime";
      case EnumValues.entry: return "ENTRY";
      case EnumValues.exit: return "EXIT";
      case EnumValues.active: return "ACTIVE";
      case EnumValues.inactive: return "INACTIVE";
    }
  }
}

extension EnumValuesMapperExtension on EnumValues {
  dynamic toValue() => Mapper.toValue(this);
}


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
