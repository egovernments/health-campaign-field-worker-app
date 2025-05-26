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
  @MappableValue("3-11MONTH")
  individual1,
  @MappableValue("12-59MONTH")
  individual2,
  @MappableValue("1-11MONTH")
  individual3,
  @MappableValue("6-11MONTH")
  individual4,
  @MappableValue("SPAQ1")
  spaq1,
  @MappableValue("SPAQ2")
  spaq2,
  @MappableValue("SPAQ-1")
  spaq3,
  @MappableValue("SPAQ-2")
  spaq4,
  @MappableValue("AZM")
  azm,
  @MappableValue("VAS-RED")
  vasRed,
  @MappableValue("VAS-BLUE")
  vasBlue,
  ;
}
