import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_face_verification/data/face_embedding_repository.dart';
import 'package:digit_face_verification/models/face_embedding_model.dart';
import 'package:digit_face_verification/models/face_enrollment_profile.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../data/local_store/no_sql/schema/service_registry.dart';
import '../utils/constants.dart';

/// Service that updates the Worker Registry with face enrollment details
/// after a successful face enrollment.
///
/// Flow: Search worker by individualId → Update worker's additionalFields
/// with face enrollment data.
class WorkerRegistryService {
  final Dio _dio;
  final String _tenantId;
  final String _searchPath;
  final String _bulkUpdatePath;

  /// Fallback paths used only when the ServiceRegistry MDMS entry is
  /// missing on the server. Kept so older tenants that haven't rolled
  /// out the mapping keep working.
  static const _defaultSearchPath = '/worker/v1/_search';
  static const _defaultBulkUpdatePath = '/worker/v1/bulk/_update';

  /// MDMS ServiceRegistry lookup keys. Ops must configure a `WORKER`
  /// service with `Worker` entity actions `search` and `bulk_update`
  /// for the path override to take effect.
  static const _mdmsService = 'WORKER';
  static const _mdmsEntity = 'Worker';

  WorkerRegistryService({
    required Dio dio,
    required String tenantId,
    String? searchPath,
    String? bulkUpdatePath,
  })  : _dio = dio,
        _tenantId = tenantId,
        _searchPath = searchPath ?? _defaultSearchPath,
        _bulkUpdatePath = bulkUpdatePath ?? _defaultBulkUpdatePath;

  /// Resolves worker registry paths from the MDMS ServiceRegistry.
  /// Falls back to compile-time defaults when the registry does not
  /// contain the `WORKER` service entry.
  factory WorkerRegistryService.fromServiceRegistry({
    required Dio dio,
    required String tenantId,
    required List<ServiceRegistry> serviceRegistry,
  }) {
    String resolve(String action, String fallback) {
      final path = Constants.getMultiLoginEndPoint(
        serviceRegistry: serviceRegistry,
        service: _mdmsService,
        entityName: _mdmsEntity,
        action: action,
      );
      return path.isEmpty ? fallback : path;
    }

    return WorkerRegistryService(
      dio: dio,
      tenantId: tenantId,
      searchPath: resolve(ApiOperation.search.toValue(), _defaultSearchPath),
      bulkUpdatePath:
          resolve(ApiOperation.bulkUpdate.toValue(), _defaultBulkUpdatePath),
    );
  }

  /// Returns true if a worker record exists for the given individualId.
  /// Fails open on network/API errors — only returns false when the server
  /// definitively responds with an empty workers list.
  Future<bool> workerExists(String individualId) async {
    try {
      final worker = await _searchWorker(individualId);
      return worker != null;
    } catch (e) {
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message: 'Failed to check worker existence (fail-open): $e',
      );
      // Network/server error — fail open so users are not blocked by
      // transient connectivity issues.
      return true;
    }
  }

  /// Returns true if the worker's registry entry already has faceEnrolled=true.
  Future<bool> isWorkerEnrolled(String individualId) async {
    try {
      final worker = await _searchWorker(individualId);
      if (worker == null) return false;
      return _isAlreadyEnrolled(worker);
    } catch (e) {
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message: 'Failed to check enrollment status: $e',
      );
      return false;
    }
  }

  /// If the worker registry has face enrollment data, syncs it to the local
  /// [repository] so the device doesn't ask for re-enrollment on next login.
  /// Returns true if sync was performed (enrollment data found and saved).
  Future<bool> syncEnrollmentFromRegistry({
    required String individualId,
    required FaceEmbeddingRepository repository,
  }) async {
    try {
      debugPrint(
          '[FaceRegistrySync] syncEnrollmentFromRegistry: individualId=$individualId');
      final worker = await _searchWorker(individualId);
      final alreadyEnrolled = worker != null && _isAlreadyEnrolled(worker);
      debugPrint(
          '[FaceRegistrySync] workerFound=${worker != null} faceEnrolled=$alreadyEnrolled');
      if (worker == null || !alreadyEnrolled) return false;

      final fields = _getFields(worker);

      final embeddingStr = _field(fields, 'embedding');
      debugPrint(
          '[FaceRegistrySync] embeddingField=${embeddingStr == null ? "MISSING" : "present(len=${embeddingStr.length})"} fieldCount=${fields.length}');
      if (embeddingStr == null) return false;

      final embedding = (jsonDecode(embeddingStr) as List).cast<double>();
      final angleEmbeddingsStr = _field(fields, 'angleEmbeddings');
      final angleEmbeddings = angleEmbeddingsStr != null
          ? (jsonDecode(angleEmbeddingsStr) as List)
              .map((e) => (e as List).cast<double>())
              .toList()
          : <List<double>>[];

      final modelVersion = _field(fields, 'modelVersion') ?? '';
      final isSystemUser = _field(fields, 'isSystemUser') == 'true';
      final enrolledBy = _field(fields, 'enrolledBy') ?? '';
      final embeddingCreatedAt = int.tryParse(
            _field(fields, 'embeddingCreatedAt') ?? '',
          ) ??
          DateTime.now().millisecondsSinceEpoch;

      await repository.saveEmbedding(
        individualId: individualId,
        embedding: embedding,
        angleEmbeddings: angleEmbeddings,
        isSystemUser: isSystemUser,
        enrolledBy: enrolledBy,
        modelVersion: modelVersion,
      );

      final enrolledAt = int.tryParse(_field(fields, 'enrolledAt') ?? '') ??
          DateTime.now().millisecondsSinceEpoch;
      final enrolledByUserId = _field(fields, 'enrolledByUserId') ?? '';
      final supervisorApprovalStatus =
          _field(fields, 'supervisorApprovalStatus') ?? 'pending';
      final twinFlagged = _field(fields, 'twinFlagged') == 'true';
      final pinHash = _field(fields, 'pinHash') ?? '';
      final pinSalt = _field(fields, 'pinSalt') ?? '';

      await repository.saveProfile(FaceEnrollmentProfile(
        individualId: individualId,
        pinHash: pinHash,
        pinSalt: pinSalt,
        isSystemUser: isSystemUser,
        enrolledByUserId: enrolledByUserId,
        enrolledAt: DateTime.fromMillisecondsSinceEpoch(enrolledAt),
        supervisorApprovalStatus: supervisorApprovalStatus,
        twinFlagged: twinFlagged,
      ));

      debugPrint(
          '[FaceRegistrySync] SUCCESS — enrollment restored locally for $individualId');
      AppLogger.instance.info(
        'Face enrollment synced from registry for $individualId',
        title: 'WorkerRegistryService',
      );
      return true;
    } catch (e, stackTrace) {
      debugPrint('[FaceRegistrySync] ERROR — sync threw: $e');
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message: 'Failed to sync enrollment from registry: $e\n$stackTrace',
      );
      return false;
    }
  }

  /// Extracts the fields list from additionalDetails.
  /// The server wraps JSONB as: { "type": "jsonb", "value": "{\"fields\":[...]}", "null": false }
  /// so we must decode the "value" string first.
  List<dynamic> _getFields(Map<String, dynamic> worker) {
    final additionalDetails =
        worker['additionalDetails'] as Map<String, dynamic>?;
    if (additionalDetails == null) return [];

    // Try every known format so a parse failure never silently returns [].

    // Format 1 — JSONB wrapper: { "value": "{\"fields\":[...]}", ... }
    final valueStr = additionalDetails['value'];
    if (valueStr is String && valueStr.isNotEmpty) {
      try {
        final decoded = jsonDecode(valueStr);
        if (decoded is Map) {
          final fields = decoded['fields'];
          if (fields is List) return fields;
        }
        // Some servers put the array directly as the value string
        if (decoded is List) return decoded;
      } catch (_) {}
    }

    // Format 2 — plain object from our own update: { "fields": [...] }
    final fields = additionalDetails['fields'];
    if (fields is List) return fields;

    return [];
  }

  String? _field(List<dynamic> fields, String key) {
    for (final f in fields) {
      if (f['key'] == key) return f['value'] as String?;
    }
    return null;
  }

  /// Searches for the worker, then updates it with face enrollment details.
  ///
  /// Returns:
  ///   * true  — server confirmed the update OR the worker is already enrolled
  ///             (idempotent success; no further retry needed).
  ///   * false — network/server failure (DioException etc). Caller should keep
  ///             the individualId queued for retry on connectivity-restore.
  ///
  /// Previously this method swallowed all exceptions, which caused offline
  /// enrollments to look like silent successes and the pending-sync queue to
  /// be cleared before the retry could run.
  Future<bool> updateWorkerWithFaceEnrollment({
    required String individualId,
    required FaceEmbeddingRepository repository,
  }) async {
    try {
      debugPrint(
          '[FaceRegistryPush] updateWorkerWithFaceEnrollment: individualId=$individualId');
      final faceEmbedding = await repository.getEmbedding(individualId);
      final enrollmentProfile = await repository.getProfile(individualId);

      if (faceEmbedding == null || enrollmentProfile == null) {
        debugPrint(
            '[FaceRegistryPush] ABORT — local embedding=${faceEmbedding != null} profile=${enrollmentProfile != null}');
        AppLogger.instance.error(
          title: 'WorkerRegistryService',
          message:
              'Face embedding or enrollment profile not found for $individualId',
        );
        // Treat missing local data as terminal — retrying won't help. Return
        // true so the pending-sync queue clears.
        return true;
      }

      // Step 1: Search for the worker by individualId
      final worker = await _searchWorker(individualId);
      if (worker == null) {
        debugPrint(
            '[FaceRegistryPush] ABORT — no worker found in registry for $individualId (nothing to pull back later)');
        AppLogger.instance.error(
          title: 'WorkerRegistryService',
          message: 'No worker found for individualId: $individualId',
        );
        // Worker not in registry on the server. Retrying won't help —
        // treat as terminal so the queue clears.
        return true;
      }

      // Step 2: Skip if already enrolled
      if (_isAlreadyEnrolled(worker)) {
        debugPrint(
            '[FaceRegistryPush] worker already faceEnrolled — skipping update');
        AppLogger.instance.info(
          'Worker already has face enrollment — skipping update',
          title: 'WorkerRegistryService',
        );
        return true;
      }

      // Step 3: Update the worker with face enrollment details
      await _updateWorker(worker, faceEmbedding, enrollmentProfile);

      debugPrint(
          '[FaceRegistryPush] SUCCESS — pushed faceEnrolled+embedding to registry for $individualId');
      AppLogger.instance.info(
        'Worker updated with face enrollment details',
        title: 'WorkerRegistryService',
      );
      return true;
    } on DioException catch (e, stackTrace) {
      debugPrint(
          '[FaceRegistryPush] NETWORK FAILURE (kept pending for retry): ${e.message}');
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message:
            'Network failure updating worker (will retry on reconnect): $e\n$stackTrace',
      );
      return false;
    } catch (e, stackTrace) {
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message:
            'Failed to update worker with face enrollment: $e\n$stackTrace',
      );
      return false;
    }
  }

  /// Checks if the worker's additionalDetails already contains face enrollment data.
  bool _isAlreadyEnrolled(Map<String, dynamic> worker) {
    final fields = _getFields(worker);
    return fields.any(
      (f) => f['key'] == 'faceEnrolled' && f['value'] == 'true',
    );
  }

  Future<Map<String, dynamic>?> _searchWorker(String individualId) async {
    debugPrint(
        '[FaceRegistrySync] _searchWorker POST $_searchPath tenantId=$_tenantId individualId=$individualId');
    final response = await _dio.post(
      _searchPath,
      queryParameters: {
        'tenantId': _tenantId,
        'limit': 10,
        'offset': 0,
      },
      data: {
        'workerSearch': {
          'tenantId': _tenantId,
          'individualId': [individualId],
        },
      },
    );

    final data = response.data as Map<String, dynamic>?;
    if (data == null) {
      debugPrint('[FaceRegistrySync] _searchWorker: response.data is null');
      return null;
    }

    final workers = data['workers'] as List?;
    debugPrint(
        '[FaceRegistrySync] _searchWorker: workersReturned=${workers?.length ?? 0}');
    if (workers == null || workers.isEmpty) return null;

    return workers.first as Map<String, dynamic>;
  }

  Future<void> _updateWorker(
    Map<String, dynamic> worker,
    FaceEmbedding faceEmbedding,
    FaceEnrollmentProfile enrollmentProfile,
  ) async {
    final faceFields = <Map<String, String>>[
      {'key': 'faceEnrolled', 'value': 'true'},
      {'key': 'embedding', 'value': jsonEncode(faceEmbedding.embedding)},
      {'key': 'angleEmbeddings', 'value': jsonEncode(faceEmbedding.angleEmbeddings)},
      {'key': 'angleCount', 'value': faceEmbedding.angleCount.toString()},
      {'key': 'modelVersion', 'value': faceEmbedding.modelVersion},
      {'key': 'isSystemUser', 'value': faceEmbedding.isSystemUser.toString()},
      {'key': 'enrolledBy', 'value': faceEmbedding.enrolledBy},
      {'key': 'embeddingCreatedAt', 'value': faceEmbedding.createdAt.millisecondsSinceEpoch.toString()},
      {'key': 'enrolledAt', 'value': enrollmentProfile.enrolledAt.millisecondsSinceEpoch.toString()},
      {'key': 'enrolledByUserId', 'value': enrollmentProfile.enrolledByUserId},
      {'key': 'supervisorApprovalStatus', 'value': enrollmentProfile.supervisorApprovalStatus},
      {'key': 'twinFlagged', 'value': enrollmentProfile.twinFlagged.toString()},
      {'key': 'pinHash', 'value': enrollmentProfile.pinHash},
      {'key': 'pinSalt', 'value': enrollmentProfile.pinSalt},
    ];

    final updatedWorker = {
      ...worker,
      'additionalDetails': {
        'fields': faceFields,
      },
    };

    await _dio.post(
      _bulkUpdatePath,
      queryParameters: {
        'tenantId': _tenantId,
      },
      data: {
        'workers': [updatedWorker],
      },
    );
  }
}
