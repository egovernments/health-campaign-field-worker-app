/// Properties attached to an event or a screen view.
///
/// Values must be [String], [num] or [bool].
typedef TelemetryProperties = Map<String, Object>;

/// Adapter for one telemetry tool (PostHog, Countly, Firebase, ...).
///
/// This is the only part that changes when the tool changes: write one class
/// that implements it, and pass it to `DigitTelemetry.initialize`. Policy,
/// privacy checks, identity and navigation tracking live in `DigitTelemetry`
/// and work with every provider.
///
/// Implementations only translate calls to their SDK. They may throw;
/// `DigitTelemetry` catches every error so telemetry never breaks the app.
abstract class TelemetryProvider {
  /// Short name used in logs, e.g. `posthog`.
  String get name;

  /// Whether the provider has what it needs to run (e.g. host and key).
  /// When false, `DigitTelemetry` never starts it.
  bool get isConfigured;

  /// Starts sending. Called once per start; may be called again after [stop].
  Future<void> start();

  /// Stops sending.
  Future<void> stop();

  /// Ties the following events to [userId], an opaque ID.
  Future<void> identify(String userId, TelemetryProperties? properties);

  /// Forgets the current user.
  Future<void> reset();

  /// Records that screen [name] is on top.
  Future<void> screen(String name, TelemetryProperties? properties);

  /// Records one occurrence of [event].
  Future<void> capture(String event, TelemetryProperties? properties);

  /// Adds [properties] to every later event.
  Future<void> register(TelemetryProperties properties);
}

/// A provider that sends nothing. Used until the app sets a real one, and in
/// tests.
class NoopTelemetryProvider implements TelemetryProvider {
  const NoopTelemetryProvider();

  @override
  String get name => 'noop';
  @override
  bool get isConfigured => false;
  @override
  Future<void> start() async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> identify(String userId, TelemetryProperties? properties) async {}
  @override
  Future<void> reset() async {}
  @override
  Future<void> screen(String name, TelemetryProperties? properties) async {}
  @override
  Future<void> capture(String event, TelemetryProperties? properties) async {}
  @override
  Future<void> register(TelemetryProperties properties) async {}
}
