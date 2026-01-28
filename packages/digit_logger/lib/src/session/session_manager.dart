import 'package:uuid/uuid.dart';

/// Manages session IDs for grouping related log entries.
///
/// A session typically corresponds to an app launch. All logs within a session
/// share the same session ID, making it easy to trace logs from a single
/// app session.
///
/// Usage:
/// ```dart
/// // At app start
/// SessionManager.startSession();
///
/// // Get current session ID
/// final sessionId = SessionManager.current;
///
/// // Optionally end session explicitly
/// SessionManager.endSession();
/// ```
class SessionManager {
  static const Uuid _uuid = Uuid();
  static String? _currentSessionId;

  SessionManager._();

  /// Generates a new session ID.
  ///
  /// Call this at app start. If not called, a session ID will be
  /// auto-generated on first access to [current].
  static String startSession() {
    _currentSessionId = _uuid.v4();
    return _currentSessionId!;
  }

  /// Gets the current session ID.
  ///
  /// Auto-generates one if [startSession] hasn't been called.
  static String get current {
    return _currentSessionId ??= _uuid.v4();
  }

  /// Ends the current session.
  ///
  /// After calling this, the next access to [current] will generate
  /// a new session ID.
  static void endSession() {
    _currentSessionId = null;
  }

  /// Whether a session is currently active.
  static bool get hasActiveSession => _currentSessionId != null;

  /// Resets the session manager (for testing).
  static void reset() {
    _currentSessionId = null;
  }
}
