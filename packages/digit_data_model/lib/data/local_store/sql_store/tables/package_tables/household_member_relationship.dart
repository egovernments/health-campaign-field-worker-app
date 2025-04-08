// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class HouseholdMemberRelationShip extends Table {
  TextColumn get id => text().nullable()();

  TextColumn get selfId => text().nullable()();

  TextColumn get selfIdClientReferenceId => text().nullable()();

  TextColumn get relativeId => text().nullable()();

  TextColumn get relativeClientReferenceId => text().nullable()();

  TextColumn get relationshipType => text().nullable()();

  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {
        id,
      };
}
