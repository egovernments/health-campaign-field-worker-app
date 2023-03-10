// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';

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