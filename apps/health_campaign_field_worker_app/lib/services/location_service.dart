import 'dart:async';

import 'package:location/location.dart';

/// App-wide single [Location] client with one continuous stream.
///
/// Previously several components (the face-auth captures, the registration
/// [LocationBloc], the background tracker) each created their own [Location]
/// and called `getLocation()`. On Android these share ONE native GPS/fused
/// client, so the repeated start/stop (visible as GNSS NMEA listener churn)
/// kept restarting the acquisition and a fix never settled -> slow/failed
/// captures. This service keeps ONE client streaming continuously; callers read
/// [current], which keeps updating as the worker moves (fresh, not a frozen
/// cache), so a capture is instant and up-to-date.
class LocationService {
  LocationService._();
  static final LocationService instance = LocationService._();

  /// The single shared client. Pass this to every [LocationBloc].
  final Location location = Location();

  StreamSubscription<LocationData>? _sub;
  LocationData? _latest;
  bool _starting = false;

  /// Latest fix, continuously updated. Null until the first fix arrives.
  LocationData? get current => _latest;

  /// Starts continuous tracking exactly once, and only when precise (FINE)
  /// permission + service are available. Idempotent; never throws (the plugin's
  /// GNSS/NMEA listener needs FINE, so calling changeSettings without it would
  /// crash — hence the strict `granted` guard).
  Future<void> ensureTracking() async {
    if (_sub != null || _starting) return;
    _starting = true;
    try {
      if (!await location.serviceEnabled()) return;
      if (await location.hasPermission() != PermissionStatus.granted) return;
      await location.changeSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );
      _sub = location.onLocationChanged.listen((d) {
        if (d.latitude != null && d.longitude != null) _latest = d;
      });
    } catch (_) {
      // Never crash the caller; tracking simply won't start.
    } finally {
      _starting = false;
    }
  }

  /// Returns the current fix immediately if tracking is warm; otherwise starts
  /// tracking and waits briefly for the first fix. Never throws.
  Future<LocationData?> currentOrNext({
    Duration timeout = const Duration(seconds: 4),
  }) async {
    if (_latest != null) return _latest;
    await ensureTracking();
    if (_latest != null) return _latest;
    try {
      return await location.onLocationChanged
          .firstWhere((d) => d.latitude != null && d.longitude != null)
          .timeout(timeout);
    } catch (_) {
      return _latest;
    }
  }
}
