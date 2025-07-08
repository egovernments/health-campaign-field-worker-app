// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_values.dart';

class EnumValuesMapper extends EnumMapper<EnumValues> {
  EnumValuesMapper._();

  static EnumValuesMapper? _instance;
  static EnumValuesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnumValuesMapper._());
    }
    return _instance!;
  }

  static EnumValues fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EnumValues decode(dynamic value) {
    switch (value) {
      case "campaignName":
        return EnumValues.campaignName;
      case "eventType":
        return EnumValues.eventType;
      case "Draft":
        return EnumValues.draft;
      case "Submit":
        return EnumValues.submit;
      case "sessions":
        return EnumValues.sessions;
      case "dateOfDelivery":
        return EnumValues.dateOfDelivery;
      case "entryTime":
        return EnumValues.entryTime;
      case "exitTime":
        return EnumValues.exitTime;
      case "ENTRY":
        return EnumValues.entry;
      case "EXIT":
        return EnumValues.exit;
      case "ACTIVE":
        return EnumValues.active;
      case "INACTIVE":
        return EnumValues.inactive;
      case "latitude":
        return EnumValues.latitude;
      case "longitude":
        return EnumValues.longitude;
      case "boundaryCode":
        return EnumValues.boundaryCode;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(EnumValues self) {
    switch (self) {
      case EnumValues.campaignName:
        return "campaignName";
      case EnumValues.eventType:
        return "eventType";
      case EnumValues.draft:
        return "Draft";
      case EnumValues.submit:
        return "Submit";
      case EnumValues.sessions:
        return "sessions";
      case EnumValues.dateOfDelivery:
        return "dateOfDelivery";
      case EnumValues.entryTime:
        return "entryTime";
      case EnumValues.exitTime:
        return "exitTime";
      case EnumValues.entry:
        return "ENTRY";
      case EnumValues.exit:
        return "EXIT";
      case EnumValues.active:
        return "ACTIVE";
      case EnumValues.inactive:
        return "INACTIVE";
      case EnumValues.latitude:
        return "latitude";
      case EnumValues.longitude:
        return "longitude";
      case EnumValues.boundaryCode:
        return "boundaryCode";
    }
  }
}

extension EnumValuesMapperExtension on EnumValues {
  dynamic toValue() {
    EnumValuesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<EnumValues>(this);
  }
}

class AttendanceSortTypeMapper extends EnumMapper<AttendanceSortType> {
  AttendanceSortTypeMapper._();

  static AttendanceSortTypeMapper? _instance;
  static AttendanceSortTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttendanceSortTypeMapper._());
    }
    return _instance!;
  }

  static AttendanceSortType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AttendanceSortType decode(dynamic value) {
    switch (value) {
      case "none":
        return AttendanceSortType.none;
      case "presentFirst":
        return AttendanceSortType.presentFirst;
      case "absentFirst":
        return AttendanceSortType.absentFirst;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AttendanceSortType self) {
    switch (self) {
      case AttendanceSortType.none:
        return "none";
      case AttendanceSortType.presentFirst:
        return "presentFirst";
      case AttendanceSortType.absentFirst:
        return "absentFirst";
    }
  }
}

extension AttendanceSortTypeMapperExtension on AttendanceSortType {
  dynamic toValue() {
    AttendanceSortTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AttendanceSortType>(this);
  }
}
