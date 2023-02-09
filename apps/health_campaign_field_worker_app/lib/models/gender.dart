// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum Gender {
  @MappableValue("MALE") male,
  @MappableValue("FEMALE") female,
  @MappableValue("OTHER") other,
  ;
}