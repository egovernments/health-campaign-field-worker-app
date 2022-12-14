import 'package:drift/drift.dart';


class TargetTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get beneficiaryType => text()();
  TextColumn get baseline => text()();
  TextColumn get target => text()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}