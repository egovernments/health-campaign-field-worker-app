// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'enum_values.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum EnumValues {
  @MappableValue("campaignName")
  campaignName,
  @MappableValue("eventType")
  eventType,
  @MappableValue("Draft")
  draft,
  @MappableValue("Submit")
  submit,
  @MappableValue("sessions")
  sessions,
  @MappableValue("dateOfDelivery")
  dateOfDelivery,
  @MappableValue("entryTime")
  entryTime,
  @MappableValue("exitTime")
  exitTime,
  @MappableValue("ENTRY")
  entry,
  @MappableValue("EXIT")
  exit,
  @MappableValue("ACTIVE")
  active,
  @MappableValue("INACTIVE")
  inactive,
  @MappableValue("latitude")
  latitude,
  @MappableValue("longitude")
  longitude,
  @MappableValue("boundaryCode")
  boundaryCode,
}
@MappableEnum(caseStyle: CaseStyle.camelCase)
enum AttendanceSortType {
  @MappableValue("none")
  none,
  @MappableValue("presentFirst")
  presentFirst,
  @MappableValue("absentFirst")
  absentFirst,
}
