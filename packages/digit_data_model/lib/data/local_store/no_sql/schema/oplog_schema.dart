// OpLog schema for the current platform: the Isar collection on Android/iOS,
// plain classes on the web (see oplog_web.dart).
export 'oplog.dart' if (dart.library.js_interop) 'oplog_web.dart';
