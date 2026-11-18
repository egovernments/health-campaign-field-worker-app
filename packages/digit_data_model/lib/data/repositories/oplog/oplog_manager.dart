// OpLogManager for the current platform: Isar-backed on Android/iOS,
// in-memory on the web (see oplog_web.dart).
export 'oplog.dart' if (dart.library.js_interop) 'oplog_web.dart';
