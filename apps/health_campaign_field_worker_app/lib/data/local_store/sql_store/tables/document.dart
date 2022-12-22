import 'package:drift/drift.dart';


class DocumentTable extends Table {
  TextColumn get id => text()();
  TextColumn get tenantId => text()();
  TextColumn get documentType => text()();
  TextColumn get fileStoreId => text()();
  TextColumn get documentUid => text()();
  TextColumn get clientReferenceId => text().unique()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}