import 'package:isar/isar.dart';

part 'face_enrollment_profile.g.dart';

/// Enrollment profile tracking enrollment state + PIN per device user.
/// Max 2-3 profiles per device (1 system user + 1-2 helpers).
@collection
class FaceEnrollmentProfile {
  Id id = Isar.autoIncrement;

  /// The individual's unique identifier (links to FaceEmbedding.individualId).
  @Index(unique: true, replace: true)
  late String individualId;

  /// SHA-256 hash of the user's PIN.
  late String pinHash;

  /// Crypto-random salt used for PIN hashing.
  late String pinSalt;

  /// Whether this profile belongs to the system (HCM-logged-in) user.
  late bool isSystemUser;

  /// UUID of the system user who enrolled this individual.
  late String enrolledByUserId;

  /// Timestamp when enrollment was completed.
  late DateTime enrolledAt;

  /// Supervisor approval status: 'pending', 'approved', 'rejected'.
  @Index()
  late String supervisorApprovalStatus;

  /// Whether this profile has been flagged as a potential twin/duplicate.
  late bool twinFlagged;

  /// Timestamp of the last successful face verification.
  DateTime? lastVerifiedAt;

  /// Count of consecutive failed face verification attempts.
  late int failedAttempts;

  FaceEnrollmentProfile({
    required this.individualId,
    required this.pinHash,
    required this.pinSalt,
    required this.isSystemUser,
    required this.enrolledByUserId,
    required this.enrolledAt,
    this.supervisorApprovalStatus = 'pending',
    this.twinFlagged = false,
    this.lastVerifiedAt,
    this.failedAttempts = 0,
  });
}
