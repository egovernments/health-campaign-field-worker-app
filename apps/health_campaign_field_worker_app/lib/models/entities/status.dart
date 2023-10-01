// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Status {
  @MappableValue("DELIVERED")
  delivered,
  @MappableValue("NOT_DELIVERED")
  notDelivered,
  @MappableValue("BENEFICIARY_REFUSED")
  beneficiaryRefused,
  @MappableValue("PARTIAL_DELIVERED")
  partialDelivered,
  ;
}
