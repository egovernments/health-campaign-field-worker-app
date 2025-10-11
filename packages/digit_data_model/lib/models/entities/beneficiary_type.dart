// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'beneficiary_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum BeneficiaryType {
  @MappableValue("INDIVIDUAL")
  individual,
  @MappableValue("HOUSEHOLD")
  household,
  @MappableValue("PRODUCT")
  product,
  @MappableValue("INDIVIDUAL_BCG_0_TO_18")
  individualBcg0To18,
  @MappableValue("INDIVIDUAL_OTHER_VACCINE_0_TO_18")
  individualOtherVaccine0To18,
  @MappableValue("VACCINE_BCG")
  vaccineBcg,
  @MappableValue("VACCINE_VPO")
  vaccineVpo,
  @MappableValue("VACCINE_HPB")
  vaccineHpb,
  @MappableValue("VACCINE_PENTA")
  vaccinePenta,
  @MappableValue("VACCINE_ROTA")
  vaccineRota,
  @MappableValue("VACCINE_PNEUMO")
  vaccinePneumo,
  @MappableValue("VACCINE_VPI")
  vaccineVpi,
  @MappableValue("VACCINE_RR")
  vaccineRr,
  @MappableValue("VACCINE_VAA")
  vaccineVaa,
  @MappableValue("VACCINE_MEN_A")
  vaccineMenA,
  @MappableValue("VACCINE_VIT_A")
  vaccineVitA,
  @MappableValue("VACCINE_HPV")
  vaccineHpv,
  ;
}
