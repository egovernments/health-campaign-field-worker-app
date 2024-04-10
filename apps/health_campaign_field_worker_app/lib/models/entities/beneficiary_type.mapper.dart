// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'beneficiary_type.dart';

class BeneficiaryTypeMapper extends EnumMapper<BeneficiaryType> {
  BeneficiaryTypeMapper._();

  static BeneficiaryTypeMapper? _instance;
  static BeneficiaryTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BeneficiaryTypeMapper._());
    }
    return _instance!;
  }

  static BeneficiaryType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BeneficiaryType decode(dynamic value) {
    switch (value) {
      case "INDIVIDUAL":
        return BeneficiaryType.individual;
      case "HOUSEHOLD":
        return BeneficiaryType.household;
      case "PRODUCT":
        return BeneficiaryType.product;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BeneficiaryType self) {
    switch (self) {
      case BeneficiaryType.individual:
        return "INDIVIDUAL";
      case BeneficiaryType.household:
        return "HOUSEHOLD";
      case BeneficiaryType.product:
        return "PRODUCT";
    }
  }
}

extension BeneficiaryTypeMapperExtension on BeneficiaryType {
  dynamic toValue() {
    BeneficiaryTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BeneficiaryType>(this);
  }
}
