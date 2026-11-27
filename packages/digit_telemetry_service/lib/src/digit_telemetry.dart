import 'package:flutter/foundation.dart';

import 'telemetry_provider.dart';

/// The telemetry API the app uses. It never names a telemetry tool.
///
/// Rules for every implementation:
/// - Calls never throw. Telemetry must not break a user action.
/// - Calls made while stopped are dropped, except [identify] and
///   [setSuperProperties], which are remembered and applied on [start].
/// - Property values are labels only (module, screen, label key, counts).
///   Never pass beneficiary IDs, names, phone numbers or typed form values.
abstract class TelemetryService {
  /// Whether events are being sent right now: configured and started.
  bool get isEnabled;

  /// Starts sending events. Calling it again while started does nothing.
  Future<void> start();

  /// Stops sending events.
  Future<void> stop();

  /// Ties the following events to the logged-in user. [userId] must be an
  /// opaque ID (the user UUID), never a name or phone number.
  Future<void> identify(String userId, {TelemetryProperties? properties});

  /// Forgets the current user. Called on logout.
  Future<void> reset();

  /// Records that [name] is now the screen on top.
  Future<void> screen(String name, {TelemetryProperties? properties});

  /// Records one occurrence of [event].
  Future<void> track(String event, {TelemetryProperties? properties});

  /// Adds [properties] to every later event, e.g. campaign and tenant.
  /// Keys already set are overwritten; other keys are kept.
  Future<void> setSuperProperties(TelemetryProperties properties);
}

/// [TelemetryService] that sends through an [TelemetryProvider].
///
/// Provider-independent work happens here, once for every tool:
/// - remembering identity and super properties until [start]
/// - dropping properties that look like personal data, and values that are
///   not a [String], [num] or [bool]
/// - catching every provider error
class DigitTelemetry implements TelemetryService {
  DigitTelemetry(this._provider);

  /// Set by [initialize]. Private, so no other code can replace it.
  static TelemetryService? _instance;

  /// Returned in release builds when [instance] is read before [initialize].
  static final TelemetryService _noop =
      DigitTelemetry(const NoopTelemetryProvider());

  /// The app's telemetry. Read-only; set once by [initialize].
  ///
  /// Reading it before [initialize] is a programming error: debug builds
  /// fail with an [AssertionError] so the mistake is caught early, and
  /// release builds get an instance that sends nothing, so telemetry can
  /// never crash the app.
  static TelemetryService get instance {
    final current = _instance;
    if (current != null) return current;
    assert(
      false,
      'DigitTelemetry.initialize() must be called before using '
      'DigitTelemetry.instance.',
    );
    return _noop;
  }

  /// Sets up [instance] with [provider]. Call once at app start.
  static DigitTelemetry initialize(TelemetryProvider provider) {
    final telemetry = DigitTelemetry(provider);
    _instance = telemetry;
    return telemetry;
  }

  /// Forgets the instance, so a test can check behaviour before
  /// [initialize]. Never call this from app code.
  @visibleForTesting
  static void resetForTesting() => _instance = null;

  final TelemetryProvider _provider;

  bool _enabled = false;
  String? _userId;
  TelemetryProperties? _userProperties;
  final TelemetryProperties _superProperties = {};

  /// Key parts (split on `_`) that mark personal data. A key containing any
  /// of them is never sent, whatever the caller passes.
  static const _personalParts = {
    'phone',
    'mobile',
    'email',
    'address',
    'dob',
    'birth',
    'birthdate',
    'aadhaar',
    'password',
    'token',
    'otp',
  };

  /// Whole keys that name a person (`flow_name` or `screen_name` are fine).
  static const _personalKeys = {
    'name',
    'first_name',
    'last_name',
    'given_name',
    'family_name',
    'full_name',
    'head_name',
    'user_name',
    'username',
    'beneficiary_name',
    'individual_name',
  };

  @visibleForTesting
  static bool isPersonalKey(String key) {
    final lower = key.toLowerCase();
    if (_personalKeys.contains(lower)) return true;
    return lower.split(RegExp(r'[_\-. ]')).any(_personalParts.contains);
  }

  /// Longest text value sent; longer text is cut.
  static const maxTextLength = 200;

  @override
  bool get isEnabled => _enabled;

  @override
  Future<void> start() async {
    if (_enabled || !_safeIsConfigured) return;
    await _safely(() async {
      await _provider.start();
      _enabled = true;
      if (_superProperties.isNotEmpty) {
        await _provider.register(Map.of(_superProperties));
      }
      final userId = _userId;
      if (userId != null) await _provider.identify(userId, _userProperties);
    });
  }

  @override
  Future<void> stop() async {
    if (!_enabled) return;
    _enabled = false;
    await _safely(_provider.stop);
  }

  @override
  Future<void> identify(String userId, {TelemetryProperties? properties}) {
    _userId = userId;
    _userProperties = clean(properties);
    if (!_enabled) return Future.value();
    return _safely(() => _provider.identify(userId, _userProperties));
  }

  @override
  Future<void> reset() {
    _userId = null;
    _userProperties = null;
    if (!_enabled) return Future.value();
    return _safely(_provider.reset);
  }

  @override
  Future<void> screen(String name, {TelemetryProperties? properties}) {
    if (!_enabled) return Future.value();
    return _safely(() => _provider.screen(name, clean(properties)));
  }

  @override
  Future<void> track(String event, {TelemetryProperties? properties}) {
    if (!_enabled) return Future.value();
    return _safely(() => _provider.capture(event, clean(properties)));
  }

  @override
  Future<void> setSuperProperties(TelemetryProperties properties) async {
    final cleaned = clean(properties) ?? const {};
    _superProperties.addAll(cleaned);
    if (!_enabled || cleaned.isEmpty) return;
    await _safely(() => _provider.register(cleaned));
  }

  /// [properties] without personal-looking keys or unsupported values, with
  /// long text cut to [maxTextLength].
  @visibleForTesting
  static TelemetryProperties? clean(TelemetryProperties? properties) {
    if (properties == null) return null;
    final cleaned = <String, Object>{};
    for (final entry in properties.entries) {
      if (isPersonalKey(entry.key)) continue;
      final value = entry.value;
      if (value is String) {
        cleaned[entry.key] = value.length > maxTextLength
            ? value.substring(0, maxTextLength)
            : value;
      } else if (value is num || value is bool) {
        cleaned[entry.key] = value;
      }
    }
    return cleaned;
  }

  bool get _safeIsConfigured {
    try {
      return _provider.isConfigured;
    } catch (_) {
      return false;
    }
  }

  Future<void> _safely(Future<void> Function() call) async {
    try {
      await call();
    } catch (error) {
      debugPrint('Telemetry (${_provider.name}) call failed: $error');
    }
  }
}
