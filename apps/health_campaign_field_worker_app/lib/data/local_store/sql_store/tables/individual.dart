import 'package:drift/drift.dart';

class IndividualTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get clientReferenceId => text()();
  TextColumn get name => text()();
  TextColumn get dateOfBirth => text()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column>? get primaryKey => {  };
}