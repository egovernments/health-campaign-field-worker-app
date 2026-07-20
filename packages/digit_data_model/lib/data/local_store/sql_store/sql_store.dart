// Importing necessary packages and files.
import 'dart:io';

import 'package:digit_data_model/data/local_store/sql_store/tables/localization.dart';
import 'package:digit_data_model/data/local_store/sql_store/tables/user_action.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

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
  UniqueIdPool
])
class LocalSqlDataStore extends _$LocalSqlDataStore {
  /// The encryption key for the database.
  /// If null, the database will not be encrypted.
  static String? _encryptionKey;

  /// The constructor for `LocalSqlDataStore`.
  /// It calls the superclass constructor with `_openConnection()` as the argument.
  ///
  /// [encryptionKey] - Optional encryption key for SQLCipher encryption.
  /// If provided, the database will be encrypted using AES-256.
  LocalSqlDataStore({String? encryptionKey})
      : super(_openConnection(encryptionKey: encryptionKey)) {
    _encryptionKey = encryptionKey;
  }

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
          // Backfill for devices already at schemaVersion=12 before the
          // onCreate handler existed — for them onUpgrade doesn't fire
          // (from == to), onCreate doesn't fire (DB already created), so
          // the v12 hot-path indexes never materialize and hot queries
          // like `SELECT * FROM project_facility WHERE project_id = ?`
          // fall to full-table SCAN (measured at 2.5s for 2 rows on such
          // a device). Every statement below is `CREATE INDEX IF NOT
          // EXISTS`, so this is a no-op on freshly-created DBs and on
          // subsequent opens — cheap enough to run every launch.
          try {
            await _createTaskSearchIndexes();
            await _createNameAndEntityClientRefIndexes();
            await _createV12HotPathIndexes();
          } catch (e) {
            if (kDebugMode) {
              print("beforeOpen index backfill failed: $e");
            }
          }
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

  /// Flag to track if SQLCipher library has been initialized
  static bool _sqlCipherInitialized = false;

  /// Initializes SQLCipher library for Android. Safe to call multiple times.
  static void _initializeSqlCipher() {
    if (!_sqlCipherInitialized) {
      open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
      _sqlCipherInitialized = true;
    }
  }

  /// The `_openConnection` method opens a connection to the database.
  /// It returns a `LazyDatabase` that opens the database when it is first accessed.
  ///
  /// [encryptionKey] - Optional encryption key for SQLCipher encryption.
  static LazyDatabase _openConnection({String? encryptionKey}) {
    return LazyDatabase(() async {
      // Get the application documents directory.
      final dbFolder = await getApplicationDocumentsDirectory();
      // Create a file in the documents directory for the database.
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      // Initialize SQLCipher library for encryption support
      _initializeSqlCipher();

      // Return a `NativeDatabase` that uses the file for storage.
      return NativeDatabase(
        file,
        // Statement logging is very expensive when queries carry large
        // IN(...) clauses. Opt-in via dart-define rather than auto-on in debug.
        logStatements: const bool.fromEnvironment('DRIFT_LOG_STATEMENTS',
            defaultValue: false),
        setup: (database) {
          // If an encryption key is provided, set it using SQLCipher's PRAGMA key
          if (encryptionKey != null && encryptionKey.isNotEmpty) {
            database.execute(_sqlCipherKeyPragma(encryptionKey));
          }
          // Enable WAL mode for concurrent reads/writes across isolates
          database.execute('PRAGMA journal_mode = WAL;');
          // Wait up to 5 seconds when the DB is locked by another isolate
          database.execute('PRAGMA busy_timeout = 5000;');
          // Read-path tuning for large local datasets (120K+ rows).
          database.execute('PRAGMA cache_size = -20000;'); // ~20 MB page cache
          database.execute('PRAGMA temp_store = MEMORY;');
          database.execute('PRAGMA mmap_size = 30000000;'); // 30 MB mmap
          database.execute('PRAGMA synchronous = NORMAL;');
          // sqlite_stat1 refresh happens in the `beforeOpen` hook (Drift
          // lifecycle) — that's the right place because it runs after the
          // schema exists. Doing it here in `setup` would fire on fresh
          // installs before tables are created (useless stats) and would
          // double up with the `beforeOpen` refresh on every subsequent
          // open. See beforeOpen in `_openDatabase` for the live copy.
        },
      );
    });
  }

  /// Migrates an unencrypted database to an encrypted one.
  ///
  /// This method should be called before opening the database if you want to
  /// migrate existing data from an unencrypted database to an encrypted one.
  ///
  /// [encryptionKey] - The encryption key to use for the new encrypted database.
  ///
  /// Returns [DatabaseMigrationResult] indicating the result of the migration.
  static Future<DatabaseMigrationResult> migrateToEncrypted(String encryptionKey) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dbFolder.path, 'db.sqlite'));
    final tempEncryptedFile =
        File(p.join(dbFolder.path, 'db_encrypted.sqlite'));

    // If the database doesn't exist, no migration is needed
    if (!await dbFile.exists()) {
      if (kDebugMode) {
        print('Database file does not exist, no migration needed');
      }
      return DatabaseMigrationResult.noMigrationNeeded;
    }

    // Initialize SQLCipher library
    _initializeSqlCipher();

    // Step 1: First, try to open the database WITHOUT any encryption key
    // If this succeeds, the database is unencrypted and needs migration
    sqlite3.Database? testPlainDb;
    bool isUnencrypted = false;
    int schemaVersion = 0;

    try {
      testPlainDb = sqlite3.sqlite3.open(dbFile.path);
      // Do NOT set PRAGMA key - try to read as plain SQLite database
      // Check the SQLite header to verify it's a valid unencrypted SQLite file
      final headerCheck = testPlainDb.select(
          "SELECT count(*) as cnt FROM sqlite_master WHERE type='table';");

      if (headerCheck.isNotEmpty) {
        // Successfully read without encryption key - database is unencrypted
        isUnencrypted = true;

        // Get the current schema version before migration
        final versionResult = testPlainDb.select('PRAGMA user_version;');
        schemaVersion = versionResult.isNotEmpty
            ? versionResult.first['user_version'] as int
            : 0;

        if (kDebugMode) {
          print('Database is UNENCRYPTED - migration required');
          print('Current schema version: $schemaVersion');
        }
      }
      testPlainDb.dispose();
      testPlainDb = null;
    } catch (e) {
      testPlainDb?.dispose();
      testPlainDb = null;
      // Failed to read without key - database might be encrypted
      if (kDebugMode) {
        print('Cannot read database without key (likely encrypted): $e');
      }
    }

    // Step 2: If database is not unencrypted, verify it's encrypted with our key
    if (!isUnencrypted) {
      sqlite3.Database? testEncDb;
      try {
        testEncDb = sqlite3.sqlite3.open(dbFile.path);
        testEncDb.execute(_sqlCipherKeyPragma(encryptionKey));
        // Verify we can read with this key
        testEncDb.execute('SELECT count(*) FROM sqlite_master;');
        testEncDb.dispose();

        if (kDebugMode) {
          print('Database is already encrypted with the correct key, no migration needed');
        }
        return DatabaseMigrationResult.noMigrationNeeded;
      } catch (e) {
        testEncDb?.dispose();
        if (kDebugMode) {
          print('Database encrypted with different key or corrupted: $e');
        }
        // Database is encrypted with a different key or corrupted
        // Return keyMismatch so the caller can show an error to the user
        return DatabaseMigrationResult.keyMismatch;
      }
    }

    // Step 3: Perform migration from unencrypted to encrypted
    sqlite3.Database? plainDb;
    try {
      plainDb = sqlite3.sqlite3.open(dbFile.path);

      if (kDebugMode) {
        print('Starting encryption migration...');
      }

      // Clean up any existing temp file
      if (await tempEncryptedFile.exists()) {
        await tempEncryptedFile.delete();
      }

      // Use SQLCipher's ATTACH with KEY to create encrypted copy.
      // The key is passed as a SQLCipher hex-blob literal (x'..') and the
      // input is pre-asserted hex-only by _assertHexKey, so the value can
      // never break out of the literal regardless of caller input. The path
      // is sourced from getApplicationDocumentsDirectory() — internal app
      // sandbox, not user input.
      _assertHexKey(encryptionKey);
      plainDb.execute(
          "ATTACH DATABASE '${tempEncryptedFile.path}' AS encrypted KEY \"x'$encryptionKey'\";");
      plainDb.execute("SELECT sqlcipher_export('encrypted');");

      // Explicitly set the schema version in the encrypted database
      plainDb.execute("PRAGMA encrypted.user_version = $schemaVersion;");

      plainDb.execute("DETACH DATABASE encrypted;");

      plainDb.dispose();
      plainDb = null;

      // Replace the original with the encrypted version
      await dbFile.delete();
      await tempEncryptedFile.rename(dbFile.path);

      if (kDebugMode) {
        print('Database migration to encrypted completed successfully');
      }

      return DatabaseMigrationResult.migrationSuccess;
    } catch (e) {
      plainDb?.dispose();
      // Clean up temp file if it exists
      if (await tempEncryptedFile.exists()) {
        await tempEncryptedFile.delete();
      }
      if (kDebugMode) {
        print('Database migration failed: $e');
      }
      return DatabaseMigrationResult.migrationFailed;
    }
  }

  /// Deletes the database file. Use this after showing an error to the user
  /// when [migrateToEncrypted] returns [DatabaseMigrationResult.keyMismatch].
  static Future<bool> deleteDatabase() async {
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dbFolder.path, 'db.sqlite'));

      if (await dbFile.exists()) {
        await dbFile.delete();
        if (kDebugMode) {
          print('Database deleted successfully');
        }
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to delete database: $e');
      }
      return false;
    }
  }
}

final RegExp _hexKeyPattern = RegExp(r'^[0-9a-fA-F]+$');

// Throws if [key] contains anything but hex chars — defends every PRAGMA key
// / KEY-clause callsite against caller-controlled input ever reaching raw SQL.
void _assertHexKey(String key) {
  if (key.isEmpty || !_hexKeyPattern.hasMatch(key)) {
    throw ArgumentError(
        'SQLCipher key must be a non-empty hex string; refusing to interpolate');
  }
}

// Builds a SQLCipher `PRAGMA key = "x'<hex>'"` statement. The hex-blob form is
// SQLCipher's recommended way to pass a raw key and removes any quote-escape
// surface area for the key value itself.
String _sqlCipherKeyPragma(String hexKey) {
  _assertHexKey(hexKey);
  return 'PRAGMA key = "x\'$hexKey\'";';
}
