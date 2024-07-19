// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'status.mapper.dart';
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Status {
  @MappableValue("CLOSED_HOUSEHOLD") closeHousehold,
  @MappableValue("REFUSED") refused,
  @MappableValue("SPRAYED") sprayed,
  @MappableValue("INELIGIBLE") ineligible,
  @MappableValue("RESOLVED") resolved,
}