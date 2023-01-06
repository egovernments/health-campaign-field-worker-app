// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Document extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get documentType => text()();
  TextColumn get fileStoreId => text()();
  TextColumn get documentUid => text()();
  TextColumn get clientReferenceId => text()();
  

  @override
  Set<Column>? get primaryKey => { clientReferenceId,  };
}