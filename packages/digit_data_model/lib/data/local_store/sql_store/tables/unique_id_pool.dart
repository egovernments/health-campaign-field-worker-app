// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class UniqueIdPool extends Table {
  TextColumn get id => text().nullable()();

  TextColumn get clientReferenceId => text()();

  TextColumn get userUUID => text().nullable()();

  TextColumn get status => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
