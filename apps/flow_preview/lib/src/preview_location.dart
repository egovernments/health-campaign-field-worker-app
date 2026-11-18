import 'dart:async';

import 'package:location/location.dart';

/// Stand-in for the device GPS: always "granted", always on, and always at a
/// fixed sample position with good accuracy, so GPS fields in a form can be
/// filled on a desktop browser (which usually reports 30–100 m) and the
/// reviewer's real location is never read.
///
/// Only the calls LocationBloc (digit_ui_components) makes are implemented.
/// Open the preview with `?gps=real` to use the browser's real GPS instead.
class PreviewLocation implements Location {
  /// Geographic centre of Nigeria (public reference point), matching the
  /// default boundary hierarchy; not a real household.
  static const double latitude = 9.0820;
  static const double longitude = 8.6753;
  static const double accuracyMeters = 3.0;

  LocationData get _sample => LocationData.fromMap({
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracyMeters,
        'altitude': 0.0,
        'speed': 0.0,
        'speed_accuracy': 0.0,
        'heading': 0.0,
        'time': DateTime.now().millisecondsSinceEpoch.toDouble(),
        'isMock': true,
        'satellite_number': 12,
      });

  @override
  Future<PermissionStatus> hasPermission() async => PermissionStatus.granted;

  @override
  Future<PermissionStatus> requestPermission() async => PermissionStatus.granted;

  @override
  Future<bool> serviceEnabled() async => true;

  @override
  Future<bool> requestService() async => true;

  @override
  Future<LocationData> getLocation() async => _sample;

  @override
  Stream<LocationData> get onLocationChanged =>
      Stream<LocationData>.periodic(const Duration(seconds: 1), (_) => _sample);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError(
      'Not available in the preview GPS stand-in: ${invocation.memberName}');
}
