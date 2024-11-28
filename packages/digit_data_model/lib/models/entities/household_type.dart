import 'package:dart_mappable/dart_mappable.dart';

part 'household_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum HouseholdType {
  @MappableValue("FAMILY")
  family,
  @MappableValue("COMMUNITY")
  community,
  @MappableValue("OTHER")
  other,
  ;
}
