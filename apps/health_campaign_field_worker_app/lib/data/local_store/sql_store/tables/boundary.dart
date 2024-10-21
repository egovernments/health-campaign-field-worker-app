// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class Boundary extends Table {
  TextColumn get code => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get label => text().nullable()();
  TextColumn get latitude => text().nullable()();
  TextColumn get longitude => text().nullable()();
  TextColumn get area => text().nullable()();
  TextColumn get materializedPath => text().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get boundaryNum => integer().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();

  @override
  Set<Column> get primaryKey => {code};
}
