// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ServiceDefinitions extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get code => text().nullable()();
  BoolColumn get isActive => boolean().nullable()();
  TextColumn get clientReferenceId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}