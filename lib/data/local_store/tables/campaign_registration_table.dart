import 'package:drift/drift.dart';

class CampaignRegistrationTable extends Table {
  TextColumn get campaignId => text()();
  TextColumn get clientReferenceId => text()();
  TextColumn get beneficiaryType => text()();
  TextColumn get boundaryId => text()();
  IntColumn get dateOfRegistration => integer()();
  IntColumn get createdOn => integer()();
  IntColumn get modifiedOn => integer().nullable()();
  TextColumn get createdBy => text()();
  TextColumn get modifiedBy => text().nullable()();
  TextColumn get additionalFields => text().nullable()();
  TextColumn get tenantId => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get syncFileName => text().nullable()();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}

class HouseholdTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get registrationId => text().references(CampaignRegistrationTable, #clientReferenceId)();
  IntColumn get numberOfMembers => integer()();
  TextColumn get headOfHousehold => text().references(IndividualTable, #id)();
  BoolColumn get isDeleted => boolean()();
}

class IndividualTable extends Table {
  TextColumn get additionalFields => text().nullable()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dateOfBirth => text()();
  TextColumn get gender => text()();
  IntColumn get householdId => integer().references(HouseholdTable, #id)();
  BoolColumn get isHead => boolean().withDefault(const Constant(true))();
  TextColumn get name => text()();
  BoolColumn get isDeleted => boolean()();
}

class IndividualIdentifierTable extends Table {
  TextColumn get identifierId => text()();
  TextColumn get identifierType => text()();
  IntColumn get individualId => integer().references(IndividualTable, #id)();

  @override
  Set<Column> get primaryKey => {identifierId};
}