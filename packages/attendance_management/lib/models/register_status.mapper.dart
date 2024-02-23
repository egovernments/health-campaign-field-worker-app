// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_status.dart';

class RegisterStatusMapper extends EnumMapper<RegisterStatus> {
  RegisterStatusMapper._();

  static RegisterStatusMapper? _instance;
  static RegisterStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterStatusMapper._());
    }
    return _instance!;
  }

  static RegisterStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RegisterStatus decode(dynamic value) {
    switch (value) {
      case "ACTIVE":
        return RegisterStatus.active;
      case "INACTIVE":
        return RegisterStatus.inactive;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RegisterStatus self) {
    switch (self) {
      case RegisterStatus.active:
        return "ACTIVE";
      case RegisterStatus.inactive:
        return "INACTIVE";
    }
  }
}

extension RegisterStatusMapperExtension on RegisterStatus {
  dynamic toValue() {
    RegisterStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RegisterStatus>(this);
  }
}
