// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Status {
  @MappableValue("DELIVERED")
  delivered,
  @MappableValue("NOT_ADMINISTERED")
  notAdministered,
  @MappableValue("VISITED")
  visited,
  @MappableValue("NOT_VISITED")
  notVisited,
  @MappableValue("BENEFICIARY_REFUSED")
  beneficiaryRefused,
  @MappableValue("INELIGIBLE")
  ineligible,
  @MappableValue("BENEFICIARY_REFERRED")
  beneficiaryReferred,
  @MappableValue("ADMINISTRATION_SUCCESS")
  administeredSuccess,
  @MappableValue("ADMINISTRATION_FAILED")
  administeredFailed,
  @MappableValue("IN_COMPLETE")
  inComplete,
  @MappableValue("TO_ADMINISTER")
  toAdminister,
  @MappableValue("REGISTERED")
  registered,
  @MappableValue("NOT_REGISTERED")
  notRegistered,
  @MappableValue("CLOSED_HOUSEHOLD")
  closeHousehold,
}
