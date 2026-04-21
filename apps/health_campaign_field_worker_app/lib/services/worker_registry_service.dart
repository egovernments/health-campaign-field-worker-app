import 'dart:convert';

import 'package:digit_face_verification/data/face_embedding_repository.dart';
import 'package:digit_face_verification/models/face_embedding_model.dart';
import 'package:digit_face_verification/models/face_enrollment_profile.dart';
import 'package:digit_ui_components/utils/app_logger.dart';
import 'package:dio/dio.dart';

/// Service that updates the Worker Registry with face enrollment details
/// after a successful face enrollment.
///
/// Flow: Search worker by individualId → Update worker's additionalFields
/// with face enrollment data.
class WorkerRegistryService {
  final Dio _dio;
  final String _tenantId;

  static const _searchPath = '/worker/v1/_search';
  static const _bulkUpdatePath = '/worker/v1/bulk/_update';

  WorkerRegistryService({
    required Dio dio,
    required String tenantId,
  })  : _dio = dio,
        _tenantId = tenantId;

  /// Returns true if a worker record exists for the given individualId.
  Future<bool> workerExists(String individualId) async {
    try {
      final worker = await _searchWorker(individualId);
      return worker != null;
    } catch (e) {
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message: 'Failed to check worker existence: $e',
      );
      return false;
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
      final worker = await _searchWorker(individualId);
      if (worker == null || !_isAlreadyEnrolled(worker)) return false;

      final fields = _getFields(worker);

      final embeddingStr = _field(fields, 'embedding');
      if (embeddingStr == null) return false;

      final embedding = (jsonDecode(embeddingStr) as List).cast<double>();
      final angleEmbeddingsStr = _field(fields, 'angleEmbeddings');
      final angleEmbeddings = angleEmbeddingsStr != null
          ? (jsonDecode(angleEmbeddingsStr) as List)
              .map((e) => (e as List).cast<double>())
              .toList()
          : <List<double>>[];

      final angleCount = int.tryParse(_field(fields, 'angleCount') ?? '') ?? 1;
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
        angleCount: angleCount,
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

      AppLogger.instance.info(
        'Face enrollment synced from registry for $individualId',
        title: 'WorkerRegistryService',
      );
      return true;
    } catch (e, stackTrace) {
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

    // Handle JSONB wrapper: value is a JSON-encoded string
    final valueStr = additionalDetails['value'] as String?;
    if (valueStr != null) {
      try {
        final decoded = jsonDecode(valueStr) as Map<String, dynamic>;
        return (decoded['fields'] as List?) ?? [];
      } catch (_) {}
    }

    // Fallback: already a plain object (e.g. from our own update response)
    return (additionalDetails['fields'] as List?) ?? [];
  }

  String? _field(List<dynamic> fields, String key) {
    for (final f in fields) {
      if (f['key'] == key) return f['value'] as String?;
    }
    return null;
  }

  /// Searches for the worker, then updates it with face enrollment details.
  Future<void> updateWorkerWithFaceEnrollment({
    required String individualId,
    required FaceEmbeddingRepository repository,
  }) async {
    try {
      final faceEmbedding = await repository.getEmbedding(individualId);
      final enrollmentProfile = await repository.getProfile(individualId);

      if (faceEmbedding == null || enrollmentProfile == null) {
        AppLogger.instance.error(
          title: 'WorkerRegistryService',
          message:
              'Face embedding or enrollment profile not found for $individualId',
        );
        return;
      }

      // Step 1: Search for the worker by individualId
      final worker = await _searchWorker(individualId);
      if (worker == null) {
        AppLogger.instance.error(
          title: 'WorkerRegistryService',
          message: 'No worker found for individualId: $individualId',
        );
        return;
      }

      // Step 2: Skip if already enrolled
      if (_isAlreadyEnrolled(worker)) {
        AppLogger.instance.info(
          'Worker already has face enrollment — skipping update',
          title: 'WorkerRegistryService',
        );
        return;
      }

      // Step 3: Update the worker with face enrollment details
      await _updateWorker(worker, faceEmbedding, enrollmentProfile);

      AppLogger.instance.info(
        'Worker updated with face enrollment details',
        title: 'WorkerRegistryService',
      );
    } catch (e, stackTrace) {
      AppLogger.instance.error(
        title: 'WorkerRegistryService',
        message:
            'Failed to update worker with face enrollment: $e\n$stackTrace',
      );
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
    if (data == null) return null;

    final workers = data['workers'] as List?;
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
