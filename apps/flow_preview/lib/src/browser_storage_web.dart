import 'package:web/web.dart' as web;

/// A value another app on this origin left in window.localStorage (for
/// example the campaign console's `Employee.tenant-id`), without the JSON
/// quotes some DIGIT UIs add. Null when missing or unreadable.
String? readBrowserStorage(String key) {
  try {
    final v = web.window.localStorage.getItem(key)?.trim();
    if (v == null || v.isEmpty) return null;
    return v.length > 1 && v.startsWith('"') && v.endsWith('"')
        ? v.substring(1, v.length - 1)
        : v;
  } catch (_) {
    return null;
  }
}
