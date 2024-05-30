import 'package:drift/drift.dart';

class Staff extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get registerId => text()();
  TextColumn get userId => text()();
  IntColumn get enrollmentDate => integer().nullable()();
  IntColumn get denrollmentDate => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id, registerId};
}
