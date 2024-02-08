import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum RegisterStatus {
  @MappableValue("ACTIVE") active,
  @MappableValue("INACTIVE") inactive,
  ;
}