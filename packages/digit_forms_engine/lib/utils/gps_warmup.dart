import 'dart:async';

import 'package:location/location.dart';

import '../models/property_schema/property_schema.dart';
import '../models/schema_object/schema_object.dart';

/// Shared high-accuracy GPS session, reference-counted across holders.
///
/// Opening a form that contains a location field acquires it so the receiver
/// is already converging by the time the field is reached (ODK Collect's
/// "warm the GPS" advice); the capture dialog acquires it too. While held, the
/// location plugin requests high-accuracy fixes every second. When the last
/// holder releases it, the plugin goes back to its defaults (high, 5 s).
///
/// Plugin settings are global, which is why this is a single shared instance
/// rather than per-widget logic that could undo another holder's settings.
class GpsWarmup {
  GpsWarmup._();

  static final GpsWarmup instance = GpsWarmup._();

  static const int activeIntervalMs = 1000;
  static const int defaultIntervalMs = 5000;

  final Location _location = Location();
  int _holders = 0;
  bool _applied = false;
  StreamSubscription<LocationData>? _keepAlive;

  bool get isActive => _applied;

  void acquire() {
    _holders++;
    ensureActive();
  }

  void release() {
    if (_holders == 0) return;
    _holders--;
    if (_holders == 0) _deactivate();
  }

  /// Applies the fast settings if held and not yet applied. changeSettings
  /// restarts native updates, which needs precise (FINE) permission, so
  /// without it this is a no-op; callers retry once a reading arrives. This
  /// never prompts for permission itself.
  Future<void> ensureActive() async {
    if (_holders == 0 || _applied) return;
    try {
      if (await _location.hasPermission() != PermissionStatus.granted) return;
      if (_holders == 0 || _applied) return;
      _applied = true;
      await _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: activeIntervalMs,
        distanceFilter: 0,
      );
      // Keep native updates flowing even if nothing else is listening yet.
      _keepAlive ??= _location.onLocationChanged.listen(
        (_) {},
        onError: (_) {},
      );
      // Released while changeSettings was in flight.
      if (_holders == 0) _deactivate();
    } catch (_) {
      // Location still works at the current rate; only speed is affected.
      _applied = false;
    }
  }

  Future<void> _deactivate() async {
    await _keepAlive?.cancel();
    _keepAlive = null;
    if (!_applied) return;
    _applied = false;
    try {
      await _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: defaultIntervalMs,
        distanceFilter: 0,
      );
    } catch (_) {
      // Ignore: the next changeSettings caller overrides these anyway.
    }
  }

  /// Whether any page of [schema] has a location (latLng) field.
  static bool schemaHasLocationField(SchemaObject schema) =>
      schema.pages.values.any(_hasLocationField);

  static bool _hasLocationField(PropertySchema property) =>
      property.format == PropertySchemaFormat.latLng ||
      (property.properties?.values.any(_hasLocationField) ?? false);
}
