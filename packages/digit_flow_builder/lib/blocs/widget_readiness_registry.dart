import 'dart:async';

/// Cross-widget readiness signalling for a single page.
///
/// Lets `ScreenBuilder.initActions` block on a widget finishing its own
/// init-time side effect (e.g. the headless proximity dispatch in
/// `searchBar`), so the first Crud search carries filters contributed by
/// both. Without this, `initActions` fires synchronously on mount and the
/// proximity SEARCH_EVENT lands moments later, causing a second search
/// and a brief flash of unordered results.
///
/// Awaiter and signaller can run in either order:
/// - Signal first → completer is created and completed; later await
///   resolves immediately.
/// - Await first → completer is created (uncompleted); later signal
///   completes it; the awaiter resumes.
///
/// Timeouts on `awaitSignal` are a GPS-failure fallback: if the widget
/// never signals (e.g. GPS denied), the awaiter proceeds without the
/// contributed filter so the page doesn't stall on a blank list forever.
class WidgetReadinessRegistry {
  WidgetReadinessRegistry._();
  static final WidgetReadinessRegistry _instance = WidgetReadinessRegistry._();
  factory WidgetReadinessRegistry() => _instance;

  final Map<String, Completer<void>> _completers = {};

  String _key(String compositeKey, String signal) => '$compositeKey::$signal';

  /// Marks a (compositeKey, signal) pair ready. Idempotent — signalling an
  /// already-completed pair is a no-op, so widgets can call this
  /// unconditionally after their first dispatch.
  void signal(String compositeKey, String signal) {
    final key = _key(compositeKey, signal);
    final completer = _completers.putIfAbsent(key, Completer<void>.new);
    if (!completer.isCompleted) completer.complete();
  }

  /// Returns `true` if the signal landed before [timeout], `false` on
  /// timeout. On timeout the completer stays open — a late signal still
  /// completes it, but the awaiter has already moved on.
  Future<bool> awaitSignal(
    String compositeKey,
    String signal, {
    Duration timeout = const Duration(seconds: 3),
  }) async {
    final key = _key(compositeKey, signal);
    final completer = _completers.putIfAbsent(key, Completer<void>.new);
    try {
      await completer.future.timeout(timeout);
      return true;
    } on TimeoutException {
      return false;
    }
  }

  /// Clears all signals for a page on teardown. Any pending awaiters are
  /// unblocked (completed) so dangling futures don't leak.
  void dispose(String compositeKey) {
    final prefix = '$compositeKey::';
    final toRemove = <String>[];
    _completers.forEach((k, v) {
      if (k.startsWith(prefix)) {
        if (!v.isCompleted) v.complete();
        toRemove.add(k);
      }
    });
    for (final k in toRemove) {
      _completers.remove(k);
    }
  }
}
