// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Status {
  @MappableValue("REGISTERED")
  registered,
  @MappableValue("NOT_REGISTERED")
  notRegistered,
  @MappableValue("CLOSED_HOUSEHOLD")
  closeHousehold
}
