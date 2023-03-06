// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class Service extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get clientId => text().nullable()();
  TextColumn get serviceDefId => text().nullable()();
  BoolColumn get isActive => boolean().nullable()();
  TextColumn get accountId => text().nullable()();
  TextColumn get additionalDetails => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientId,  };
}