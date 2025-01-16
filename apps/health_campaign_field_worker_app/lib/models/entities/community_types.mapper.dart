// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'community_types.dart';

class CommunityTypesMapper extends EnumMapper<CommunityTypes> {
  CommunityTypesMapper._();

  static CommunityTypesMapper? _instance;
  static CommunityTypesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommunityTypesMapper._());
    }
    return _instance!;
  }

  static CommunityTypes fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CommunityTypes decode(dynamic value) {
    switch (value) {
      case "refugee_camps":
        return CommunityTypes.refugeeCamps;
      case "special_groups":
        return CommunityTypes.specialGroups;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CommunityTypes self) {
    switch (self) {
      case CommunityTypes.refugeeCamps:
        return "refugee_camps";
      case CommunityTypes.specialGroups:
        return "special_groups";
    }
  }
}

extension CommunityTypesMapperExtension on CommunityTypes {
  dynamic toValue() {
    CommunityTypesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CommunityTypes>(this);
  }
}
