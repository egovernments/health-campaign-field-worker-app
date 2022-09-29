import 'package:drift/drift.dart';
import 'package:health_campaigns_flutter/data/local_store/tables/household_registration_table.dart';

class DeliveryTable extends Table {
  TextColumn get additionalFields => text().nullable()();
  TextColumn get campaignId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get deliveryDate => integer()();
  TextColumn get deliveredBy => text()();
  TextColumn get registrationId => text().references(
        HouseholdRegistrationTable,
        #clientReferenceId,
      )();
  TextColumn get status => text()();
  TextColumn get tenantId => text()();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}
