// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reg_form_validations_type.dart';

class RegFormValidationsMapper extends EnumMapper<RegFormValidations> {
  RegFormValidationsMapper._();

  static RegFormValidationsMapper? _instance;
  static RegFormValidationsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegFormValidationsMapper._());
    }
    return _instance!;
  }

  static RegFormValidations fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RegFormValidations decode(dynamic value) {
    switch (value) {
      case "required":
        return RegFormValidations.required;
      case "min":
        return RegFormValidations.min;
      case "max":
        return RegFormValidations.max;
      case "maxLength":
        return RegFormValidations.maxLength;
      case "minLength":
        return RegFormValidations.minLength;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RegFormValidations self) {
    switch (self) {
      case RegFormValidations.required:
        return "required";
      case RegFormValidations.min:
        return "min";
      case RegFormValidations.max:
        return "max";
      case RegFormValidations.maxLength:
        return "maxLength";
      case RegFormValidations.minLength:
        return "minLength";
    }
  }
}

extension RegFormValidationsMapperExtension on RegFormValidations {
  dynamic toValue() {
    RegFormValidationsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RegFormValidations>(this);
  }
}
