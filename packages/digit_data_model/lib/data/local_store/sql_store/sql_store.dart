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
  int get schemaVersion => 6; // Increment schema version

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 5) {
            //Add column for projectType in Project Table
            try {
              await migrator.addColumn(project, project.projectType);
            } catch (e) {
              // Migration error - column may already exist
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
              // Migration error - columns may already exist
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
                // Migration error - beneficiaryType conversion may have already been done
              }
            } catch (e) {
              // Migration error - columns may already exist
            }
          }
          if (from < 8) {
            try {
              await migrator.addColumn(attendee, attendee.tag);
            } catch (e) {
              // Migration error - column may already exist
            }
          }
        },
      );

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
      // Note: logStatements disabled to prevent verbose SQL logging in console.
      // Use DigitLogger for controlled logging instead.
      return NativeDatabase(
        file,
        logStatements: false,
        setup: (database) {
          // If an encryption key is provided, set it using SQLCipher's PRAGMA key
          if (encryptionKey != null && encryptionKey.isNotEmpty) {
            // Use SQLCipher encryption with the provided key
            database.execute("PRAGMA key = '$encryptionKey';");
          }
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
      }
      testPlainDb.dispose();
      testPlainDb = null;
    } catch (e) {
      testPlainDb?.dispose();
      testPlainDb = null;
      // Failed to read without key - database might be encrypted
    }

    // Step 2: If database is not unencrypted, verify it's encrypted with our key
    if (!isUnencrypted) {
      sqlite3.Database? testEncDb;
      try {
        testEncDb = sqlite3.sqlite3.open(dbFile.path);
        testEncDb.execute("PRAGMA key = '$encryptionKey';");
        // Verify we can read with this key
        testEncDb.execute('SELECT count(*) FROM sqlite_master;');
        testEncDb.dispose();

        return DatabaseMigrationResult.noMigrationNeeded;
      } catch (e) {
        testEncDb?.dispose();
        // Database is encrypted with a different key or corrupted
        // Return keyMismatch so the caller can show an error to the user
        return DatabaseMigrationResult.keyMismatch;
      }
    }

    // Step 3: Perform migration from unencrypted to encrypted
    sqlite3.Database? plainDb;
    try {
      plainDb = sqlite3.sqlite3.open(dbFile.path);

      // Clean up any existing temp file
      if (await tempEncryptedFile.exists()) {
        await tempEncryptedFile.delete();
      }

      // Use SQLCipher's ATTACH with KEY to create encrypted copy
      plainDb.execute(
          "ATTACH DATABASE '${tempEncryptedFile.path}' AS encrypted KEY '$encryptionKey';");
      plainDb.execute("SELECT sqlcipher_export('encrypted');");

      // Explicitly set the schema version in the encrypted database
      plainDb.execute("PRAGMA encrypted.user_version = $schemaVersion;");

      plainDb.execute("DETACH DATABASE encrypted;");

      plainDb.dispose();
      plainDb = null;

      // Replace the original with the encrypted version
      await dbFile.delete();
      await tempEncryptedFile.rename(dbFile.path);

      return DatabaseMigrationResult.migrationSuccess;
    } catch (e) {
      plainDb?.dispose();
      // Clean up temp file if it exists
      if (await tempEncryptedFile.exists()) {
        await tempEncryptedFile.delete();
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
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
