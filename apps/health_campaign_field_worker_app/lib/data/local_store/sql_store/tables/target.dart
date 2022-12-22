import 'package:drift/drift.dart';


class TargetTable extends Table {
  TextColumn get id => text()();
  TextColumn get beneficiaryType => text()();
  TextColumn get baseline => text()();
  TextColumn get target => text()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}