// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';


class ProjectProductVariant extends Table {
  TextColumn get productVariantId => text().nullable()();
  TextColumn get type => text().nullable()();
  BoolColumn get isBaseUnitVariant => boolean().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get tenantId => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer()();
  

  @override
  Set<Column> get primaryKey => { clientReferenceId,  };
}