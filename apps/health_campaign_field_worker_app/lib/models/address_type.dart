// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data/local_store/sql_store/sql_store.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum AddressType {
  @MappableValue("PERMANENT") permanent,
  @MappableValue("CORRESPONDENCE") correspondence,
  @MappableValue("OTHER") other,
  ;
}