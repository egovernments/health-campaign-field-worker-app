import 'environment_config.dart';

/// Runtime toggle for the face enrollment/verification flow.
///
/// Reads the `FACE_AUTH_ENABLED` variable from the app's .env (defaults to
/// `false` when the key is absent). When `false`, every face-auth entry
/// point early-returns: the home-screen face gate check, the re-verification
/// scheduler, the co-worker enroll/verify navigations, the
/// FaceAuthSessionCard, and the face-auth widget factory registrations.
///
/// The `digit_face_verification` package, the `FaceAuthEvent` entity, and
/// the SQL/Isar tables remain compiled so flipping the env var is a config
/// change with no code edit or DB migration.
bool get kFaceAuthEnabled => envConfig.variables.faceAuthEnabled;
