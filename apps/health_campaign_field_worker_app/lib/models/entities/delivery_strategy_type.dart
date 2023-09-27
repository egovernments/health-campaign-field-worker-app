import 'package:dart_mappable/dart_mappable.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum DeliverStrategyType {
  @MappableValue("INDIRECT")
  indirect,
  @MappableValue("DIRECT")
  direct,
  ;
}
