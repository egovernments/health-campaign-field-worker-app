// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mdms_module_enums.dart';

class ModuleEnumsMapper extends EnumMapper<ModuleEnums> {
  ModuleEnumsMapper._();

  static ModuleEnumsMapper? _instance;
  static ModuleEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModuleEnumsMapper._());
    }
    return _instance!;
  }

  static ModuleEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ModuleEnums decode(dynamic value) {
    switch (value) {
      case "common-masters":
        return ModuleEnums.commonMasters;
      case "HCM":
        return ModuleEnums.hcm;
      case "HCM-SERVICE-REGISTRY":
        return ModuleEnums.serviceRegistry;
      case "module-version":
        return ModuleEnums.moduleVersion;
      case "RAINMAKER-PGR":
        return ModuleEnums.rainmakerPgr;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ModuleEnums self) {
    switch (self) {
      case ModuleEnums.commonMasters:
        return "common-masters";
      case ModuleEnums.hcm:
        return "HCM";
      case ModuleEnums.serviceRegistry:
        return "HCM-SERVICE-REGISTRY";
      case ModuleEnums.moduleVersion:
        return "module-version";
      case ModuleEnums.rainmakerPgr:
        return "RAINMAKER-PGR";
    }
  }
}

extension ModuleEnumsMapperExtension on ModuleEnums {
  dynamic toValue() {
    ModuleEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ModuleEnums>(this);
  }
}
