// Importing necessary packages and files.
import 'package:digit_data_model/data/local_store/sql_store/tables/face_auth_event.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/localization.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/user_action.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import 'connection/connection.dart' as connection;

import '../../../models/entities/address_type.dart';
import '../../../models/entities/beneficiary_type.dart';
import '../../../models/entities/blood_group.dart';
import '../../../models/entities/gender.dart';
import '../../../models/entities/household_type.dart';
import '../../../models/entities/pgr_application_status.dart';
import 'tables/address.dart';
import 'tables/attributes.dart';
import 'tables/boundary.dart';
import 'tables/document.dart';
import 'tables/downsync.dart';
import 'tables/downsync_criteria.dart';
import 'tables/facility.dart';
import 'tables/identifier.dart';
import 'tables/individual.dart';
import 'tables/locality.dart';
import 'tables/name.dart';
import 'tables/package_tables/attendance.dart';
import 'tables/package_tables/attendance_register.dart';
import 'tables/package_tables/attendee.dart';
import 'tables/package_tables/hf_referral.dart';
import 'tables/package_tables/household.dart';
import 'tables/package_tables/household_member.dart';
import 'tables/package_tables/household_member_relationship.dart';
import 'tables/package_tables/referral.dart';
import 'tables/package_tables/side_effect.dart';
import 'tables/package_tables/staff.dart';
import 'tables/package_tables/stock.dart';
import 'tables/package_tables/stock_reconciliation.dart';
import 'tables/package_tables/task.dart';
import 'tables/package_tables/task_resource.dart';
import 'tables/pgr_service.dart';
import 'tables/product.dart';
import 'tables/product_variant.dart';
import 'tables/project.dart';
import 'tables/project_beneficiary.dart';
import 'tables/project_facility.dart';
import 'tables/project_product_variant.dart';
import 'tables/project_resource.dart';
import 'tables/project_staff.dart';
import 'tables/project_type.dart';
import 'tables/service.dart';
import 'tables/service_attributes.dart';
import 'tables/service_definition.dart';
import 'tables/target.dart';
import 'tables/unique_id_pool.dart';
import 'tables/user.dart';

// Part directive for the generated code.
part 'sql_store.g.dart';

/// Enum representing the result of database migration check
enum DatabaseMigrationResult {
  /// No migration needed - database doesn't exist or is already encrypted with correct key
  noMigrationNeeded,

  /// Migration from unencrypted to encrypted was successful
  migrationSuccess,

  /// Migration failed
  migrationFailed,

  /// Database is encrypted with a different key - data cannot be recovered
  keyMismatch,
}

/// The `LocalSqlDataStore` class represents the local SQL data store.
/// It is annotated with `@DriftDatabase` to indicate that it is a Drift database.
/// The `tables` parameter of the `@DriftDatabase` annotation lists all the tables in the database.
@DriftDatabase(tables: [
  AttendanceRegister,
  Attendance,
  Attendee,
  Address,
  Name,
  Boundary,
  Document,
  Facility,
  Product,
  ProductVariant,
  Project,
  ProjectBeneficiary,
  ProjectFacility,
  ProjectProductVariant,
  ProjectResource,
  ProjectStaff,
  ProjectType,
  Individual,
  Identifier,
  Stock,
  StockReconciliation,
  Target,
  Service,
  ServiceAttributes,
  ServiceDefinition,
  Locality,
  Staff,
  Attributes,
  PgrService,
  PgrComplainant,
  User,
  Downsync,
  DownsyncCriteria,
  HFReferral,
  Household,
  HouseholdMember,
  HouseholdMemberRelationShip,
  Task,
  TaskResource,
  SideEffect,
  Referral,
  Localization,
  UserAction,
  FaceAuthEvent,
  UniqueIdPool
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  /// The constructor for `LocalSqlDataStore`.
  /// It calls the superclass constructor with `_openConnection()` as the argument.
  ///
  /// [encryptionKey] - Optional encryption key for SQLCipher encryption.
  /// If provided, the database will be encrypted using AES-256.
  LocalSqlDataStore({String? encryptionKey})
      : super(_openConnection(encryptionKey: encryptionKey));

  /// The `schemaVersion` getter returns the schema version of the database.
  @override
  int get schemaVersion => 12; // Increment schema version

  Future<void> _createTaskSearchIndexes() async {
    await customStatement('''
      CREATE INDEX IF NOT EXISTS task_search_project_created_status
      ON task (project_id, client_created_by, status);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS task_search_project_created_status_modifiedtime
      ON task (project_id, client_created_by, status, client_modified_time);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS task_search_project_created_status_plannedstart
      ON task (project_id, client_created_by, status, planned_start_date);
    ''');
  }

  /// v12 hot-path indexes. Each of these columns is a WHERE-clause target
  /// somewhere in the app but the table had no matching index — meaning
  /// SQLite was doing full-table SCAN + SQLCipher page decrypt on every
  /// filter. The composite `(locale, module)` on localization is the
  /// biggest win (measured ~1000× speedup on cacheProbe). The rest are
  /// preventative — the tables are small today but will grow. Idempotent
  /// via `IF NOT EXISTS` so this is safe to call on fresh installs and
  /// upgrades alike.
  Future<void> _createV12HotPathIndexes() async {
    await customStatement('''
      CREATE INDEX IF NOT EXISTS localization_locale_module
      ON localization (locale, module);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS pgr_service_tenantid
      ON pgr_service (tenant_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS product_variant_productid
      ON product_variant (product_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS project_facility_projectid
      ON project_facility (project_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS project_facility_facilityid
      ON project_facility (facility_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS project_resource_projectid
      ON project_resource (project_id);
    ''');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        // Fresh installs at the current schemaVersion never run onUpgrade,
        // so any index we only add inside a `from < N` block never appears
        // on a fresh install. Drift's default onCreate runs
        // migrator.createAll() which materializes tables + @TableIndex
        // annotations only — every CREATE INDEX statement we invoke
        // manually below (task_search_*, name/entity clientRef, v12
        // hot-path) has to be re-run here too. Symptom without this: a
        // 2-row lookup on project_facility takes 2+ seconds because
        // `WHERE project_id = ?` falls back to a full-table SCAN + per-page
        // SQLCipher decrypt. ANALYZE afterwards seeds sqlite_stat1 with
        // real row counts so the planner actually picks the new indexes.
        onCreate: (migrator) async {
          await migrator.createAll();
          try {
            await _createTaskSearchIndexes();
            await _createNameAndEntityClientRefIndexes();
            await _createV12HotPathIndexes();
            await customStatement('ANALYZE');
          } catch (e) {
            if (kDebugMode) {
              print('Failed to seed hot-path indexes onCreate: $e');
            }
          }
        },
        onUpgrade: (migrator, from, to) async {
          if (from < 5) {
            //Add column for projectType in Project Table
            try {
              await migrator.addColumn(project, project.projectType);
            } catch (e) {
              if (kDebugMode) {
                print("Failed to add column for projectType");
              }
            }
          }
          if (from < 5) {
            await customStatement('''
        CREATE TABLE attributes_temp (
          id TEXT,
          dataType TEXT,
          referenceId TEXT,
          tenantId TEXT,
          code TEXT,
          values TEXT,
          isActive BOOLEAN,
          required BOOLEAN,
          regex TEXT,
          "order" INTEGER,
          auditCreatedBy TEXT,
          nonRecoverableError BOOLEAN DEFAULT 0,
          auditCreatedTime INTEGER,
          clientCreatedTime INTEGER,
          clientModifiedBy TEXT,
          clientCreatedBy TEXT,
          clientModifiedTime INTEGER,
          auditModifiedBy TEXT,
          auditModifiedTime INTEGER,
          isDeleted BOOLEAN DEFAULT 0,
          rowVersion INTEGER,
          additionalFields TEXT,
          additionalDetails TEXT
        );
      ''');

            // Step 2: Copy data from the old table to the new table
            await customStatement('''
        INSERT INTO attributes_temp (
          id, dataType, referenceId, tenantId, code, values, isActive, required, regex, "order",
          auditCreatedBy, nonRecoverableError, auditCreatedTime, clientCreatedTime,
          clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
          auditModifiedTime, isDeleted, rowVersion, additionalFields, additionalDetails
        )
        SELECT 
          id, dataType, referenceId, tenantId, code, values,
          CASE isActive WHEN 'true' THEN 1 WHEN 'false' THEN 0 ELSE NULL END,
          required, regex, "order",
          auditCreatedBy, nonRecoverableError, auditCreatedTime, clientCreatedTime,
          clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
          auditModifiedTime, isDeleted, rowVersion, additionalFields, additionalDetails
        FROM attributes;
      ''');

            // Step 3: Drop the old table
            await migrator.deleteTable('attributes');

            // Step 4: Rename the new table to the old table's name
            await customStatement(
                'ALTER TABLE attributes_temp RENAME TO attributes;');
          }

          if (from < 6) {
            try {
              await migrator.addColumn(household, household.householdType);
              await migrator.addColumn(
                  attendanceRegister, attendanceRegister.localityCode);
              await migrator.addColumn(service, service.referenceId);
            } catch (e) {
              if (kDebugMode) {
                print(
                    "Failed to add columns for householdType, attendance - localityCode, and service - relatedClientReferenceId");
              }
            }
          }
          if (from < 7) {
            try {
              await migrator.addColumn(serviceAttributes, serviceAttributes.id);
              await migrator.addColumn(serviceAttributes,
                  serviceAttributes.serviceClientReferenceId);
              await migrator.addColumn(
                  identifier, identifier.individualClientReferenceId);
              await migrator.addColumn(identifier, identifier.individualId);
              try {
                // Step 1: Create the new target_temp table
                await customStatement('''
    CREATE TABLE target_temp (
      id TEXT,
      clientReferenceId TEXT,
      totalNo REAL,
      targetNo REAL,
      auditCreatedBy TEXT,
      nonRecoverableError BOOLEAN DEFAULT 0,
      auditCreatedTime INTEGER,
      clientCreatedTime INTEGER,
      clientModifiedBy TEXT,
      clientCreatedBy TEXT,
      clientModifiedTime INTEGER,
      auditModifiedBy TEXT,
      auditModifiedTime INTEGER,
      tenantId TEXT,
      isDeleted BOOLEAN DEFAULT 0,
      rowVersion INTEGER,
      beneficiaryType TEXT,
      additionalFields TEXT,
      PRIMARY KEY (id, auditCreatedBy)
    );
  ''');

                // Step 2: Copy + convert beneficiaryType from INT to TEXT (MappableValue)
                await customStatement('''
    INSERT INTO target_temp (
      id, clientReferenceId, totalNo, targetNo, auditCreatedBy,
      nonRecoverableError, auditCreatedTime, clientCreatedTime,
      clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
      auditModifiedTime, tenantId, isDeleted, rowVersion,
      beneficiaryType, additionalFields
    )
    SELECT
      id, clientReferenceId, totalNo, targetNo, auditCreatedBy,
      nonRecoverableError, auditCreatedTime, clientCreatedTime,
      clientModifiedBy, clientCreatedBy, clientModifiedTime, auditModifiedBy,
      auditModifiedTime, tenantId, isDeleted, rowVersion,
      CASE beneficiaryType
        WHEN 0 THEN 'INDIVIDUAL'
        WHEN 1 THEN 'HOUSEHOLD'
        WHEN 2 THEN 'PRODUCT'
        WHEN 3 THEN 'SPECIAL_GROUPS'
        WHEN 4 THEN 'REFUGEE_CAMPS'
        WHEN 5 THEN 'SG_PRODUCT'
        WHEN 6 THEN 'RC_PRODUCT'
        ELSE NULL
      END,
      additionalFields
    FROM target;
  ''');

                // Step 3: Drop old table
                await customStatement('DROP TABLE target;');

                // Step 4: Rename temp to original
                await customStatement(
                    'ALTER TABLE target_temp RENAME TO target;');
              } catch (e) {
                if (kDebugMode) {
                  print(
                      "Migration failed while updating beneficiaryType to TEXT: $e");
                }
              }
            } catch (e) {
              if (kDebugMode) {
                print(
                    "Failed to add columns for serviceAttributes - serviceClientReferenceId, id, identifier - individualClientReferenceId, individualId");
              }
            }
          }
          if (from < 8) {
            try {
              await migrator.addColumn(attendee, attendee.tag);
            } catch (e) {
              if (kDebugMode) {
                print("Failed to add columns for attendee, tag");
              }
            }
          }
          if (from < 9) {
            try {
              await migrator.addColumn(stock, stock.campaignNumber);
            } catch (e) {
              if (kDebugMode) {
                print("Failed to add columns for stock, campaignNumber");
              }
            }
          }

          if (from < 10) {
            try {
              await _createTaskSearchIndexes();
            } catch (e) {
              if (kDebugMode) {
                print("Failed to create task search indexes");
              }
            }
            try {
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS identifier_identifierid ON identifier (identifier_id)');
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS identifier_individualclientref ON identifier (individual_client_reference_id)');
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS address_localityboundarycode ON address (locality_boundary_code)');
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS address_relatedclientref ON address (related_client_reference_id)');
              await customStatement('ANALYZE');
            } catch (e) {
              if (kDebugMode) {
                print(
                    "Failed to create identifier/address indexes in v10 migration: $e");
              }
            }
          }

          if (from < 11) {
            try {
              await _createTaskSearchIndexes();
            } catch (e) {
              if (kDebugMode) {
                print("Failed to create planned start task search index");
              }
            }
            try {
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS task_status ON task (status)');
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS task_project_status ON task (project_id, status, is_deleted)');
              await customStatement(
                  'CREATE INDEX IF NOT EXISTS task_clientmodifiedtime ON task (client_modified_time)');
              await customStatement('ANALYZE');
            } catch (e) {
              if (kDebugMode) {
                print("Failed to create task indexes in v11 migration: $e");
              }
            }
            // Drift only emits @TableIndex statements on fresh schema
            // creation. Existing users upgrading from v6..v10 reach v11
            // without the name/individual/household search indexes that
            // newly-installed users get for free — leaving the search-path
            // perf work in f15d81697 ineffective for the upgrade path.
            // Issue the same indexes here so upgraders catch up.
            try {
              await _createNameAndEntityClientRefIndexes();
              await customStatement('ANALYZE');
            } catch (e) {
              if (kDebugMode) {
                print(
                    "Failed to create name/individual/household search indexes in v11 migration: $e");
              }
            }
          }
          if (from < 12) {
            try {
              await migrator.createTable(faceAuthEvent);
            } catch (e) {
              if (kDebugMode) {
                print("Failed to create FaceAuthEvent table in v12 migration: $e");
              }
            }
          }

          if (from < 12) {
            // v12: add hot-path indexes that were previously missing on
            // localization (composite locale+module), pgr_service,
            // product_variant, project_facility, and project_resource.
            // See _createV12HotPathIndexes for rationale.
            try {
              await _createV12HotPathIndexes();
              await customStatement('ANALYZE');
            } catch (e) {
              if (kDebugMode) {
                print("Failed to create hot-path indexes in v12 migration: $e");
              }
            }
          }
        },
        // Runs AFTER onCreate / onUpgrade complete, but BEFORE the app
        // executes its first user query. This is the right hook for a
        // stats refresh: the ANALYZE in `setup` fires before migrations,
        // so on a fresh install it runs against empty tables and produces
        // useless stats — that's why the planner keeps picking SCAN over
        // our indexes for hot lookups (project_facility, identifier, etc.).
        // Running ANALYZE here guarantees stats reflect the actual row
        // counts every table has at the moment queries start firing.
        beforeOpen: (details) async {
          // One-line marker so field traces can confirm this hook fired at
          // all — the perf fixes below (index backfill, ANALYZE, hot-table
          // warm-up) only work if `beforeOpen` runs, and Drift's lazy DB
          // open means it doesn't fire until the first application query.
          debugPrint('[DBBoot] beforeOpen start '
              '(schema=${details.versionNow}, wasCreated=${details.wasCreated}, '
              'hadUpgrade=${details.hadUpgrade})');
          final beforeOpenSw = Stopwatch()..start();

          // Backfill for devices already at schemaVersion=12 before the
          // onCreate handler existed — for them onUpgrade doesn't fire
          // (from == to), onCreate doesn't fire (DB already created), so
          // the v12 hot-path indexes never materialize and hot queries
          // like `SELECT * FROM project_facility WHERE project_id = ?`
          // fall to full-table SCAN (measured at 2.5s for 2 rows on such
          // a device). Every statement below is `CREATE INDEX IF NOT
          // EXISTS`, so this is a no-op on freshly-created DBs and on
          // subsequent opens — cheap enough to run every launch.
          final indexSw = Stopwatch()..start();
          try {
            await _createTaskSearchIndexes();
            await _createNameAndEntityClientRefIndexes();
            await _createV12HotPathIndexes();
          } catch (e) {
            if (kDebugMode) {
              print("beforeOpen index backfill failed: $e");
            }
          }
          indexSw.stop();

          final analyzeSw = Stopwatch()..start();
          try {
            await customStatement('PRAGMA analysis_limit = 400;');
            await customStatement('ANALYZE');
            // PRAGMA optimize is SQLite's built-in "auto-refresh stats
            // when needed" mechanism. Cheap when stats are current,
            // rescans specific tables when significant change is detected.
            await customStatement('PRAGMA optimize');
          } catch (e) {
            if (kDebugMode) {
              print("beforeOpen ANALYZE failed: $e");
            }
          }
          analyzeSw.stop();

          // Note: an eager multi-table page warm-up used to live here
          // (walking every project-scoped lookup + a b-tree root touch on
          // downsync tables). Removed because:
          //   • The primary hot-page eviction driver was the localization
          //     bloc's `_loadLocale` running unnecessarily on every event
          //     — with that skip in place, small tables stay resident in
          //     the 20 MB decrypted cache across normal workloads.
          //   • The remaining eviction risk is covered by
          //     `_warmProjectHotTables` in `LocalizationBloc._loadLocale`'s
          //     finally block, which re-pins hot pages before any user-
          //     visible module search.
          // If field traces show cold-decrypt spikes on hot lookups after
          // a big cross-table write, restoring an explicit warm-up here
          // (`SELECT COUNT(*)` on tiny tables) is the right knob.

          debugPrint('[DBBoot] beforeOpen done '
              'total=${beforeOpenSw.elapsedMilliseconds}ms '
              'indexes=${indexSw.elapsedMilliseconds}ms '
              'analyze=${analyzeSw.elapsedMilliseconds}ms');
        },
      );

  /// Indexes that were originally declared via `@TableIndex` on the
  /// Name, Individual, and Household tables. Idempotent — safe to call on
  /// both fresh-installs (no-op via IF NOT EXISTS) and upgrades.
  Future<void> _createNameAndEntityClientRefIndexes() async {
    await customStatement('''
      CREATE INDEX IF NOT EXISTS name_givenname
      ON name (given_name);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS name_familyname
      ON name (family_name);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS name_individualclientref
      ON name (individual_client_reference_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS individual_clientref
      ON individual (client_reference_id);
    ''');
    await customStatement('''
      CREATE INDEX IF NOT EXISTS household_self_clientref
      ON household (client_reference_id);
    ''');
  }

  /// Opens the platform database connection (native file on Android/iOS,
  /// in-memory WebAssembly SQLite on the web). See `connection/`.
  static QueryExecutor _openConnection({String? encryptionKey}) =>
      connection.openConnection(encryptionKey: encryptionKey);

  /// Migrates an unencrypted database to an encrypted one.
  ///
  /// This method should be called before opening the database if you want to
  /// migrate existing data from an unencrypted database to an encrypted one.
  ///
  /// [encryptionKey] - The encryption key to use for the new encrypted database.
  ///
  /// Returns [DatabaseMigrationResult] indicating the result of the migration.
  static Future<DatabaseMigrationResult> migrateToEncrypted(
          String encryptionKey) =>
      connection.migrateToEncrypted(encryptionKey);

  /// Deletes the database file. Use this after showing an error to the user
  /// when [migrateToEncrypted] returns [DatabaseMigrationResult.keyMismatch].
  static Future<bool> deleteDatabase() => connection.deleteDatabase();
}
