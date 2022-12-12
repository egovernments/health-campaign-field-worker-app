import 'package:drift/drift.dart';
import 'package:health_campaign_field_worker_app/data/local_store/tables/campaign_registration_table.dart';

class DeliveryTable extends Table {
  TextColumn get additionalFields => text().nullable()();
  TextColumn get campaignId => text()();
  TextColumn get clientReferenceId => text()();
  IntColumn get deliveryDate => integer()();
  TextColumn get deliveredBy => text()();
  TextColumn get registrationId =>
      text().references(CampaignRegistrationTable, #clientReferenceId)();
  TextColumn get status => text()();
  TextColumn get tenantId => text()();
  IntColumn get createdOn => integer()();
  IntColumn get modifiedOn => integer().nullable()();
  TextColumn get createdBy => text()();
  TextColumn get modifiedBy => text().nullable()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get syncFileName => text().nullable()();

  @override
  Set<Column> get primaryKey => {clientReferenceId};
}

class DeliveryResourceTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get resourceId => text()();
  IntColumn get quantityToBeDelivered => integer()();
  IntColumn get quantityDelivered => integer()();
  TextColumn get reasonIfNotDelivered => text().nullable()();
}
