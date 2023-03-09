// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Identifier extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get individualClientReferenceId => text().nullable()();
  TextColumn get identifierType => text().nullable()();
  TextColumn get identifierId => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { individualClientReferenceId,  };
}