import 'dart:async';

/// Service that monitors user activity and triggers face gate re-verification
/// when the app has been idle for a configurable duration.
class SessionExpiryService {
  final Duration idleTimeout;
  DateTime _lastInteraction;
  Timer? _timer;
  final StreamController<void> _expiryController =
      StreamController<void>.broadcast();

  SessionExpiryService({
    this.idleTimeout = const Duration(minutes: 15),
  }) : _lastInteraction = DateTime.now();

  /// Stream that emits when the session has expired due to inactivity.
  Stream<void> get onSessionExpired => _expiryController.stream;

  /// Call this on any user interaction to reset the idle timer.
  void recordInteraction() {
    _lastInteraction = DateTime.now();
  }

  /// Start monitoring for idle timeout.
  void start() {
    _timer?.cancel();
    _lastInteraction = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      _checkExpiry();
    });
  }

  /// Stop monitoring.
  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Check if session has expired (call on app resume from background).
  bool checkAndNotifyExpiry() {
    final elapsed = DateTime.now().difference(_lastInteraction);
    if (elapsed >= idleTimeout) {
      _expiryController.add(null);
      return true;
    }
    return false;
  }

  void _checkExpiry() {
    final elapsed = DateTime.now().difference(_lastInteraction);
    if (elapsed >= idleTimeout) {
      _expiryController.add(null);
      stop(); // Stop until re-verification completes
    }
  }

  /// Whether the session is currently expired.
  bool get isExpired =>
      DateTime.now().difference(_lastInteraction) >= idleTimeout;

  void dispose() {
    stop();
    _expiryController.close();
  }
}
