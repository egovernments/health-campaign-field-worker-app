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
  @MappableValue("SPECIAL_GROUPS")
  specialGroups,
  @MappableValue("REFUGEE_CAMPS")
  refugeeCamps,
  @MappableValue("SG_PRODUCT")
  sgProduct,
  @MappableValue("RC_PRODUCT")
  rcProduct,
  ;
}
