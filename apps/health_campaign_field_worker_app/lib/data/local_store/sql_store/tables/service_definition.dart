// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ServiceDefinition extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get code => text().nullable()();
  BoolColumn get isActive => boolean().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { id,  };
}