// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      case "INDIVIDUAL_BCG_0_TO_18":
        return BeneficiaryType.individualBcg0To18;
      case "INDIVIDUAL_OTHER_VACCINE_0_TO_18":
        return BeneficiaryType.individualOtherVaccine0To18;
      case "VACCINE_BCG":
        return BeneficiaryType.vaccineBcg;
      case "VACCINE_VPO":
        return BeneficiaryType.vaccineVpo;
      case "VACCINE_HPB":
        return BeneficiaryType.vaccineHpb;
      case "VACCINE_PENTA":
        return BeneficiaryType.vaccinePenta;
      case "VACCINE_ROTA":
        return BeneficiaryType.vaccineRota;
      case "VACCINE_PNEUMO":
        return BeneficiaryType.vaccinePneumo;
      case "VACCINE_VPI":
        return BeneficiaryType.vaccineVpi;
      case "VACCINE_RR":
        return BeneficiaryType.vaccineRr;
      case "VACCINE_VAA":
        return BeneficiaryType.vaccineVaa;
      case "VACCINE_MEN_A":
        return BeneficiaryType.vaccineMenA;
      case "VACCINE_VIT_A":
        return BeneficiaryType.vaccineVitA;
      case "VACCINE_HPV":
        return BeneficiaryType.vaccineHpv;
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
      case BeneficiaryType.individualBcg0To18:
        return "INDIVIDUAL_BCG_0_TO_18";
      case BeneficiaryType.individualOtherVaccine0To18:
        return "INDIVIDUAL_OTHER_VACCINE_0_TO_18";
      case BeneficiaryType.vaccineBcg:
        return "VACCINE_BCG";
      case BeneficiaryType.vaccineVpo:
        return "VACCINE_VPO";
      case BeneficiaryType.vaccineHpb:
        return "VACCINE_HPB";
      case BeneficiaryType.vaccinePenta:
        return "VACCINE_PENTA";
      case BeneficiaryType.vaccineRota:
        return "VACCINE_ROTA";
      case BeneficiaryType.vaccinePneumo:
        return "VACCINE_PNEUMO";
      case BeneficiaryType.vaccineVpi:
        return "VACCINE_VPI";
      case BeneficiaryType.vaccineRr:
        return "VACCINE_RR";
      case BeneficiaryType.vaccineVaa:
        return "VACCINE_VAA";
      case BeneficiaryType.vaccineMenA:
        return "VACCINE_MEN_A";
      case BeneficiaryType.vaccineVitA:
        return "VACCINE_VIT_A";
      case BeneficiaryType.vaccineHpv:
        return "VACCINE_HPV";
    }
  }
}

extension BeneficiaryTypeMapperExtension on BeneficiaryType {
  dynamic toValue() {
    BeneficiaryTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BeneficiaryType>(this);
  }
}
