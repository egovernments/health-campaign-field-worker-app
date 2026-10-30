import 'package:drift/drift.dart';


class Facility extends Table {
  TextColumn get id => text()();
  // App-generated id for sites created on the phone (outside-household
  // Transit Posts / Outside Household Places). Nullable because ordinary
  // facilities downloaded from the server may not carry one.
  TextColumn get clientReferenceId => text().nullable()();
  // Denormalised copy of the facility address GPS so the generic search can
  // order sites by `__distance` (which only looks at the primary table).
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get locationAccuracy => real().nullable()();
  BoolColumn get isPermanent => boolean().nullable()();
  TextColumn get usage => text().nullable()();
  IntColumn get storageCapacity => integer().nullable()();
  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get name => text().nullable()();
  BoolColumn get isDeleted => boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();

  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => { id, auditCreatedBy,  };
}