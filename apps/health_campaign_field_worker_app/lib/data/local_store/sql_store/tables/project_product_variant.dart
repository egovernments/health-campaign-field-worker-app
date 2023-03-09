// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectProductVariant extends Table {
  TextColumn get productVariantId => text().nullable()();
  TextColumn get type => text().nullable()();
  BoolColumn get isBaseUnitVariant => boolean().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId, createdBy,  };
}