// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'status.mapper.dart';
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Status {
  @MappableValue("DELIVERED") delivered,
  @MappableValue("NOT_DELIVERED") notDelivered,
  @MappableValue("VISITED") visited,
  @MappableValue("NOT_VISITED") notVisited,
  @MappableValue("BENEFICIARY_REFUSED") beneficiaryRefused,
  @MappableValue("BENEFICIARY_REFERRED") beneficiaryReferred,
  @MappableValue("ADMINISTERED_SUCCESS") administeredSuccess,
  @MappableValue("ADMINISTERED_FAILED") administeredFailed,
  @MappableValue("IN_COMPLETE") inComplete,
  @MappableValue("TO_ADMINISTER") toAdminister,
  @MappableValue("BENEFICIARY_INELIGIBLE") beneficiaryIneligible,
  ;
}