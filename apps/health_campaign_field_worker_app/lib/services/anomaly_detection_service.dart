import 'dart:math';

import 'package:digit_data_model/models/entities/face_auth_event.dart';

/// Anomaly flags applied to FaceAuthEvent records.
class AnomalyFlags {
  static const String locationVelocity = 'LOCATION_VELOCITY_ANOMALY';
  static const String repeatedPinUse = 'REPEATED_PIN_USE';
  static const String missedReVerification = 'MISSED_REVERIFICATION';
  static const String fallbackOveruse = 'FALLBACK_OVERUSE';
}

/// Service that runs after each FaceAuthEvent to detect anomalies.
class AnomalyDetectionService {
  /// Maximum allowed velocity between consecutive events (km/h).
  final double maxVelocityKmH;

  /// Number of consecutive PIN uses that triggers a flag.
  final int maxConsecutivePinUses;

  /// Maximum fallback rate (0.0-1.0) over rolling period.
  final double maxFallbackRate;

  /// Rolling window size for fallback rate calculation.
  final int rollingWindowSize;

  const AnomalyDetectionService({
    this.maxVelocityKmH = 30.0,
    this.maxConsecutivePinUses = 3,
    this.maxFallbackRate = 0.5,
    this.rollingWindowSize = 10,
  });

  /// Analyze a new event against recent history and return anomaly flags.
  List<String> analyze(
    FaceAuthEventModel newEvent,
    List<FaceAuthEventModel> recentEvents,
  ) {
    final flags = <String>[];

    // Location velocity check
    if (recentEvents.isNotEmpty) {
      final prev = recentEvents.last;
      final velocityFlag = _checkLocationVelocity(newEvent, prev);
      if (velocityFlag != null) flags.add(velocityFlag);
    }

    // Repeated PIN use
    final pinFlag = _checkRepeatedPinUse(newEvent, recentEvents);
    if (pinFlag != null) flags.add(pinFlag);

    // Missed re-verification
    final missedFlag = _checkMissedReVerification(newEvent, recentEvents);
    if (missedFlag != null) flags.add(missedFlag);

    // Fallback overuse
    final fallbackFlag = _checkFallbackOveruse(newEvent, recentEvents);
    if (fallbackFlag != null) flags.add(fallbackFlag);

    return flags;
  }

  /// Check if travel speed between events is unreasonable.
  String? _checkLocationVelocity(
    FaceAuthEventModel current,
    FaceAuthEventModel previous,
  ) {
    final distance = _haversineDistance(
      previous.latitude,
      previous.longitude,
      current.latitude,
      current.longitude,
    );

    final timeDiffHours =
        (current.timestamp - previous.timestamp) / (1000.0 * 3600.0);

    if (timeDiffHours <= 0) return null;

    final velocityKmH = distance / timeDiffHours;

    if (velocityKmH > maxVelocityKmH) {
      return AnomalyFlags.locationVelocity;
    }
    return null;
  }

  /// Check for N consecutive PIN fallback events.
  String? _checkRepeatedPinUse(
    FaceAuthEventModel newEvent,
    List<FaceAuthEventModel> recent,
  ) {
    if (newEvent.outcome != 'PIN_FALLBACK') return null;

    int consecutivePin = 1;
    for (int i = recent.length - 1; i >= 0; i--) {
      if (recent[i].outcome == 'PIN_FALLBACK') {
        consecutivePin++;
      } else {
        break;
      }
    }

    if (consecutivePin >= maxConsecutivePinUses) {
      return AnomalyFlags.repeatedPinUse;
    }
    return null;
  }

  /// Check for any MISSED re-verification events today.
  String? _checkMissedReVerification(
    FaceAuthEventModel newEvent,
    List<FaceAuthEventModel> recent,
  ) {
    final today = DateTime.fromMillisecondsSinceEpoch(newEvent.timestamp);
    final startOfDay = DateTime(today.year, today.month, today.day)
        .millisecondsSinceEpoch;

    final todayEvents = recent.where((e) => e.timestamp >= startOfDay);
    final hasMissed = todayEvents.any((e) => e.outcome == 'MISSED');

    if (hasMissed) {
      return AnomalyFlags.missedReVerification;
    }
    return null;
  }

  /// Check if fallback rate exceeds threshold over rolling window.
  String? _checkFallbackOveruse(
    FaceAuthEventModel newEvent,
    List<FaceAuthEventModel> recent,
  ) {
    final window = recent.length > rollingWindowSize
        ? recent.sublist(recent.length - rollingWindowSize)
        : recent;

    if (window.isEmpty) return null;

    final allEvents = [...window, newEvent];
    final fallbackCount = allEvents
        .where((e) =>
            e.outcome == 'PIN_FALLBACK' || e.outcome == 'HCM_FALLBACK')
        .length;

    final rate = fallbackCount / allEvents.length;

    if (rate > maxFallbackRate) {
      return AnomalyFlags.fallbackOveruse;
    }
    return null;
  }

  /// Haversine distance in kilometers.
  double _haversineDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371.0; // km

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180.0;
}
