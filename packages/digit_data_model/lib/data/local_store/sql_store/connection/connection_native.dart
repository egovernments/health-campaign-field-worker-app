// Native (Android/iOS) database connection for [LocalSqlDataStore].
// Moved unchanged from sql_store.dart so the store can also be compiled for
// the web (see connection_web.dart). Selected by connection.dart.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

import '../sql_store.dart' show DatabaseMigrationResult;

/// Flag to track if SQLCipher library has been initialized
bool _sqlCipherInitialized = false;

/// Initializes SQLCipher library for Android. Safe to call multiple times.
void _initializeSqlCipher() {
  if (!_sqlCipherInitialized) {
    open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
    _sqlCipherInitialized = true;
  }
}

/// The `_openConnection` method opens a connection to the database.
/// It returns a `LazyDatabase` that opens the database when it is first accessed.
///
/// [encryptionKey] - Optional encryption key for SQLCipher encryption.
LazyDatabase openConnection({String? encryptionKey}) {
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
        // WAL lets background sync + interactive queries share the DB
        // without one blocking the other.
        database.execute('PRAGMA journal_mode = WAL;');
        // Wait up to 5 seconds when the DB is locked by another isolate.
        database.execute('PRAGMA busy_timeout = 5000;');
        // Read-path tuning for large local datasets.
        //
        // Traced regression: without an explicit cache_size, SQLCipher
        // defaults to ~8 MB (2000 pages × 4 KB). Between the
        // `_warmProjectHotTables` warm-up in the localization bloc and
        // the first user-triggered module search, Drift touches enough
        // metadata / schema pages during `CrudService` + `FlowCrudBloc`
        // init that the hot pages get evicted from an 8 MB LRU and
        // `project_facility` pays a ~2.5 s cold decrypt again.
        //
        // 20 MB is enough headroom to survive that init churn without
        // meaningfully bloating app RAM. If field traces regress, bump
        // to -50000 (~50 MB) — measured that as the stable ceiling.
        database.execute('PRAGMA cache_size = -20000;'); // ~20 MB page cache
        database.execute('PRAGMA temp_store = MEMORY;');
        database.execute('PRAGMA mmap_size = 30000000;'); // 30 MB mmap
        database.execute('PRAGMA synchronous = NORMAL;');
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
Future<DatabaseMigrationResult> migrateToEncrypted(String encryptionKey) async {
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
Future<bool> deleteDatabase() async {
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
