// Picks the database connection for the current platform:
// native SQLite/SQLCipher on Android and iOS, WebAssembly SQLite on the web.
export 'connection_native.dart' if (dart.library.js_interop) 'connection_web.dart';
