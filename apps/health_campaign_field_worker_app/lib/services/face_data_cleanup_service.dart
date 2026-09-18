import 'package:digit_face_verification/digit_face_verification.dart';

/// Service that deletes face data older than 7 days.
/// Called on app start and daily to enforce data retention policy.
class FaceDataCleanupService {
  final FaceEmbeddingRepository repository;
  final Duration maxAge;

  const FaceDataCleanupService({
    required this.repository,
    this.maxAge = const Duration(days: 7),
  });

  /// Run the cleanup. Deletes:
  /// - FaceEmbedding entries older than maxAge
  /// - Associated FaceEnrollmentProfile entries
  Future<void> run() async {
    await repository.deleteOlderThan(maxAge);
  }
}
