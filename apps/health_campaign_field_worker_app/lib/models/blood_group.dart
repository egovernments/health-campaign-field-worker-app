import 'package:dart_mappable/dart_mappable.dart';


@MappableEnum(caseStyle: CaseStyle.upperCase)
enum BloodGroup {
  @MappableValue("A+") aPositive,
  @MappableValue("B+") bPositive,
  @MappableValue("O+") oPositive,
  @MappableValue("AB+") abPositive,
  @MappableValue("A-") aNegative,
  @MappableValue("B-") bNegative,
  @MappableValue("AB-") abNegative,
  @MappableValue("O-") oNegative,
  ;
}