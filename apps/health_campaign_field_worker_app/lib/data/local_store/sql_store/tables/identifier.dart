// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Identifier extends Table {
  TextColumn get identifierType => text().nullable()();
  TextColumn get identifierId => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}