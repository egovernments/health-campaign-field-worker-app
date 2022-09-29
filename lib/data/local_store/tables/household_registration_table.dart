import 'package:drift/drift.dart';

class HouseholdRegistrationTable extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get clientReferenceId => text()();
  TextColumn get campaignId => text()();
  TextColumn get tenantId => text()();
  IntColumn get registeredAt => integer()();
  TextColumn get beneficiaryType => text().nullable()();
  BoolColumn get isSynced => boolean()();
  TextColumn get syncFileId => text()();


  @override
  Set<Column> get primaryKey => {clientReferenceId};
}
