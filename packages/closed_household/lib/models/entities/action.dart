// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'action.mapper.dart';
@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Actions {
  @MappableValue("CLOSED_HOUSEHOLD") closeHousehold,
  @MappableValue("LOCATION_CAPTURE") locationCapture,
  @MappableValue("OTHER") other,
}