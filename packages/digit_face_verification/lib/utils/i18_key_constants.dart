/// Localization codes used by the digit_face_verification package.
/// Codes share the FACE_AUTH_* namespace with the host app's FaceAuth keys
/// (apps/.../utils/i18_key_constants.dart) so both resolve from the same
/// localization rows; generic actions reuse CORE_COMMON_* codes.
library i18_key_constants;

const common = Common();
const faceVerification = FaceVerification();

class Common {
  const Common();

  String get coreCommonContinue => 'CORE_COMMON_CONTINUE';

  String get coreCommonCancel => 'CORE_COMMON_CANCEL';

  String get coreCommonOk => 'CORE_COMMON_OK';
}

class FaceVerification {
  const FaceVerification();

  // ── Bloc / processing state messages ──
  String get initializing => 'FACE_AUTH_INITIALIZING';
  String get initFailed => 'FACE_AUTH_INIT_FAILED';
  String get processing => 'FACE_AUTH_PROCESSING';
  String get verifying => 'FACE_AUTH_VERIFYING';
  String get registrationFailed => 'FACE_AUTH_REGISTRATION_FAILED';
  String get verificationFailed => 'FACE_AUTH_VERIFICATION_FAILED';
  String get deleteFailed => 'FACE_AUTH_DELETE_FAILED';
  String get noRegisteredFace => 'FACE_AUTH_NO_REGISTERED_FACE';
  String get enrollmentFailed => 'FACE_AUTH_ENROLLMENT_FAILED';

  // ── Enrollment angle instructions / steps ──
  String get angleStraight => 'FACE_AUTH_ANGLE_STRAIGHT';
  String get angleLeft => 'FACE_AUTH_ANGLE_LEFT';
  String get angleRight => 'FACE_AUTH_ANGLE_RIGHT';
  String get angleUp => 'FACE_AUTH_ANGLE_UP';
  String get angleDown => 'FACE_AUTH_ANGLE_DOWN';
  String get stepLiveness => 'FACE_AUTH_STEP_LIVENESS';

  // ── Liveness ──
  String get livenessBlink => 'FACE_AUTH_LIVENESS_BLINK';
  String get livenessTurnLeft => 'FACE_AUTH_LIVENESS_TURN_LEFT';
  String get livenessTurnRight => 'FACE_AUTH_LIVENESS_TURN_RIGHT';
  String get livenessPassed => 'FACE_AUTH_LIVENESS_PASSED';
  String get livenessTimeout => 'FACE_AUTH_LIVENESS_TIMEOUT';

  // ── Lighting guidance ──
  String get lightingTooLow => 'FACE_AUTH_LIGHTING_TOO_LOW';
  String get lightingTooBright => 'FACE_AUTH_LIGHTING_TOO_BRIGHT';
  String get lightingGood => 'FACE_AUTH_LIGHTING_GOOD';
  String get lightingUnknown => 'FACE_AUTH_LIGHTING_UNKNOWN';

  // ── Views: results / actions ──
  String get enrolledTitle => 'FACE_AUTH_ENROLLED_TITLE';
  String get enrolledMessage => 'FACE_AUTH_ENROLLED_MESSAGE';
  String get verifiedTitle => 'FACE_AUTH_GATE_VERIFIED';
  String get verifiedMessage => 'FACE_AUTH_VERIFIED_MESSAGE';
  String get rejectedMessage => 'FACE_AUTH_REJECTED_MESSAGE';
  String get verificationFailedTitle => 'FACE_AUTH_VERIFICATION_FAILED_TITLE';
  String get tryAgain => 'FACE_AUTH_TRY_AGAIN';
  String get goBack => 'FACE_AUTH_GO_BACK';
  String get pinCopied => 'FACE_AUTH_PIN_COPIED';

  // ── Enrollment tips ──
  String get tipGoodLighting => 'FACE_AUTH_TIP_GOOD_LIGHTING';
  String get tipClearFace => 'FACE_AUTH_TIP_CLEAR_FACE';
  String get tipCorrectDistance => 'FACE_AUTH_TIP_CORRECT_DISTANCE';
  String get tipSteadyPhone => 'FACE_AUTH_TIP_STEADY_PHONE';
  String get tipFollowGuidance => 'FACE_AUTH_TIP_FOLLOW_GUIDANCE';
  String get tipGoodLightingBody => 'FACE_AUTH_TIP_GOOD_LIGHTING_BODY';
  String get tipClearFaceBody => 'FACE_AUTH_TIP_CLEAR_FACE_BODY';
  String get tipCorrectDistanceBody => 'FACE_AUTH_TIP_CORRECT_DISTANCE_BODY';
  String get tipSteadyPhoneBody => 'FACE_AUTH_TIP_STEADY_PHONE_BODY';
  String get tipFollowGuidanceBody => 'FACE_AUTH_TIP_FOLLOW_GUIDANCE_BODY';

  // ── Enrollment intro / PIN screen / misc ──
  String get settingUpProfile => 'FACE_AUTH_SETTING_UP_PROFILE';
  String get logout => 'FACE_AUTH_LOGOUT';
  String get enrollmentTitle => 'FACE_AUTH_ENROLLMENT_TITLE';
  String get enrollmentDescription => 'FACE_AUTH_ENROLLMENT_DESCRIPTION';
  String get copy => 'FACE_AUTH_COPY';
  String get info => 'FACE_AUTH_INFO';
  String get maxUsersTitle => 'FACE_AUTH_MAX_USERS_TITLE';
  String get maxUsersBody => 'FACE_AUTH_ENROLLMENT_MAX_USERS';
  String get back => 'FACE_AUTH_BACK';
  String get beforeWeBegin => 'FACE_AUTH_BEFORE_WE_BEGIN';
  String get instructionsSubtitle => 'FACE_AUTH_INSTRUCTIONS_SUBTITLE';
  String get gotItContinue => 'FACE_AUTH_GOT_IT_CONTINUE';
  String get gotIt => 'FACE_AUTH_GOT_IT';
  String get tipsTitle => 'FACE_AUTH_TIPS_TITLE';
  String get photoTipBrightness => 'FACE_AUTH_PHOTO_TIP_BRIGHTNESS';
  String get photoTipDistance => 'FACE_AUTH_PHOTO_TIP_DISTANCE';
  String get photoTipClarity => 'FACE_AUTH_PHOTO_TIP_CLARITY';
  String get photoTipStayStill => 'FACE_AUTH_PHOTO_TIP_STAY_STILL';
  String get captureFailed => 'FACE_AUTH_CAPTURE_FAILED';
  String get qualityLow => 'FACE_AUTH_ENROLLMENT_QUALITY_LOW';
  String get verifyIdentity => 'FACE_AUTH_VERIFY_IDENTITY';
  String get positionFace => 'FACE_AUTH_POSITION_FACE';

  // ── Capture view guidance ──
  String get tiltUp => 'FACE_AUTH_TILT_UP';
  String get tiltDown => 'FACE_AUTH_TILT_DOWN';
  String get moveCloser => 'FACE_AUTH_MOVE_CLOSER';
  String get moveBack => 'FACE_AUTH_MOVE_BACK';
  String get scanning => 'FACE_AUTH_SCANNING';
  String get holdStillCapturing => 'FACE_AUTH_HOLD_STILL_CAPTURING';
  String get tapCapture => 'FACE_AUTH_TAP_CAPTURE';
  String get scanningHoldSteady => 'FACE_AUTH_SCANNING_HOLD_STEADY';
  String get holdStill => 'FACE_AUTH_HOLD_STILL';
  String get holdSteady => 'FACE_AUTH_HOLD_STEADY';

  // ── Results / dialogs / misc ──
  String get done => 'FACE_AUTH_DONE';
  String get faceMatch => 'FACE_AUTH_FACE_MATCH';
  String get enrollmentSuccessful => 'FACE_AUTH_ENROLLMENT_SUCCESSFUL';
  String get enrollmentPinNote => 'FACE_AUTH_ENROLLMENT_PIN_NOTE';
  String get duplicateDetected => 'FACE_AUTH_ENROLLMENT_DUPLICATE_DETECTED';
  String get pinVerify => 'FACE_AUTH_PIN_VERIFY';
  String get gateScanning => 'FACE_AUTH_GATE_SCANNING';
}
