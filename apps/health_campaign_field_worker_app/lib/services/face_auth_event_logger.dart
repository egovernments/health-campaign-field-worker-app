import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';

import '../utils/environment_config.dart';

/// Event types for face authentication logging.
class FaceAuthEventType {
  static const login = 'LOGIN';
  static const checkIn = 'CHECK_IN';
  static const reVerify = 'RE_VERIFY';
  static const enrollment = 'ENROLLMENT';
}

/// Outcomes for face authentication events.
class FaceAuthOutcome {
  static const faceSuccess = 'FACE_SUCCESS';
  static const faceRejected = 'FACE_REJECTED';
  static const pinFallback = 'PIN_FALLBACK';
  static const hcmFallback = 'HCM_FALLBACK';
  static const missed = 'MISSED';
}

/// Response types for re-verification prompts.
class FaceAuthResponseType {
  static const face = 'FACE';
  static const pin = 'PIN';
  static const dismiss = 'DISMISS';
  static const timeout = 'TIMEOUT';
}

/// Service that logs face authentication events to the local database.
/// Provides convenience methods for common event types.
class FaceAuthEventLogger {
  final LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>
      _repository;
  final String _userId;
  final String _projectId;
  final String _boundaryCode;
  final String _deviceId;

  static const _uuid = Uuid();

  FaceAuthEventLogger({
    required LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>
        repository,
    required String userId,
    required String projectId,
    required String boundaryCode,
    String deviceId = '',
  })  : _repository = repository,
        _userId = userId,
        _projectId = projectId,
        _boundaryCode = boundaryCode,
        _deviceId = deviceId;

  /// Log a face verification success (login or check-in).
  Future<void> logFaceSuccess({
    required String eventType,
    required double confidence,
    Uint8List? faceImageBytes,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
    int failedAttemptCount = 0,
    int? popupTime,
    int? responseTime,
  }) {
    return _log(
      eventType: eventType,
      outcome: FaceAuthOutcome.faceSuccess,
      confidence: confidence,
      faceImage: faceImageBytes != null ? base64Encode(faceImageBytes) : null,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      failedAttemptCount: failedAttemptCount,
      popupTime: popupTime,
      responseTime: responseTime,
      responseType: FaceAuthResponseType.face,
    );
  }

  /// Log a face verification rejection.
  Future<void> logFaceRejected({
    required String eventType,
    required double confidence,
    required int failedAttemptCount,
    Uint8List? faceImageBytes,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
  }) {
    return _log(
      eventType: eventType,
      outcome: FaceAuthOutcome.faceRejected,
      confidence: confidence,
      faceImage: faceImageBytes != null ? base64Encode(faceImageBytes) : null,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      failedAttemptCount: failedAttemptCount,
    );
  }

  /// Log a PIN fallback verification.
  Future<void> logPinFallback({
    required String eventType,
    String? fallbackReason,
    int failedAttemptCount = 0,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
    int? popupTime,
    int? responseTime,
  }) {
    return _log(
      eventType: eventType,
      outcome: FaceAuthOutcome.pinFallback,
      confidence: 0.0,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      failedAttemptCount: failedAttemptCount,
      fallbackReason: fallbackReason,
      popupTime: popupTime,
      responseTime: responseTime,
      responseType: FaceAuthResponseType.pin,
    );
  }

  /// Log a missed re-verification (timeout without response).
  Future<void> logMissed({
    int? popupTime,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
  }) {
    return _log(
      eventType: FaceAuthEventType.reVerify,
      outcome: FaceAuthOutcome.missed,
      confidence: 0.0,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      failedAttemptCount: 0,
      popupTime: popupTime,
      responseType: FaceAuthResponseType.timeout,
    );
  }

  /// Log an enrollment event.
  Future<void> logEnrollment({
    required bool success,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
  }) {
    return _log(
      eventType: FaceAuthEventType.enrollment,
      outcome:
          success ? FaceAuthOutcome.faceSuccess : FaceAuthOutcome.faceRejected,
      confidence: 0.0,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      failedAttemptCount: 0,
    );
  }

  /// Fetch recent events for display in the attendance history.
  Future<List<FaceAuthEventModel>> getRecentEvents({
    int limit = 50,
  }) async {
    final events = await _repository.search(
      FaceAuthEventSearchModel(
        individualId: _userId,
        projectId: _projectId,
      ),
    );
    // Sort by timestamp descending, take most recent
    events.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return events.take(limit).toList();
  }

  /// Get the last successful verification event.
  Future<FaceAuthEventModel?> getLastVerification() async {
    final events = await getRecentEvents(limit: 20);
    try {
      return events.firstWhere(
        (e) =>
            e.outcome == FaceAuthOutcome.faceSuccess ||
            e.outcome == FaceAuthOutcome.pinFallback,
      );
    } catch (_) {
      return null;
    }
  }

  /// Try to get current device location. Returns null on failure.
  static Future<LocationData?> _getLocation() async {
    try {
      final location = Location();
      if (!await location.serviceEnabled()) {
        if (!await location.requestService()) return null;
      }
      var perm = await location.hasPermission();
      if (perm == PermissionStatus.denied) {
        perm = await location.requestPermission();
        if (perm != PermissionStatus.granted &&
            perm != PermissionStatus.grantedLimited) {
          return null;
        }
      }
      return await location.getLocation().timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw TimeoutException('Location timeout'),
          );
    } catch (e) {
      debugPrint('FaceAuthEventLogger: location error: $e');
      return null;
    }
  }

  Future<void> _log({
    required String eventType,
    required String outcome,
    required double confidence,
    required double latitude,
    required double longitude,
    required double locationAccuracy,
    required int failedAttemptCount,
    String? fallbackReason,
    String? faceImage,
    int? popupTime,
    int? responseTime,
    String? responseType,
    String? anomalyFlags,
  }) async {
    // Auto-capture location if not provided
    double lat = latitude;
    double lng = longitude;
    double locAcc = locationAccuracy;
    if (lat == 0.0 && lng == 0.0) {
      final loc = await _getLocation();
      if (loc != null) {
        lat = loc.latitude ?? 0.0;
        lng = loc.longitude ?? 0.0;
        locAcc = loc.accuracy ?? 0.0;
      }
    }

    final now = DateTime.now().millisecondsSinceEpoch;
    final event = FaceAuthEventModel(
      clientReferenceId: _uuid.v4(),
      individualId: _userId,
      deviceId: _deviceId,
      eventType: eventType,
      outcome: outcome,
      confidence: confidence,
      latitude: lat,
      longitude: lng,
      locationAccuracy: locAcc,
      timestamp: now,
      failedAttemptCount: failedAttemptCount,
      fallbackReason: fallbackReason,
      popupTime: popupTime,
      responseTime: responseTime,
      responseType: responseType,
      projectId: _projectId,
      anomalyFlags: anomalyFlags,
      faceImage: faceImage,
      isSync: false,
      boundaryCode: _boundaryCode,
      tenantId: envConfig.variables.tenantId,
      auditDetails: AuditDetails(
        createdBy: _userId,
        createdTime: now,
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: _userId,
        createdTime: now,
      ),
    );

    try {
      await _repository.create(event);
      debugPrint(
        'FaceAuthEventLogger: logged $eventType/$outcome '
        '(confidence: $confidence)',
      );
    } catch (e) {
      debugPrint('FaceAuthEventLogger: failed to log event: $e');
    }
  }
}
