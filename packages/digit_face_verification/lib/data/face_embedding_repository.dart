import 'package:isar/isar.dart';

import '../models/face_embedding_model.dart';
import '../models/face_enrollment_profile.dart';

/// Repository for storing and retrieving face embeddings and enrollment profiles via Isar.
class FaceEmbeddingRepository {
  final Isar _isar;

  FaceEmbeddingRepository(this._isar);

  // ── Face Embedding CRUD ──

  /// Saves a face embedding for the given individual.
  /// Replaces any existing embedding for the same individualId.
  Future<void> saveEmbedding({
    required String individualId,
    required List<double> embedding,
    List<List<double>> angleEmbeddings = const [],
    bool isSystemUser = true,
    String enrolledBy = '',
    String modelVersion = 'mobilefacenet_african_v2',
  }) async {
    final faceEmbedding = FaceEmbedding(
      individualId: individualId,
      embedding: embedding,
      angleEmbeddingsList: angleEmbeddings,
      // Derive from list length to prevent caller-supplied mismatch.
      angleCount: angleEmbeddings.isEmpty ? 1 : angleEmbeddings.length,
      isSystemUser: isSystemUser,
      enrolledBy: enrolledBy,
      createdAt: DateTime.now(),
      modelVersion: modelVersion,
    );

    await _isar.writeTxn(() async {
      await _isar.faceEmbeddings.put(faceEmbedding);
    });
  }

  /// Atomically saves both the embedding and enrollment profile in one transaction.
  /// Use instead of calling [saveEmbedding] + [saveProfile] separately, so a failure
  /// between the two writes cannot leave the account in an un-enrollable state.
  Future<void> saveEmbeddingAndProfile({
    required String individualId,
    required List<double> embedding,
    List<List<double>> angleEmbeddings = const [],
    bool isSystemUser = true,
    String enrolledBy = '',
    String modelVersion = 'mobilefacenet_african_v2',
    required FaceEnrollmentProfile profile,
  }) async {
    final faceEmbedding = FaceEmbedding(
      individualId: individualId,
      embedding: embedding,
      angleEmbeddingsList: angleEmbeddings,
      angleCount: angleEmbeddings.isEmpty ? 1 : angleEmbeddings.length,
      isSystemUser: isSystemUser,
      enrolledBy: enrolledBy,
      createdAt: DateTime.now(),
      modelVersion: modelVersion,
    );

    await _isar.writeTxn(() async {
      await _isar.faceEmbeddings.put(faceEmbedding);
      await _isar.faceEnrollmentProfiles.put(profile);
    });
  }

  /// Retrieves the stored embedding for an individual.
  /// Returns null if no embedding exists.
  Future<FaceEmbedding?> getEmbedding(String individualId) async {
    return _isar.faceEmbeddings
        .where()
        .individualIdEqualTo(individualId)
        .findFirst();
  }

  /// Retrieves ALL stored embeddings (for login matching against all enrolled users).
  Future<List<FaceEmbedding>> getAllEmbeddings() async {
    return _isar.faceEmbeddings.where().findAll();
  }

  /// Retrieves only non-system user (co-worker) embeddings.
  Future<List<FaceEmbedding>> getNonSystemUserEmbeddings() async {
    return _isar.faceEmbeddings
        .filter()
        .isSystemUserEqualTo(false)
        .findAll();
  }

  /// Checks whether a face embedding exists for the given individual.
  Future<bool> hasEmbedding(String individualId) async {
    final count = await _isar.faceEmbeddings
        .where()
        .individualIdEqualTo(individualId)
        .count();
    return count > 0;
  }

  /// Deletes the face embedding for an individual.
  Future<void> deleteEmbedding(String individualId) async {
    await _isar.writeTxn(() async {
      await _isar.faceEmbeddings
          .where()
          .individualIdEqualTo(individualId)
          .deleteAll();
    });
  }

  /// Returns the count of all stored embeddings (profile count).
  Future<int> count() async {
    return _isar.faceEmbeddings.count();
  }

  /// Returns the count of locally enrolled profiles.
  /// Excludes phantom profiles created by [updateLastVerified] for registry-synced
  /// co-workers (those have an empty pinHash).
  Future<int> getProfileCount() async {
    return _isar.faceEnrollmentProfiles
        .filter()
        .not()
        .pinHashEqualTo('')
        .count();
  }

  // ── Enrollment Profile CRUD ──

  /// Saves or updates an enrollment profile.
  Future<void> saveProfile(FaceEnrollmentProfile profile) async {
    await _isar.writeTxn(() async {
      await _isar.faceEnrollmentProfiles.put(profile);
    });
  }

  /// Retrieves the enrollment profile for an individual.
  Future<FaceEnrollmentProfile?> getProfile(String individualId) async {
    return _isar.faceEnrollmentProfiles
        .where()
        .individualIdEqualTo(individualId)
        .findFirst();
  }

  /// Retrieves all enrollment profiles on the device.
  Future<List<FaceEnrollmentProfile>> getAllProfiles() async {
    return _isar.faceEnrollmentProfiles.where().findAll();
  }

  /// Deletes the enrollment profile for an individual.
  Future<void> deleteProfile(String individualId) async {
    await _isar.writeTxn(() async {
      await _isar.faceEnrollmentProfiles
          .where()
          .individualIdEqualTo(individualId)
          .deleteAll();
    });
  }

  /// Updates the failed attempt count for a profile.
  Future<void> updateFailedAttempts(
      String individualId, int failedAttempts) async {
    final profile = await getProfile(individualId);
    if (profile == null) return;
    profile.failedAttempts = failedAttempts;
    await _isar.writeTxn(() async {
      await _isar.faceEnrollmentProfiles.put(profile);
    });
  }

  /// Updates the last verified timestamp for a profile.
  /// If no profile exists (e.g. co-workers synced from the worker registry
  /// only have an embedding, not a profile), a minimal profile is created so
  /// the timestamp can be stored and cycle-completion checks work correctly.
  Future<void> updateLastVerified(String individualId) async {
    var profile = await getProfile(individualId);
    if (profile == null) {
      profile = FaceEnrollmentProfile(
        individualId: individualId,
        pinHash: '',
        pinSalt: '',
        isSystemUser: false,
        enrolledByUserId: '',
        enrolledAt: DateTime.now(),
        supervisorApprovalStatus: 'approved',
        failedAttempts: 0,
      );
    }
    profile.lastVerifiedAt = DateTime.now();
    profile.failedAttempts = 0;
    await _isar.writeTxn(() async {
      await _isar.faceEnrollmentProfiles.put(profile!);
    });
  }

  /// Deletes embeddings and profiles older than the given duration.
  Future<void> deleteOlderThan(Duration maxAge) async {
    final cutoff = DateTime.now().subtract(maxAge);
    await _isar.writeTxn(() async {
      final oldEmbeddings = await _isar.faceEmbeddings
          .filter()
          .createdAtLessThan(cutoff)
          .findAll();
      for (final e in oldEmbeddings) {
        await _isar.faceEmbeddings.delete(e.id);
        await _isar.faceEnrollmentProfiles
            .where()
            .individualIdEqualTo(e.individualId)
            .deleteAll();
      }
    });
  }
}
