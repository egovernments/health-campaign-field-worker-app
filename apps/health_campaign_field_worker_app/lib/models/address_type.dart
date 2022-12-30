import 'package:dart_mappable/dart_mappable.dart';


@MappableEnum(caseStyle: CaseStyle.upperCase)
enum AddressType {
  @MappableValue("PERMANENT") permanent,
  @MappableValue("CORRESPONDENCE") correspondence,
  @MappableValue("OTHER") other,
  ;
}