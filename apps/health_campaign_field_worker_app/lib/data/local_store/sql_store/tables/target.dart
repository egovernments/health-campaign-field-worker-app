// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Target extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get beneficiaryType => text().nullable()();
  TextColumn get baseline => text().nullable()();
  TextColumn get target => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId, createdBy,  };
}