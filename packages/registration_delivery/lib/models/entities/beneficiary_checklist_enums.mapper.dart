// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'beneficiary_checklist_enums.dart';

class BeneficiaryChecklistEnumsMapper
    extends EnumMapper<BeneficiaryChecklistEnums> {
  BeneficiaryChecklistEnumsMapper._();

  static BeneficiaryChecklistEnumsMapper? _instance;
  static BeneficiaryChecklistEnumsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = BeneficiaryChecklistEnumsMapper._());
    }
    return _instance!;
  }

  static BeneficiaryChecklistEnums fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BeneficiaryChecklistEnums decode(dynamic value) {
    switch (value) {
      case "IEC":
        return BeneficiaryChecklistEnums.iec;
      case "ELIGIBILITY":
        return BeneficiaryChecklistEnums.eligibility;
      case "HOUSEHOLD":
        return BeneficiaryChecklistEnums.household;
      case "INDIVIDUAL":
        return BeneficiaryChecklistEnums.individual;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BeneficiaryChecklistEnums self) {
    switch (self) {
      case BeneficiaryChecklistEnums.iec:
        return "IEC";
      case BeneficiaryChecklistEnums.eligibility:
        return "ELIGIBILITY";
      case BeneficiaryChecklistEnums.household:
        return "HOUSEHOLD";
      case BeneficiaryChecklistEnums.individual:
        return "INDIVIDUAL";
    }
  }
}

extension BeneficiaryChecklistEnumsMapperExtension
    on BeneficiaryChecklistEnums {
  dynamic toValue() {
    BeneficiaryChecklistEnumsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BeneficiaryChecklistEnums>(this);
  }
}
