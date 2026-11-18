// Web database connection for [LocalSqlDataStore], used by browser builds
// such as the flow preview. Data lives in memory for the page session only:
// there is no file, no encryption and no sync on the web.
//
// The host app must serve `sqlite3.wasm` (from the sqlite3 package release
// matching pubspec.lock) next to index.html.
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/wasm.dart';

import '../sql_store.dart' show DatabaseMigrationResult;

/// URL of the SQLite WebAssembly binary, relative to the page.
const String sqliteWasmPath = String.fromEnvironment(
  'SQLITE_WASM_PATH',
  defaultValue: 'sqlite3.wasm',
);

QueryExecutor openConnection({String? encryptionKey}) {
  return LazyDatabase(() async {
    final sqlite3 = await WasmSqlite3.loadFromUrl(Uri.parse(sqliteWasmPath));
    sqlite3.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);
    return WasmDatabase.inMemory(sqlite3);
  });
}

/// Nothing to migrate: the web database is in memory and unencrypted.
Future<DatabaseMigrationResult> migrateToEncrypted(String encryptionKey) async =>
    DatabaseMigrationResult.noMigrationNeeded;

/// Nothing to delete: the web database disappears with the page.
Future<bool> deleteDatabase() async => false;
