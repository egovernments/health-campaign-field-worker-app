import 'package:drift/drift.dart';

class AddressTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}