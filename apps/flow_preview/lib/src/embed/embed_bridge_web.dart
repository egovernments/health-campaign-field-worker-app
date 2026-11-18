import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Browser side of the embed bridge: window.postMessage to and from the page
/// hosting the preview in an iframe.
///
/// Only messages from this page's own origin are accepted, and replies are
/// sent only to that origin: the host passes a session token, so the
/// preview must be served from the same domain as the console.
class EmbedBridge {
  static String get _origin => web.window.location.origin;

  static bool get hasParent => web.window.parent != null &&
      !identical(web.window.parent, web.window);

  /// Calls [onMessage] with each message from the host page (as Dart maps
  /// and lists). Messages from other origins are ignored.
  static void listen(void Function(Map<String, dynamic> message) onMessage) {
    web.window.addEventListener(
      'message',
      ((web.MessageEvent e) {
        if (e.origin != _origin) return;
        final data = e.data.dartify();
        if (data is Map) onMessage(_cast(data) as Map<String, dynamic>);
      }).toJS,
    );
  }

  /// Sends [message] to the host page (same origin only).
  static void send(Map<String, dynamic> message) {
    final parent = web.window.parent;
    if (parent == null || identical(parent, web.window)) return;
    parent.postMessage(message.jsify(), _origin.toJS);
  }

  static dynamic _cast(dynamic v) {
    if (v is Map) {
      return <String, dynamic>{
        for (final e in v.entries) e.key.toString(): _cast(e.value)
      };
    }
    if (v is List) return [for (final e in v) _cast(e)];
    // dartify gives doubles for every JS number; keep whole numbers as int.
    if (v is double && v == v.truncateToDouble() && v.abs() < 1e15) {
      return v.toInt();
    }
    return v;
  }
}
