import 'dart:async';

import 'package:attendance_management/attendance_management.dart'
    hide
        AttendanceRegisterModel,
        AttendanceRegisterSearchModel,
        AttendanceLogModel,
        AttendanceLogSearchModel,
        AttendeeModel,
        AttendeeSearchModel;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_register.dart';
import 'package:digit_data_model/models/entities/attendee.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../../blocs/localization/app_localization.dart';
import '../../data/remote_client.dart';
import '../../data/repositories/remote/mdms.dart';
import '../../services/location_service.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/environment_config.dart';

import '../../blocs/face_auth/reverification_bloc.dart';
import '../../router/app_router.dart';
import '../../services/face_auth_event_logger.dart';
import '../../utils/extensions/extensions.dart';
import 'face_verification_dialog.dart';

/// True while the distributor has already verified this cycle but co-workers
/// are still pending (user tapped "Later" on the co-worker sheet).
/// Resets to false when the re-verification cycle completes or times out.
/// Read by the countdown banner to skip the distributor face scan and jump
/// directly to the co-worker verification flow.
final ValueNotifier<bool> coWorkerPendingNotifier = ValueNotifier(false);

/// Set to true by any face-enrollment screen while it is active.
/// The ReVerificationListener watches this and immediately silences the
/// re-verification beep so it doesn't play during enrollment flows.
final ValueNotifier<bool> faceEnrollmentActiveNotifier = ValueNotifier(false);

/// True while the banner VERIFY button is handling a verification flow.
/// Prevents the listener from opening a duplicate sheet in the background.
final ValueNotifier<bool> reVerificationInProgressNotifier = ValueNotifier(false);

/// Co-worker IDs that have already been verified in the current cycle.
/// A ValueNotifier so that NonMobileUserListPage can react to changes made
/// from any path (inline banner scan OR the list page itself).
/// Cleared when the ReVerificationBloc resets to idle (cycle end).
final ValueNotifier<Set<String>> coWorkersVerifiedThisCycleNotifier =
    ValueNotifier({});

/// Marks a co-worker as verified in the current cycle.
/// Call this from any path that verifies a co-worker (inline scan or list page)
/// so that [_checkAndShowCoWorkerPending] correctly tracks cycle progress.
void markCoWorkerVerifiedThisCycle(String id) {
  coWorkersVerifiedThisCycleNotifier.value = {
    ...coWorkersVerifiedThisCycleNotifier.value,
    id,
  };
}

/// Set to true by [logAndCompleteReVerification] just before it fires
/// [externalVerified] so the [ReVerificationListener] skips its own log
/// for the resulting [ReVerificationVerifiedState] transition.
/// Cleared by the listener after it reads the flag.
bool _externalVerificationLogged = false;

/// Skips the distributor face scan (already done) and goes directly to the
/// co-worker verification flow. Fires [externalVerified] when all done.
/// Called by the countdown banner "VERIFY" button when [coWorkerPendingNotifier]
/// is true.
Future<void> verifyCoWorkersPending(BuildContext context) async {
  final coWorkersDone = await _checkAndShowCoWorkerPending(context);
  if (context.mounted && coWorkersDone) {
    coWorkerPendingNotifier.value = false;
    context
        .read<ReVerificationBloc>()
        .add(const ReVerificationEvent.externalVerified());
  }
}

/// A pending co-worker that needs face re-verification.
class _PendingCoWorker {
  final String id;   // UUID used for face matching
  final String name; // display name (may be empty)
  const _PendingCoWorker({required this.id, required this.name});
}

/// Logs a re-verification result from any entry point (banner, popup, etc.)
/// and fires [ReVerificationEvent.externalVerified] on the bloc.
/// Safe to call from widgets that don't have access to [FaceAuthEventModel].
Future<void> logAndCompleteReVerification(
  BuildContext context,
  FaceVerificationResult result,
) async {
  if (!result.passed) return;
  try {
    // Read popupTime from the bloc before it transitions away from prompted state
    int? popupTime;
    int? responseTime;
    try {
      final blocState = context.read<ReVerificationBloc>().state;
      if (blocState is ReVerificationPromptedState) {
        popupTime = blocState.popupTime;
        responseTime = DateTime.now().millisecondsSinceEpoch - popupTime;
      }
    } catch (_) {}

    final logger = FaceAuthEventLogger(
      repository: context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
      userId: context.loggedInIndividualIdOrNull ?? '',
      userUuid: context.loggedInUserUuid,
      projectId: context.projectId,
      boundaryCode: context.boundaryOrNull?.code ?? '',
    );
    // Fire logging in the background — don't await, as the GPS fetch inside
    // _getLocation() can take several seconds and would delay hiding the banner.
    final logFuture = result.confidence > 0
        ? logger.logFaceSuccess(
            eventType: FaceAuthEventType.reVerify,
            confidence: result.confidence,
            faceImageBytes: result.faceImageBytes,
            popupTime: popupTime,
            responseTime: responseTime,
          )
        : logger.logPinFallback(
            eventType: FaceAuthEventType.reVerify,
            popupTime: popupTime,
            responseTime: responseTime,
          );
    logFuture.catchError(
      (e) => debugPrint('logAndCompleteReVerification: log error: $e'),
    );
  } catch (e) {
    debugPrint('logAndCompleteReVerification: failed to log: $e');
  }
  // Run co-worker scans BEFORE firing externalVerified so the countdown banner
  // stays visible (ReVerificationBloc stays in 'prompted' state) for the whole
  // distributor + co-worker re-verification sequence.
  // Only fire externalVerified when the co-worker action was actually completed
  // (inline scan done or list navigation returned). When the user taps "Later",
  // the ticker keeps running as a reminder until they verify or time expires.
  bool coWorkersDone = true;
  if (context.mounted) {
    coWorkersDone = await _checkAndShowCoWorkerPending(context);
  }
  if (context.mounted && coWorkersDone) {
    // Mark as already logged so the BlocListener skips its own log when it
    // sees the resulting ReVerificationVerifiedState transition.
    _externalVerificationLogged = true;
    context
        .read<ReVerificationBloc>()
        .add(const ReVerificationEvent.externalVerified());
  }
}

/// Returns the UUIDs of co-workers linked to the logged-in distributor.
///
/// Mirrors the exact logic of [AttendanceBloc.fetchNonMobileUsers] so the
/// result matches what is visible on the non-mobile user list page:
///  1. Search registers where the distributor is an attendee — the local
///     repo's tag filter automatically scopes results to the distributor's
///     linked group, excluding attendees from other groups.
///  2. Resolve raw attendee IDs to [IndividualModel.id] (UUID) via the
///     individual repository, which is the same UUID stored in face embeddings.
///  3. Exclude the distributor's own ID so only co-workers remain.
Future<Set<String>> _getRegisterAttendeeIds(BuildContext context) async {
  try {
    final loggedInId = context.loggedInIndividualIdOrNull ?? '';
    if (loggedInId.isEmpty) return {};

    final attendanceRepo = context.read<
        LocalRepository<AttendanceRegisterModel,
            AttendanceRegisterSearchModel>>();
    final individualRepo =
        context.read<LocalRepository<IndividualModel, IndividualSearchModel>>();

    final registers = await attendanceRepo.search(
      AttendanceRegisterSearchModel(attendeeId: loggedInId),
    );

    final now = DateTime.now().millisecondsSinceEpoch;
    final result = <String>{};

    for (final register in registers) {
      // Only active enrolments (same eligibility check as fetchNonMobileUsers).
      final eligible = (register.attendees ?? <AttendeeModel>[])
          .where((a) =>
              a.denrollmentDate == null || (a.denrollmentDate ?? now) >= now)
          .map((a) => a.individualId)
          .where((id) => id != null && id!.isNotEmpty)
          .cast<String>()
          .toList();

      if (eligible.isEmpty) continue;

      // Resolve to IndividualModel.id (UUID) — the key used for face embeddings.
      final individuals = await individualRepo.search(
        IndividualSearchModel(id: eligible),
      );

      for (final ind in individuals) {
        if (ind.id != null && ind.id!.isNotEmpty && ind.id != loggedInId) {
          result.add(ind.id!);
        }
      }
    }

    return result;
  } catch (e) {
    debugPrint('_getRegisterAttendeeIds: $e');
    return {};
  }
}

/// Shows enrolled non-system users for verification after the distributor verifies.
/// Returns true when the action was completed (inline scan or list navigation),
/// false when the user deferred ("Later") — caller should keep the ticker alive.
Future<bool> _checkAndShowCoWorkerPending(BuildContext context) async {
  if (!context.mounted) {
    debugPrint('_checkAndShowCoWorkerPending: context unmounted at entry');
    return true;
  }
  try {
    final repository = context.read<FaceEmbeddingRepository>();
    final faceModelService = context.read<FaceModelService>();

    final allCoWorkerEmbeddings = await repository.getNonSystemUserEmbeddings();
    if (allCoWorkerEmbeddings.isEmpty) {
      debugPrint('_checkAndShowCoWorkerPending: no non-system embeddings found');
      return true;
    }

    // Filter to only co-workers in the current register so embeddings synced
    // from other registers or past sessions are not included.
    final registerAttendeeIds = await _getRegisterAttendeeIds(context);
    debugPrint('_checkAndShowCoWorkerPending: registerAttendeeIds=$registerAttendeeIds, allEmbeddings=${allCoWorkerEmbeddings.map((e) => e.individualId).toList()}');
    var coWorkerEmbeddings = registerAttendeeIds.isEmpty
        ? allCoWorkerEmbeddings
        : allCoWorkerEmbeddings
            .where((e) => registerAttendeeIds.contains(e.individualId))
            .toList();
    // If the register filter excluded everything (likely an ID format mismatch),
    // fall back to all non-system embeddings so co-workers are never silently skipped.
    if (coWorkerEmbeddings.isEmpty && allCoWorkerEmbeddings.isNotEmpty) {
      debugPrint('_checkAndShowCoWorkerPending: register filter yielded empty — falling back to all ${allCoWorkerEmbeddings.length} non-system embeddings');
      coWorkerEmbeddings = allCoWorkerEmbeddings;
    }
    if (coWorkerEmbeddings.isEmpty) {
      debugPrint('_checkAndShowCoWorkerPending: all embeddings filtered out (register filter + fallback exhausted)');
      return true;
    }

    final total = coWorkerEmbeddings.length;
    final coWorkerIds = coWorkerEmbeddings.map((e) => e.individualId).toSet();

    // Skip co-workers already verified in this cycle. They will be re-prompted
    // in subsequent cycles, matching the distributor's verification cadence.
    final pendingIds = coWorkerIds
        .where((id) => !coWorkersVerifiedThisCycleNotifier.value.contains(id))
        .toList();
    if (pendingIds.isEmpty || !context.mounted) {
      debugPrint('_checkAndShowCoWorkerPending: pendingIds=${pendingIds.isEmpty ? "empty (all verified this cycle)" : "non-empty"}, mounted=${context.mounted}');
      return true;
    }

    final verified = coWorkerIds.length - pendingIds.length;

    // Look up display names from local individual repository
    final pendingUsers = <_PendingCoWorker>[];
    try {
      final individualRepo =
          context.read<LocalRepository<IndividualModel, IndividualSearchModel>>();
      final allIndividuals = await individualRepo.search(IndividualSearchModel());
      final idToName = {
        for (final i in allIndividuals)
          if (i.id != null) i.id!: i.name?.givenName ?? '',
      };
      for (final id in pendingIds) {
        pendingUsers.add(_PendingCoWorker(id: id, name: idToName[id] ?? ''));
      }
    } catch (_) {
      for (final id in pendingIds) {
        pendingUsers.add(_PendingCoWorker(id: id, name: ''));
      }
    }
    if (!context.mounted) return true;

    // Sheet returns which action the user chose. Awaiting the action happens
    // AFTER the sheet is gone, so externalVerified fires only when truly done.
    // useRootNavigator: true ensures we always present on the root navigator,
    // avoiding stale/nested-navigator failures on cold-start.
    final action = await showModalBottomSheet<String>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      builder: (sheetCtx) => _CoWorkerPendingSheet(
        pending: pendingUsers.length,
        total: total,
        verified: verified,
        onVerifyInline: () => Navigator.of(sheetCtx).pop('inline'),
        onGoToList: () => Navigator.of(sheetCtx).pop('list'),
      ),
    );

    if (!context.mounted) return true;
    if (action == 'inline') {
      await _runCoWorkerVerificationSequence(
          context, pendingUsers, repository, faceModelService);
      if (!context.mounted) return true;
      // Re-check: if any co-workers are still unverified today (user closed
      // the face camera without scanning them), keep the ticker alive.
      if (!coWorkerIds.every((id) => coWorkersVerifiedThisCycleNotifier.value.contains(id))) {
        coWorkerPendingNotifier.value = true;
        return false;
      }
      return true;
    } else if (action == 'list') {
      await context.router.push(const NonMobileUserListRoute());
      if (!context.mounted) return true;
      // Re-check after returning — complete only if all co-workers are now verified.
      // If any are still pending, keep the ticker alive so the user can finish.
      if (!coWorkerIds.every((id) => coWorkersVerifiedThisCycleNotifier.value.contains(id))) {
        coWorkerPendingNotifier.value = true;
        return false;
      }
      return true;
    }
    // null → "Later" tapped or sheet dismissed — keep ticker alive.
    // Signal to the banner "VERIFY" button to skip the distributor scan.
    coWorkerPendingNotifier.value = true;
    return false;
  } catch (e, st) {
    debugPrint('_checkAndShowCoWorkerPending: exception — $e\n$st');
    // Keep co-workers pending so the banner VERIFY button remains active
    // and the user can retry — better than silently skipping the check.
    // Only do this if the context is still live; otherwise complete the cycle.
    if (context.mounted) {
      coWorkerPendingNotifier.value = true;
      return false;
    }
    return true;
  }
}

/// Returns true when every enrolled non-system user (scoped to the current
/// register via [context]) has been verified today.
Future<bool> _allCoWorkersVerifiedToday(
    FaceEmbeddingRepository repo, BuildContext context) async {
  try {
    final allCwEmbeddings = await repo.getNonSystemUserEmbeddings();
    if (allCwEmbeddings.isEmpty) return true;
    final registerAttendeeIds = await _getRegisterAttendeeIds(context);
    final cwEmbeddings = registerAttendeeIds.isEmpty
        ? allCwEmbeddings
        : allCwEmbeddings
            .where((e) => registerAttendeeIds.contains(e.individualId))
            .toList();
    if (cwEmbeddings.isEmpty) return true;
    final cwIds = cwEmbeddings.map((e) => e.individualId).toSet();
    final profiles = await repo.getAllProfiles();
    final now = DateTime.now();
    final verifiedIds = profiles
        .where((p) => cwIds.contains(p.individualId))
        .where((p) {
          final lv = p.lastVerifiedAt;
          return lv != null &&
              lv.year == now.year &&
              lv.month == now.month &&
              lv.day == now.day;
        })
        .map((p) => p.individualId)
        .toSet();
    return cwIds.every((id) => verifiedIds.contains(id));
  } catch (_) {
    return true;
  }
}

/// Sequentially pushes a face-scan screen for each pending co-worker.
/// After each scan (verified or skipped) it moves to the next one.
Future<void> _runCoWorkerVerificationSequence(
  BuildContext context,
  List<_PendingCoWorker> pending,
  FaceEmbeddingRepository repository,
  FaceModelService faceModelService,
) async {
  // Capture context-dependent values before async gaps
  final faceAuthEventRepo =
      context.read<LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
  final distributorUuid = context.loggedInUserUuid;
  final projectId = context.projectId;
  final boundaryCode = context.boundaryOrNull?.code ?? '';

  for (int i = 0; i < pending.length; i++) {
    if (!context.mounted) break;
    // Brief pause between scans so the previous camera session has time to
    // begin releasing before the next page acquires the hardware.
    if (i > 0) await Future.delayed(const Duration(milliseconds: 400));
    if (!context.mounted) break;
    final user = pending[i];
    bool verified = false;
    double? rejectedConfidence;
    Uint8List? rejectedImageBytes;

    await Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FaceVerificationBloc(
              faceModelService: faceModelService,
              embeddingRepository: repository,
              thresholdLoader: () async => (await MdmsRepository(DioClient().dio)
                      .searchFaceAuthConfig(
                    envConfig.variables.mdmsApiPath,
                    envConfig.variables.tenantId,
                  ))
                  ?.faceMatchThreshold,
            ),
          ),
        ],
        child: _CoWorkerScanPage(
          user: user,
          stepCurrent: i + 1,
          stepTotal: pending.length,
          faceModelService: faceModelService,
          onVerified: (confidence, {faceImageBytes}) async {
            verified = true;
            markCoWorkerVerifiedThisCycle(user.id);
            await repository.updateLastVerified(user.id);
            final location = await _fetchLocationForLog();
            try {
              final logger = FaceAuthEventLogger(
                repository: faceAuthEventRepo,
                userId: user.id,
                userUuid: distributorUuid,
                projectId: projectId,
                boundaryCode: boundaryCode,
                subjectName: user.name,
              );
              await logger.logFaceSuccess(
                eventType: FaceAuthEventType.checkIn,
                confidence: confidence,
                faceImageBytes: faceImageBytes,
                latitude: location?.latitude ?? 0.0,
                longitude: location?.longitude ?? 0.0,
                locationAccuracy: location?.accuracy ?? 0.0,
              );
            } catch (e) {
              debugPrint('_runCoWorkerVerificationSequence: log CI failed: $e');
            }
          },
          onFailed: (confidence, {faceImageBytes}) {
            rejectedConfidence = confidence;
            rejectedImageBytes = faceImageBytes;
          },
        ),
      ),
    ));

    if (!verified) {
      try {
        final logger = FaceAuthEventLogger(
          repository: faceAuthEventRepo,
          userId: user.id,
          userUuid: distributorUuid,
          projectId: projectId,
          boundaryCode: boundaryCode,
          subjectName: user.name,
        );
        if (rejectedConfidence != null) {
          // Face was scanned but didn't match — log as rejected.
          await logger.logFaceRejected(
            eventType: FaceAuthEventType.checkIn,
            confidence: rejectedConfidence!,
            faceImageBytes: rejectedImageBytes,
            failedAttemptCount: 1,
          );
        } else {
          // Screen closed without any scan — log as missed/attempt.
          await logger.logMissed(responseType: FaceAuthResponseType.attempt);
        }
      } catch (e) {
        debugPrint('_runCoWorkerVerificationSequence: log failure failed: $e');
      }
    }
  }
}

/// Listens to ReVerificationBloc and shows a bottom-sheet prompt
/// with a countdown timer when re-verification is triggered.
/// Also logs face auth events to the database for history display.
class ReVerificationListener extends StatefulWidget {
  final Widget child;

  const ReVerificationListener({super.key, required this.child});

  @override
  State<ReVerificationListener> createState() => _ReVerificationListenerState();
}

class _ReVerificationListenerState extends State<ReVerificationListener> {
  bool _isBusy = false; // true when sheet or dialog is open
  bool _lastVerifiedViaDialog = false; // prevents double-logging
  bool _dismissedThisCycle = false; // true after "Remind me later" — resets on new iteration
  int _lastShownIteration = 0; // tracks which iteration we last showed the sheet for
  bool _routerListenerAdded = false;
  // True once the distributor passed their own face scan this cycle.
  // Prevents logging a false "missed" for the distributor when "Later" was
  // tapped on the co-worker sheet and the countdown then expires.
  bool _distributorVerifiedThisCycle = false;

  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription<PlayerState>? _playerStateSub;

  @override
  void initState() {
    super.initState();
    faceEnrollmentActiveNotifier.addListener(_onEnrollmentActiveChanged);
    reVerificationInProgressNotifier.addListener(_onVerificationInProgressChanged);
    coWorkersVerifiedThisCycleNotifier.addListener(_onCoWorkerVerifiedFromList);
    _audioPlayer.setAudioContext(AudioContext(
      android: AudioContextAndroid(
        // Permanent gain so camera initialization cannot revoke our focus.
        audioFocus: AndroidAudioFocus.gain,
        usageType: AndroidUsageType.notificationEvent,
        contentType: AndroidContentType.sonification,
      ),
      iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient),
    ));
    _audioPlayer.setVolume(1.0);
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_routerListenerAdded) {
      context.router.addListener(_onRouteChanged);
      _routerListenerAdded = true;
    }
  }

  void _onRouteChanged() {
    if (!mounted) return;
    try {
      final topRoute = context.router.topRoute.name;
      if (topRoute == FaceGateRoute.name ||
          topRoute == NonMobileFaceEnrollRoute.name) {
        _stopAlertSound();
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    faceEnrollmentActiveNotifier.removeListener(_onEnrollmentActiveChanged);
    reVerificationInProgressNotifier.removeListener(_onVerificationInProgressChanged);
    coWorkersVerifiedThisCycleNotifier.removeListener(_onCoWorkerVerifiedFromList);
    if (_routerListenerAdded) {
      try {
        context.router.removeListener(_onRouteChanged);
      } catch (_) {}
    }
    _stopAlertSound();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _onEnrollmentActiveChanged() {
    if (faceEnrollmentActiveNotifier.value) {
      _stopAlertSound();
    }
  }

  void _onVerificationInProgressChanged() {
    if (reVerificationInProgressNotifier.value) {
      _stopAlertSound();
    }
  }

  /// Fires when a co-worker is marked verified (from the non-mobile list page
  /// or any inline scan path). If all co-workers are now verified and a
  /// co-worker-pending cycle is active, auto-complete the cycle so the
  /// ticker disappears without requiring another tap of the VERIFY button.
  void _onCoWorkerVerifiedFromList() async {
    // Only act when the cycle is waiting for co-workers (user tapped "Later").
    if (!coWorkerPendingNotifier.value) return;
    if (!mounted) return;
    // Ensure the bloc is still prompting — don't double-fire.
    try {
      final blocState = context.read<ReVerificationBloc>().state;
      if (blocState is! ReVerificationPromptedState) return;
    } catch (_) {
      return;
    }
    try {
      final repo = context.read<FaceEmbeddingRepository>();
      final allEmbeddings = await repo.getNonSystemUserEmbeddings();
      if (allEmbeddings.isEmpty) return;
      if (!mounted || !coWorkerPendingNotifier.value) return;

      final registerIds = await _getRegisterAttendeeIds(context);
      var embeddings = registerIds.isEmpty
          ? allEmbeddings
          : allEmbeddings
              .where((e) => registerIds.contains(e.individualId))
              .toList();
      if (embeddings.isEmpty && allEmbeddings.isNotEmpty) {
        embeddings = allEmbeddings;
      }
      if (embeddings.isEmpty) return;

      final coWorkerIds = embeddings.map((e) => e.individualId).toSet();
      // Not all verified yet — wait for the next call.
      if (!coWorkerIds.every(
          (id) => coWorkersVerifiedThisCycleNotifier.value.contains(id))) {
        return;
      }

      if (!mounted || !coWorkerPendingNotifier.value) return;
      // All co-workers verified — complete the cycle.
      _externalVerificationLogged = true;
      coWorkerPendingNotifier.value = false;
      context
          .read<ReVerificationBloc>()
          .add(const ReVerificationEvent.externalVerified());
    } catch (e) {
      debugPrint('ReVerificationListener: co-worker all-done check failed: $e');
    }
  }

  void _startAlertSound() {
    if (faceEnrollmentActiveNotifier.value) return;
    _stopAlertSound();
    // Auto-restart if audio focus is lost (e.g. camera hardware grab).
    _playerStateSub = _audioPlayer.onPlayerStateChanged.listen((state) {
      if ((state == PlayerState.stopped ||
              state == PlayerState.completed ||
              state == PlayerState.paused) &&
          _playerStateSub != null &&
          mounted) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (_playerStateSub != null && mounted) {
            _audioPlayer
                .play(AssetSource('audio/add.wav'))
                .catchError((e) => debugPrint('[ReVerif] restart: $e'));
          }
        });
      }
    });
    _audioPlayer
        .play(AssetSource('audio/add.wav'))
        .catchError((e) => debugPrint('[ReVerif] start: $e'));
  }

  void _stopAlertSound() {
    _playerStateSub?.cancel();
    _playerStateSub = null;
    _audioPlayer.stop();
  }

  FaceAuthEventLogger? _createLogger(BuildContext context) {
    try {
      return FaceAuthEventLogger(
        repository: context.read<LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>(),
        userId: context.loggedInIndividualIdOrNull ?? '',
        userUuid: context.loggedInUserUuid,
        projectId: context.projectId,
        boundaryCode: context.boundaryOrNull?.code ?? '',
      );
    } catch (e) {
      debugPrint('ReVerificationListener: failed to create logger: $e');
      return null;
    }
  }

  /// Logs a MISSED re-verify event for every enrolled co-worker who has not
  /// been verified today. Called whenever the distributor's countdown expires.
  Future<void> _logCoWorkersMissed(BuildContext context, {int? popupTime}) async {
    if (!mounted) return;
    try {
      final repository = context.read<FaceEmbeddingRepository>();
      final faceAuthRepo = context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
      final distributorUuid = context.loggedInUserUuid;
      final projectId = context.projectId;
      final boundaryCode = context.boundaryOrNull?.code ?? '';

      final allCoWorkerEmbeddings = await repository.getNonSystemUserEmbeddings();
      if (allCoWorkerEmbeddings.isEmpty) return;

      // Scope to the current register so extra synced embeddings are excluded.
      if (!mounted) return;
      final registerAttendeeIds = await _getRegisterAttendeeIds(context);
      var coWorkerEmbeddings = registerAttendeeIds.isEmpty
          ? allCoWorkerEmbeddings
          : allCoWorkerEmbeddings
              .where((e) => registerAttendeeIds.contains(e.individualId))
              .toList();
      if (coWorkerEmbeddings.isEmpty && allCoWorkerEmbeddings.isNotEmpty) {
        coWorkerEmbeddings = allCoWorkerEmbeddings;
      }
      if (coWorkerEmbeddings.isEmpty) return;

      // Log missed only for co-workers not verified in this cycle.
      final pendingIds = coWorkerEmbeddings
          .map((e) => e.individualId)
          .where((id) => !coWorkersVerifiedThisCycleNotifier.value.contains(id))
          .toList();
      if (pendingIds.isEmpty) return;

      await Future.wait(pendingIds.map((id) async {
        try {
          await FaceAuthEventLogger(
            repository: faceAuthRepo,
            userId: id,
            userUuid: distributorUuid,
            projectId: projectId,
            boundaryCode: boundaryCode,
          ).logMissed(popupTime: popupTime);
        } catch (e) {
          debugPrint('_logCoWorkersMissed: failed for $id: $e');
        }
      }));
    } catch (e) {
      debugPrint('_logCoWorkersMissed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReVerificationBloc, ReVerificationState>(
      listener: (context, state) async {
        if (state is ReVerificationPromptedState) {
          // Supervisors (team / district) do not need periodic face checks —
          // silently complete the cycle so the scheduler stays healthy.
          if (context.isTeamSupervisorRole || context.isDistrictSupervisorRole) {
            context
                .read<ReVerificationBloc>()
                .add(const ReVerificationEvent.externalVerified());
            return;
          }
          // Reset dismissed flag when a new iteration starts
          if (state.iteration != _lastShownIteration) {
            _dismissedThisCycle = false;
          }
          if (!_isBusy && !_dismissedThisCycle) {
            if (coWorkerPendingNotifier.value) return;
            if (reVerificationInProgressNotifier.value) return;
            // Don't show during enrollment flows or setup screens
            try {
              final topRoute = context.router.topRoute.name;
              if (topRoute == FaceGateRoute.name ||
                  topRoute == NonMobileFaceEnrollRoute.name ||
                  topRoute == ProjectSelectionRoute.name ||
                  topRoute == BoundarySelectionRoute.name) {
                return;
              }
            } catch (_) {}
            // Claim the slot BEFORE any await so that a subsequent tick state
            // change cannot race through the !_isBusy guard and open a second
            // sheet while the enrollment check is in flight.
            _isBusy = true;
            _lastShownIteration = state.iteration;
            // Skip re-verification if no face enrollment exists yet
            try {
              final repository = context.read<FaceEmbeddingRepository>();
              final enrollmentCount = await repository.count();
              if (enrollmentCount == 0) {
                _isBusy = false;
                return;
              }
            } catch (_) {
              _isBusy = false;
              return;
            }
            if (!mounted) {
              _isBusy = false;
              return;
            }
            _showReVerificationSheet(context);
          }
        } else if (state is ReVerificationIdleState) {
          _stopAlertSound(); // cycle reset — stop alert
          _dismissedThisCycle = false;
          _lastShownIteration = 0;
          _distributorVerifiedThisCycle = false;
          coWorkerPendingNotifier.value = false;
          coWorkersVerifiedThisCycleNotifier.value = {}; // reset for next cycle
        } else if (state is ReVerificationVerifiedState) {
          _stopAlertSound(); // verified inline — stop alert
          // Skip logging if already logged by logAndCompleteReVerification
          // (banner path) or by _showReVerificationSheet (dialog path).
          if (!_lastVerifiedViaDialog && !_externalVerificationLogged) {
            final logger = _createLogger(context);
            if (logger == null) {
              debugPrint('ReVerificationListener: logger is null, skipping verified log');
            } else if (state.confidence > 0) {
              await logger.logFaceSuccess(
                eventType: FaceAuthEventType.reVerify,
                confidence: state.confidence,
                responseTime: state.elapsedMs,
              );
            } else {
              await logger.logPinFallback(
                eventType: FaceAuthEventType.reVerify,
              );
            }
          }
          _externalVerificationLogged = false;
          _lastVerifiedViaDialog = false;
          _distributorVerifiedThisCycle = false;
          coWorkerPendingNotifier.value = false;
        } else if (state is ReVerificationMissedState) {
          _stopAlertSound(); // missed/timed out — stop alert
          // Skip distributor missed log if they already passed this cycle
          // (countdown expired while waiting for co-workers after "Later").
          if (!_distributorVerifiedThisCycle) {
            final logger = _createLogger(context);
            if (logger == null) {
              debugPrint('ReVerificationListener: logger is null, skipping missed log');
            }
            await logger?.logMissed(popupTime: state.popupTime);
          }
          _distributorVerifiedThisCycle = false;
          coWorkerPendingNotifier.value = false;
          await _logCoWorkersMissed(context, popupTime: state.popupTime);
        }
      },
      child: widget.child,
    );
  }

  void _showReVerificationSheet(BuildContext context) {
    _isBusy = true;
    _startAlertSound();
    final repository = context.read<FaceEmbeddingRepository>();
    final faceModelService = context.read<FaceModelService>();
    final reVerificationBloc = context.read<ReVerificationBloc>();

    showModalBottomSheet<bool>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: reVerificationBloc,
        child: const _ReVerificationSheet(),
      ),
    ).then((openDialog) async {
      if (openDialog == true && mounted) {
        // Block the banner VERIFY path from starting a concurrent flow while
        // the face dialog (and subsequent co-worker scans) are in progress.
        reVerificationInProgressNotifier.value = true;
        try {
          // Sound stops when reVerificationInProgressNotifier turns true (above).
          final result = await showFaceVerificationDialog(
            context,
            repository: repository,
            faceModelService: faceModelService,
          );

          if (result.passed) {
            _distributorVerifiedThisCycle = true;
            _lastVerifiedViaDialog = true;
            if (mounted) {
              // Wait for the next frame so the face-dialog pop fully settles
              // before the co-worker sheet tries to present on the navigator.
              // Without this, the navigator may still be in a transitional
              // state on cold-start, silently swallowing showModalBottomSheet.
              await WidgetsBinding.instance.endOfFrame;
              // logAndCompleteReVerification runs co-worker scans THEN fires
              // externalVerified — beeper and timer stay alive until the whole
              // sequence (distributor + co-workers) is done.
              if (mounted) await logAndCompleteReVerification(context, result);
            }
          } else {
            // User tapped Verify Face then closed the face capture without
            // completing it. Treat that as an intentional dismissal — keep
            // the countdown banner visible but DO NOT restart the alert
            // sound. The user has already acknowledged the prompt by
            // engaging with it; re-blaring the sound is jarring.
            _dismissedThisCycle = true;
            _stopAlertSound();
          }
        } finally {
          reVerificationInProgressNotifier.value = false;
        }
        _isBusy = false; // release after entire sequence (distributor + co-workers)
      } else {
        // "Remind me later" — stop sound so it doesn't interrupt critical flows.
        _stopAlertSound();
        _isBusy = false;
        _dismissedThisCycle = true;
      }
    });
  }
}

class _ReVerificationSheet extends StatefulWidget {
  const _ReVerificationSheet();

  @override
  State<_ReVerificationSheet> createState() => _ReVerificationSheetState();
}

class _ReVerificationSheetState extends State<_ReVerificationSheet> {
  bool _popped = false;

  @override
  void initState() {
    super.initState();
    reVerificationInProgressNotifier.addListener(_onBannerVerifyStarted);
  }

  @override
  void dispose() {
    reVerificationInProgressNotifier.removeListener(_onBannerVerifyStarted);
    super.dispose();
  }

  void _onBannerVerifyStarted() {
    if (reVerificationInProgressNotifier.value) _pop(false);
  }

  void _pop([bool? result]) {
    if (!_popped && mounted) {
      _popped = true;
      Navigator.of(context).pop(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    return BlocConsumer<ReVerificationBloc, ReVerificationState>(
      listener: (context, state) {
        // Auto-dismiss on idle/verified/missed (e.g. timeout while sheet is open)
        if (state is ReVerificationIdleState ||
            state is ReVerificationVerifiedState ||
            state is ReVerificationMissedState) {
          _pop(false);
        }
      },
      builder: (context, state) {
        final bottomPadding = 32 + MediaQuery.of(context).padding.bottom;
        return Container(
          padding: EdgeInsets.fromLTRB(24, 20, 24, bottomPadding),
          decoration: BoxDecoration(
            color: colorTheme.paper.primary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: colorTheme.generic.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorTheme.primary.primary1.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.face_rounded,
                  size: 32,
                  color: colorTheme.primary.primary1,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.scanToProceed),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.text.primary,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                AppLocalizations.of(context)
                    .translate(i18.faceAuth.verifyToContinueWorking),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: colorTheme.text.secondary,
                ),
              ),

              const SizedBox(height: 20),

              // Countdown
              if (state is ReVerificationPromptedState) ...[
                _CountdownRing(
                  remainingSeconds: state.remainingSeconds,
                  totalSeconds: context.read<ReVerificationBloc>().config.countdownDuration.inSeconds,
                ),
                const SizedBox(height: 8),
                Text(
                  'Attempt ${state.iteration} of ${state.maxIterations}',
                  style: TextStyle(
                    fontSize: 13,
                    color: colorTheme.text.secondary,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Instruction callout
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded,
                        size: 18, color: Colors.orange.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)
                            .translate(i18.faceAuth.systemUserVerifyFirst),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Verify button — pops sheet with `true` to signal "open dialog"
              DigitButton(
                label: AppLocalizations.of(context)
                    .translate(i18.faceAuth.verifyNow),
                onPressed: () => _pop(true),
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                prefixIcon: Icons.face_rounded,
              ),

              const SizedBox(height: 12),

              // Dismiss — just close the sheet; countdown keeps running
              DigitButton(
                label: AppLocalizations.of(context)
                    .translate(i18.faceAuth.remindMeLater),
                onPressed: () => _pop(false),
                type: DigitButtonType.tertiary,
                size: DigitButtonSize.medium,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Circular countdown ring showing remaining time.
class _CountdownRing extends StatelessWidget {
  final int remainingSeconds;
  final int totalSeconds;

  const _CountdownRing({
    required this.remainingSeconds,
    required this.totalSeconds,
  });

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;
    final progress = remainingSeconds / totalSeconds;
    final isUrgent = remainingSeconds < 60;

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: colorTheme.generic.divider,
              valueColor: AlwaysStoppedAnimation<Color>(
                isUrgent
                    ? colorTheme.alert.error
                    : colorTheme.primary.primary1,
              ),
            ),
          ),
          Text(
            _formatTime(remainingSeconds),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isUrgent
                  ? colorTheme.alert.error
                  : colorTheme.text.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Co-worker Pending Face Check Sheet ──

class _CoWorkerPendingSheet extends StatelessWidget {
  final int pending;
  final int total;
  final int verified;
  final VoidCallback onVerifyInline;
  final VoidCallback onGoToList;

  const _CoWorkerPendingSheet({
    required this.pending,
    required this.total,
    required this.verified,
    required this.onVerifyInline,
    required this.onGoToList,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;

    final bottomPadding = 32 + MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(24, 20, 24, bottomPadding),
      decoration: BoxDecoration(
        color: colorTheme.paper.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: colorTheme.generic.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorTheme.primary.primary1.withOpacity(0.1),
            ),
            child: Icon(
              Icons.group_rounded,
              size: 32,
              color: colorTheme.primary.primary1,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            AppLocalizations.of(context)
                .translate(i18.faceAuth.coWorkerVerification),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorTheme.text.primary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '$pending of $total co-workers still need verification',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: colorTheme.text.secondary,
            ),
          ),

          const SizedBox(height: 20),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: total > 0 ? verified / total : 0,
              minHeight: 8,
              backgroundColor: colorTheme.generic.divider,
              valueColor: AlwaysStoppedAnimation<Color>(
                  colorTheme.alert.success),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$verified verified this cycle',
                style: TextStyle(
                  fontSize: 12,
                  color: colorTheme.alert.success,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$pending pending',
                style: TextStyle(
                  fontSize: 12,
                  color: colorTheme.text.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Primary: scan each face inline
          DigitButton(
            label: AppLocalizations.of(context)
                .translate(i18.faceAuth.scanEachFace),
            onPressed: onVerifyInline,
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            mainAxisSize: MainAxisSize.max,
            prefixIcon: Icons.face_rounded,
          ),

          const SizedBox(height: 12),

          // Secondary row: View All list | Later
          Row(
            children: [
              Expanded(
                child: DigitButton(
                  label: AppLocalizations.of(context)
                      .translate(i18.faceAuth.later),
                  onPressed: () => Navigator.of(context).pop(),
                  type: DigitButtonType.tertiary,
                  size: DigitButtonSize.medium,
                  mainAxisSize: MainAxisSize.max,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DigitButton(
                  label: AppLocalizations.of(context)
                      .translate(i18.faceAuth.viewAll),
                  onPressed: onGoToList,
                  type: DigitButtonType.secondary,
                  size: DigitButtonSize.medium,
                  mainAxisSize: MainAxisSize.max,
                  prefixIcon: Icons.list_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Co-worker Sequential Scan Page ──

/// Full-screen face scan page for one co-worker, shown sequentially.
/// Displays "N of Total" progress and the co-worker's name.
class _CoWorkerScanPage extends StatelessWidget {
  final _PendingCoWorker user;
  final int stepCurrent;
  final int stepTotal;
  final FaceModelService faceModelService;
  final Future<void> Function(double confidence, {Uint8List? faceImageBytes})
      onVerified;
  final void Function(double confidence, {Uint8List? faceImageBytes})? onFailed;

  const _CoWorkerScanPage({
    required this.user,
    required this.stepCurrent,
    required this.stepTotal,
    required this.faceModelService,
    required this.onVerified,
    this.onFailed,
  });

  @override
  Widget build(BuildContext context) {
    // FaceAttendanceWrapper already pops itself on verified and cancel.
    // onVerified callback passes the actual similarity confidence through.
    final displayName = user.name.isNotEmpty ? user.name : 'Co-worker';
    return FaceAttendanceWrapper(
      individualId: user.id,
      faceModelService: faceModelService,
      title: displayName,
      subtitle: 'Step $stepCurrent of $stepTotal',
      onVerified: (confidence, {faceImageBytes}) async {
        await onVerified(confidence, faceImageBytes: faceImageBytes);
      },
      onFailed: onFailed,
    );
  }
}

/// Silently reads location for event logging. Never requests permission or
/// service — returns null immediately if not already granted/enabled.
Future<LocationData?> _fetchLocationForLog() async {
  try {
    return await LocationService.instance
        .currentOrNext(timeout: const Duration(seconds: 4));
  } catch (e) {
    debugPrint('_fetchLocationForLog: $e');
    return null;
  }
}
