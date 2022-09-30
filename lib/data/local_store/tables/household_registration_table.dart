import 'package:drift/drift.dart';

class HouseholdRegistrationTable extends Table {
  TextColumn get additionalFields => text().nullable()();
  TextColumn get administrativeUnit => text()();
  TextColumn get campaignId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get dateOfRegistration => integer()();
  TextColumn get householdId => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get accuracy => real().nullable()();
  IntColumn get numberOfIndividuals => integer()();
  TextColumn get tenantId => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get syncFileName => text().nullable()();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}

class IndividualTable extends Table {
  TextColumn get additionalFields => text().nullable()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dateOfBirth => text()();
  TextColumn get gender => text()();
  IntColumn get householdId => integer().references(
        HouseholdRegistrationTable,
        #clientReferenceId,
      )();
  BoolColumn get isHead => boolean().withDefault(const Constant(true))();
  TextColumn get givenName => text()();
  TextColumn get familyName => text().nullable()();
  TextColumn get additionalName => text().nullable()();
  BoolColumn get isDeleted => boolean()();
}

class IndividualIdentifierTable extends Table {
  TextColumn get identifierId => text()();
  TextColumn get identifierType => text()();
  IntColumn get individualId => integer().references(
    IndividualTable,
    #id,
  )();

  @override
  Set<Column> get primaryKey => {identifierId};
}