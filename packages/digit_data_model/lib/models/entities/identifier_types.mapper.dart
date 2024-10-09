// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'identifier_types.dart';

class IdentifierTypesMapper extends EnumMapper<IdentifierTypes> {
  IdentifierTypesMapper._();

  static IdentifierTypesMapper? _instance;
  static IdentifierTypesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierTypesMapper._());
    }
    return _instance!;
  }

  static IdentifierTypes fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  IdentifierTypes decode(dynamic value) {
    switch (value) {
      case "uniqueBeneficiaryID":
        return IdentifierTypes.uniqueBeneficiaryID;
      case "DEFAULT":
        return IdentifierTypes.defaultID;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(IdentifierTypes self) {
    switch (self) {
      case IdentifierTypes.uniqueBeneficiaryID:
        return "uniqueBeneficiaryID";
      case IdentifierTypes.defaultID:
        return "DEFAULT";
    }
  }
}

extension IdentifierTypesMapperExtension on IdentifierTypes {
  dynamic toValue() {
    IdentifierTypesMapper.ensureInitialized();
    return MapperContainer.globals.toValue<IdentifierTypes>(this);
  }
}
