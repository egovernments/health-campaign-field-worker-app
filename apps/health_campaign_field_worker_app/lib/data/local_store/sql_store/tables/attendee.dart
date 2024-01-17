import 'package:drift/drift.dart';

class Attendee extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get tenantId => text()();
  TextColumn get registerId => text()();
  TextColumn get individualId => text()();
  IntColumn get enrollmentDate => integer().nullable()();
  IntColumn get denrollmentDate => integer().nullable()();
  TextColumn get additionalFields => text().nullable()();
  @override
  Set<Column> get primaryKey => { id };
}