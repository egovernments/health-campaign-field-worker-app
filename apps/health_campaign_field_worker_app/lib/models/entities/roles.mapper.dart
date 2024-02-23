// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'roles.dart';

class RolesMapper extends EnumMapper<Roles> {
  RolesMapper._();

  static RolesMapper? _instance;
  static RolesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RolesMapper._());
    }
    return _instance!;
  }

  static Roles fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Roles decode(dynamic value) {
    switch (value) {
      case "WAREHOUSE_MANAGER":
        return Roles.warehouseManager;
      case "DISTRIBUTOR":
        return Roles.distributor;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Roles self) {
    switch (self) {
      case Roles.warehouseManager:
        return "WAREHOUSE_MANAGER";
      case Roles.distributor:
        return "DISTRIBUTOR";
    }
  }
}

extension RolesMapperExtension on Roles {
  dynamic toValue() {
    RolesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Roles>(this);
  }
}
