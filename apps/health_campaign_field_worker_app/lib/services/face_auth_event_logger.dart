import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'location_service.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart';

import '../utils/environment_config.dart';

/// Incremented every time a face auth event is successfully written to the DB.
/// Widgets that display auth history (e.g. FaceAuthSessionCard) can listen to
/// this notifier to refresh without polling or manual coordination.
final ValueNotifier<int> faceAuthEventNotifier = ValueNotifier(0);

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
  /// Distributor attempted to scan the co-worker but closed without verifying.
  static const attempt = 'ATTEMPT';
}

/// Service that logs face authentication events to the local database.
/// Provides convenience methods for common event types.
class FaceAuthEventLogger {
  final LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>
      _repository;
  /// HCM individual ID — stored as event.individualId so the attendance
  /// card lookup (by attendee.individualId) finds this event.
  final String _individualId;
  /// System user UUID — stored in clientAuditDetails.createdBy so the sync
  /// service (which filters OpLog by loggedInUserUuid) picks this up.
  final String _userUuid;
  final String _projectId;
  final String _boundaryCode;
  final String _deviceId;
  /// Display name of the person being verified (e.g. co-worker name).
  /// Stored in additionalFields so the history page can show it.
  final String? subjectName;

  static const _uuid = Uuid();

  FaceAuthEventLogger({
    required LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>
        repository,
    required String userId,
    required String userUuid,
    required String projectId,
    required String boundaryCode,
    String deviceId = '',
    this.subjectName,
  })  : _repository = repository,
        _individualId = userId,
        _userUuid = userUuid,
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

  /// Log a missed re-verification event.
  /// [responseType] defaults to [FaceAuthResponseType.timeout] for distributor
  /// countdown expiry; pass [FaceAuthResponseType.attempt] when the distributor
  /// opened the co-worker scan screen but closed it without verifying.
  Future<void> logMissed({
    int? popupTime,
    double latitude = 0.0,
    double longitude = 0.0,
    double locationAccuracy = 0.0,
    String responseType = FaceAuthResponseType.timeout,
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
      responseType: responseType,
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
        individualId: _individualId,
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

  /// Silently reads current device location. Never shows permission dialogs —
  /// returns null immediately if service is off or permission not granted.
  /// Callers that run in the background (fire-and-forget log futures) must
  /// not trigger native dialogs that could disrupt the active UI flow.
  static Future<LocationData?> _getLocation() async {
    try {
      return await LocationService.instance
          .currentOrNext(timeout: const Duration(seconds: 4));
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
    // Capture timestamp immediately so it reflects when the event occurred,
    // not when the GPS fetch (below) finishes — GPS can take several seconds
    // and would otherwise make background-logged events appear newer than they are.
    final now = DateTime.now().millisecondsSinceEpoch;

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

    final additionalFieldsList = subjectName != null && subjectName!.isNotEmpty
        ? [AdditionalField('subjectName', subjectName)]
        : <AdditionalField>[];

    final event = FaceAuthEventModel(
      clientReferenceId: _uuid.v4(),
      individualId: _individualId,
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
      additionalFields: additionalFieldsList.isEmpty
          ? null
          : FaceAuthEventAdditionalFields(
              version: 1,
              fields: additionalFieldsList,
            ),
      auditDetails: AuditDetails(
        createdBy: _userUuid,
        createdTime: now,
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: _userUuid,
        createdTime: now,
        lastModifiedBy: _userUuid,
        lastModifiedTime: now,
      ),
    );

    try {
      await _repository.create(event);
      debugPrint(
        'FaceAuthEventLogger: logged $eventType/$outcome '
        '(confidence: $confidence)',
      );
      // Notify listeners (e.g. FaceAuthSessionCard) to refresh.
      faceAuthEventNotifier.value++;
    } catch (e) {
      debugPrint('FaceAuthEventLogger: failed to log event: $e');
    }
  }
}
