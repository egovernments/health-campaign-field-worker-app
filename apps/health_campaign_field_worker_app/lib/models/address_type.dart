import 'package:dart_mappable/dart_mappable.dart';


@MappableEnum(caseStyle: CaseStyle.upperCase)
enum AddressType {
  permanent, correspondence, other, 
}