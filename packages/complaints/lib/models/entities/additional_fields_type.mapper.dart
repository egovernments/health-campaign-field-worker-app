// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'additional_fields_type.dart';

class AdditionalFieldsTypeMapper extends EnumMapper<AdditionalFieldsType> {
  AdditionalFieldsTypeMapper._();

  static AdditionalFieldsTypeMapper? _instance;
  static AdditionalFieldsTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldsTypeMapper._());
    }
    return _instance!;
  }

  static AdditionalFieldsType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdditionalFieldsType decode(dynamic value) {
    switch (value) {
      case "mobile":
        return AdditionalFieldsType.mobile;
      case "EMPLOYEE":
        return AdditionalFieldsType.employee;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdditionalFieldsType self) {
    switch (self) {
      case AdditionalFieldsType.mobile:
        return "mobile";
      case AdditionalFieldsType.employee:
        return "EMPLOYEE";
    }
  }
}

extension AdditionalFieldsTypeMapperExtension on AdditionalFieldsType {
  dynamic toValue() {
    AdditionalFieldsTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdditionalFieldsType>(this);
  }
}
