// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'household_type.dart';

class HouseholdTypeMapper extends EnumMapper<HouseholdType> {
  HouseholdTypeMapper._();

  static HouseholdTypeMapper? _instance;
  static HouseholdTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HouseholdTypeMapper._());
    }
    return _instance!;
  }

  static HouseholdType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  HouseholdType decode(dynamic value) {
    switch (value) {
      case "FAMILY":
        return HouseholdType.family;
      case "COMMUNITY":
        return HouseholdType.community;
      case "OTHER":
        return HouseholdType.other;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(HouseholdType self) {
    switch (self) {
      case HouseholdType.family:
        return "FAMILY";
      case HouseholdType.community:
        return "COMMUNITY";
      case HouseholdType.other:
        return "OTHER";
    }
  }
}

extension HouseholdTypeMapperExtension on HouseholdType {
  dynamic toValue() {
    HouseholdTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<HouseholdType>(this);
  }
}
