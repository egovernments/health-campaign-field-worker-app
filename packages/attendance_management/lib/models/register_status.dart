import 'package:dart_mappable/dart_mappable.dart';

part 'register_status.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum RegisterStatus {
  @MappableValue("ACTIVE") active,
  @MappableValue("INACTIVE") inactive,
  ;
}