import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/attendance_register.dart';
import 'package:digit_data_model/models/entities/attendee.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_forms_engine/forms_engine.dart'
    show ScannerComparisonRegistry;
import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/helper_widget/digit_profile.dart';
import 'package:digit_ui_components/widgets/molecules/hamburger.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:survey_form/survey_form.dart';
import 'package:sync_service/sync_service_lib.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/data/repositories/remote/user_action.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/hf_referral_downsync/hf_referral_downsync.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../blocs/stock_downsync/stock_downsync.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../blocs/push_notification/push_notification.dart';
import '../data/local_store/app_shared_preferences.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import '../blocs/face_auth/face_gate_bloc.dart';
import '../blocs/face_auth/reverification_bloc.dart';
import '../notification_service.dart';
import '../services/face_auth_config.dart';
import '../services/reverification_scheduler.dart';
import '../services/worker_registry_service.dart';
import '../widgets/face_auth/face_verification_dialog.dart';
import '../widgets/face_auth/reverification_popup.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/remote_client.dart';
import '../data/repositories/remote/mdms.dart';
import '../data/repositories/local/localization.dart';
import '../data/repositories/remote/bandwidth_check.dart';
import '../models/downsync/downsync.dart';
import '../models/entities/notification_data.dart';
import '../models/entities/roles_type.dart';
import '../notification_handlers/notification_handler.dart';
import '../router/app_router.dart';
import '../router/authenticated_route_observer.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/runtime_hierarchy.dart';
import '../utils/utils.dart';
import '../widgets/download_progress/download_spinner_content.dart';
import '../widgets/error_screen.dart';
import '../widgets/root_detection_wrapper.dart';
import 'error_boundary.dart';

@RoutePage()
class AuthenticatedPageWrapper extends StatefulWidget {
  const AuthenticatedPageWrapper({super.key});

  @override
  State<AuthenticatedPageWrapper> createState() =>
      _AuthenticatedPageWrapperState();
}

class _AuthenticatedPageWrapperState extends State<AuthenticatedPageWrapper>
    with WidgetsBindingObserver {
  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

  /// The side panel hangs off this outer Scaffold while screens swap inside
  /// the nested AutoRouter, so the panel has to be closed explicitly on
  /// navigation — otherwise it stays open over the newly pushed screen.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController<HFReferralProgressData> _hfReferralProgress =
      StreamController<HFReferralProgressData>.broadcast();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isOfflineDialogShowing = false;
  bool _isLanguageLoaderShowing = false;

  // ── Face-auth / re-verification state ──
  FaceAuthConfig _faceAuthConfig = const FaceAuthConfig();
  bool _configFromRegister = false;
  bool _coWorkerEmbeddingsPrefetched = false;
  ReVerificationScheduler? _reVerificationScheduler;
  StreamSubscription<ReVerificationTrigger>? _reVerificationSubscription;
  StreamSubscription<ReVerificationState>? _reVerStateSubscription;
  ReVerificationBloc? _reVerificationBloc;
  // Held so we can push MDMS-derived threshold/maxAttempts into the live bloc
  // when config resolves AFTER the BlocProvider has created it.
  FaceGateBloc? _faceGateBloc;
  // Index of the trigger currently being prompted; cleared on terminal state.
  int? _activeTriggerIndex;
  final StreamController<List<DateTime>> _scheduleController =
      StreamController<List<DateTime>>.broadcast();
  final ValueNotifier<ReVerificationState?> _reVerStateNotifier =
      ValueNotifier(null);
  bool _lastEnrollmentActive = false;
  bool _lastConnectivityOnline = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
    _startReVerificationScheduler();
    // When face enrollment finishes (notifier flips true → false) regenerate
    // the schedule so prompts are relative to enrollment end, not app launch.
    faceEnrollmentActiveNotifier.addListener(_onEnrollmentActiveChanged);
    _registerScannerIdentityValidator();
  }

  /// The independent MDMS face-auth config fetch, shared by the gate and
  /// verification blocs so the server threshold is authoritative everywhere.
  Future<FaceAuthConfig?> _fetchFaceConfig() =>
      MdmsRepository(DioClient().dio).searchFaceAuthConfig(
        envConfig.variables.mdmsApiPath,
        envConfig.variables.tenantId,
      );

  @override
  void dispose() {
    // Drop the closure so a stale BoundaryBloc reference doesn't survive
    // logout → re-login (in which case a fresh AuthenticatedPageWrapper
    // will register a new one).
    ScannerComparisonRegistry().identityPayloadValidator = null;
    WidgetsBinding.instance.removeObserver(this);
    faceEnrollmentActiveNotifier.removeListener(_onEnrollmentActiveChanged);
    _reVerificationSubscription?.cancel();
    _reVerStateSubscription?.cancel();
    _reVerStateNotifier.dispose();
    _reVerificationScheduler?.dispose();
    _scheduleController.close();
    _connectivitySubscription.cancel();
    _drawerVisibilityController.close();
    _hfReferralProgress.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _reVerificationScheduler?.checkNow();
    }
  }

  /// Registers the reject-at-scan payload check for
  /// [JsonSchemaScannerBuilder]. Placed here (not in MainApplicationState)
  /// because the check needs the logged-in user's *mapped* boundary
  /// jurisdiction — not whichever leaf they've navigated to in the UI —
  /// and BoundaryBloc is only populated after login. Runs on this
  /// wrapper's mount, which happens post-auth.
  ///
  /// Match semantics: the scanned boundary is accepted when it equals
  /// any of the current user's mapped boundary codes OR sits underneath
  /// one of them in the hierarchy (prefix match with `_` as the segment
  /// separator). This handles the common case where a warehouse manager
  /// is mapped at a district/cluster level while CDDs sit at leaf
  /// clinics/villages beneath it.
  void _registerScannerIdentityValidator() {
    final boundaryBloc = context.read<BoundaryBloc>();
    ScannerComparisonRegistry().identityPayloadValidator = (payload) {
      final scannedBoundary = payload['boundaryCode']?.toString();
      if (scannedBoundary == null || scannedBoundary.isEmpty) {
        // Legacy CDD build with no boundary in the QR — skip the check
        // rather than false-positive.
        return null;
      }

      final mappedCodes = boundaryBloc.state.boundaryList
          .map((b) => b.code)
          .whereType<String>()
          .where((c) => c.isNotEmpty)
          .toSet();
      if (mappedCodes.isEmpty) {
        // Boundary bloc hasn't loaded any mapped boundaries — don't
        // false-positive on legitimate scans while the app is still
        // hydrating.
        return null;
      }

      final match = mappedCodes.any((code) =>
          scannedBoundary == code || scannedBoundary.startsWith('${code}_'));
      if (match) return null;

      return 'Scanned user is not in your assigned boundary. Rescan a user in your area.';
    };
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    final isOnline = result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
    final isOffline = !isOnline;

    if (isOffline && !_isOfflineDialogShowing && mounted) {
      _showNoInternetDialog();
    } else if (!isOffline && _isOfflineDialogShowing && mounted) {
      _dismissNoInternetDialog();
    }

    // Retry the worker-registry queue on every offline → online transition.
    if (isOnline && !_lastConnectivityOnline && mounted) {
      debugPrint(
          'AuthenticatedPage: connectivity restored — retrying pending worker registry sync');
      _retryPendingWorkerRegistrySync();
    }
    _lastConnectivityOnline = isOnline;
  }

  Future<void> _prefetchCoWorkerEmbeddings(BuildContext context) async {
    if (_coWorkerEmbeddingsPrefetched) return;
    try {
      if (!mounted) return;
      final individualId = context.loggedInIndividualId;
      if (individualId == null) return;

      final repository = context.read<FaceEmbeddingRepository>();
      final registerRepo = context
          .repository<AttendanceRegisterModel, AttendanceRegisterSearchModel>();
      final individualRepo =
          context.repository<IndividualModel, IndividualSearchModel>();

      final registers = await registerRepo
          .search(AttendanceRegisterSearchModel(attendeeId: individualId));
      if (!mounted) return;

      final now = DateTime.now();
      final todayStart =
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
      final todayEnd = todayStart + const Duration(days: 1).inMilliseconds - 1;

      for (final r in registers) {
        final start = r.startDate ?? 0;
        final end = r.endDate ?? 0;
        if (!(start <= todayEnd && end >= todayStart)) continue;

        _coWorkerEmbeddingsPrefetched = true;

        final eligibleRawIds = (r.attendees ?? <AttendeeModel>[])
            .where((a) =>
                a.denrollmentDate == null ||
                (a.denrollmentDate ?? now.millisecondsSinceEpoch) >=
                    now.millisecondsSinceEpoch)
            .map((a) => a.individualId)
            .where((id) => id != null && id.isNotEmpty)
            .cast<String>()
            .toList();

        if (eligibleRawIds.isEmpty) break;

        final individuals = await individualRepo
            .search(IndividualSearchModel(id: eligibleRawIds));
        if (!mounted) return;

        final coWorkerIds = individuals
            .where(
                (i) => i.id != null && i.id!.isNotEmpty && i.id != individualId)
            .map((i) => i.id!)
            .toList();

        if (coWorkerIds.isEmpty) break;

        final serviceRegistry =
            await context.read<Isar>().serviceRegistrys.where().findAll();
        if (!mounted) return;
        final service = WorkerRegistryService.fromServiceRegistry(
          dio: DioClient().dio,
          tenantId: envConfig.variables.tenantId,
          serviceRegistry: serviceRegistry,
        );

        for (final id in coWorkerIds) {
          if (!mounted) return;
          final hasLocal = await repository.hasEmbedding(id);
          if (!hasLocal) {
            await service.syncEnrollmentFromRegistry(
                individualId: id, repository: repository);
          }
        }
        break;
      }
    } catch (e) {
      debugPrint('AuthenticatedPage: _prefetchCoWorkerEmbeddings failed: $e');
    }
  }

  Future<void> _retryPendingWorkerRegistrySync() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingIds = <String>{};
      final legacySingle = prefs.getString('face_registry_sync_pending');
      if (legacySingle != null && legacySingle.isNotEmpty) {
        pendingIds.add(legacySingle);
      }
      pendingIds.addAll(
          prefs.getStringList('face_registry_sync_pending_ids') ?? const []);
      if (pendingIds.isEmpty) return;
      if (!mounted) return;

      final isar = context.read<Isar>();
      final repository = FaceEmbeddingRepository(isar);
      final serviceRegistry = await isar.serviceRegistrys.where().findAll();
      final service = WorkerRegistryService.fromServiceRegistry(
        dio: DioClient().dio,
        tenantId: envConfig.variables.tenantId,
        serviceRegistry: serviceRegistry,
      );

      final remaining = <String>{};
      for (final id in pendingIds) {
        final ok = await service.updateWorkerWithFaceEnrollment(
          individualId: id,
          repository: repository,
        );
        if (!ok) remaining.add(id);
      }

      await prefs.setStringList(
          'face_registry_sync_pending_ids', remaining.toList());
      await prefs.remove('face_registry_sync_pending');
    } catch (e) {
      debugPrint('AuthenticatedPage: worker registry sync retry failed: $e');
    }
  }

  void _showNoInternetDialog() {
    _isOfflineDialogShowing = true;
    showCustomPopup(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Popup(
        title: AppLocalizations.of(context).translate(
          i18.common.connectionLabel,
        ),
        description: AppLocalizations.of(context).translate(
          i18.common.connectionContent,
        ),
        actions: [
          DigitButton(
            label: AppLocalizations.of(context).translate(
              i18.common.coreCommonOk,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              _isOfflineDialogShowing = false;
            },
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
          ),
        ],
      ),
    );
  }

  void _dismissNoInternetDialog() {
    if (_isOfflineDialogShowing) {
      Navigator.of(context, rootNavigator: true).pop();
      _isOfflineDialogShowing = false;
    }
  }

  void _onEnrollmentActiveChanged() async {
    final now = faceEnrollmentActiveNotifier.value;
    if (_lastEnrollmentActive == true && now == false) {
      try {
        await _reVerificationScheduler?.regenerate();
        if (mounted && _reVerificationScheduler != null) {
          _scheduleController.add(_reVerificationScheduler!.currentSchedule);
        }
      } catch (e) {
        debugPrint(
            'AuthenticatedPage: failed to regenerate schedule after enrollment: $e');
      }
    }
    _lastEnrollmentActive = now;
  }

  Future<void> _initConfigFromRegister() async {
    if (_configFromRegister) return;
    try {
      if (!mounted) return;
      final mdmsFaceConfig = await _fetchFaceConfig();
      if (!mounted) return;
      final individualId = context.loggedInIndividualId;
      if (individualId == null) {
        if (mdmsFaceConfig != null) _faceAuthConfig = mdmsFaceConfig;
        return;
      }

      final registerRepo = context
          .repository<AttendanceRegisterModel, AttendanceRegisterSearchModel>();
      final now = DateTime.now();
      final registers = await registerRepo
          .search(AttendanceRegisterSearchModel(attendeeId: individualId));
      if (!mounted) return;

      final todayStart =
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
      final todayEnd = todayStart + const Duration(days: 1).inMilliseconds - 1;

      for (final r in registers) {
        final start = r.startDate ?? 0;
        final end = r.endDate ?? 0;
        if (start <= todayEnd && end >= todayStart) {
          _configFromRegister = true;
          _faceAuthConfig =
              _buildConfigFromRegister(r, mdmsConfig: mdmsFaceConfig);
          break;
        }
      }

      if (!_configFromRegister && mdmsFaceConfig != null) {
        _faceAuthConfig = mdmsFaceConfig;
      }
    } catch (e) {
      debugPrint('AuthenticatedPage: _initConfigFromRegister failed: $e');
    }
  }

  Future<void> _startReVerificationScheduler(
      {bool immediateFirstTrigger = false}) async {
    if (_reVerificationScheduler != null) return;

    try {
      final isSupervisor = _faceIsSupervisor(context);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('face_reverify_skip', isSupervisor);
      if (isSupervisor) {
        return;
      }
    } catch (e) {
      debugPrint('AuthenticatedPage: supervisor flag write failed: $e');
    }

    await _initConfigFromRegister();

    if (_reVerificationBloc != null && !_reVerificationBloc!.isClosed) {
      _reVerificationBloc!.updateConfig(_faceAuthConfig);
    }
    if (_faceGateBloc != null && !_faceGateBloc!.isClosed) {
      _faceGateBloc!.updateConfig(
        threshold: _faceAuthConfig.faceMatchThreshold,
        maxAttempts: _faceAuthConfig.maxFaceAttempts,
      );
    }

    _reVerificationScheduler = ReVerificationScheduler(config: _faceAuthConfig);
    _reVerificationScheduler!.isForeground = () =>
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    _reVerificationScheduler!
        .start(immediateFirstTrigger: immediateFirstTrigger)
        .then((_) {
      if (mounted) {
        _scheduleController.add(_reVerificationScheduler!.currentSchedule);
        _checkNotificationLaunch();
      }
    }).catchError((e) {
      debugPrint('AuthenticatedPage: scheduler start failed: $e');
    });
    _reVerificationSubscription =
        _reVerificationScheduler!.triggers.listen((trigger) {
      _dispatchTrigger(trigger);
    });
  }

  Future<void> _checkNotificationLaunch() async {
    try {
      final details = await NotificationService()
          .flutterLocalNotificationsPlugin
          .getNotificationAppLaunchDetails();
      if (details == null || !details.didNotificationLaunchApp) return;
      final payload = details.notificationResponse?.payload;
      if (payload == null ||
          !payload.startsWith(NotificationService.reVerifyPayloadPrefix)) {
        return;
      }
      final indexStr =
          payload.substring(NotificationService.reVerifyPayloadPrefix.length);
      final index = int.tryParse(indexStr);
      if (index == null) return;
      if (mounted) {
        _dispatchTrigger(ReVerificationTrigger(
          scheduledTime: DateTime.now(),
          triggerIndex: index,
        ));
      }
    } catch (e) {
      debugPrint('AuthenticatedPage: _checkNotificationLaunch failed: $e');
    }
  }

  void _markTriggerHandledByApp(int triggerIndex) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existing =
          (prefs.getStringList('face_reverification_bg_notified') ?? [])
              .toSet();
      existing.add(triggerIndex.toString());
      await prefs.setStringList(
          'face_reverification_bg_notified', existing.toList());
    } catch (e) {
      debugPrint('_markTriggerHandledByApp: $e');
    }
  }

  void _dispatchTrigger(ReVerificationTrigger trigger) async {
    final now = DateTime.now();
    try {
      final isar = context.read<Isar>();
      final repository = FaceEmbeddingRepository(isar);
      final enrollmentCount = await repository.count();
      if (enrollmentCount == 0) {
        _reVerificationScheduler?.markPending(trigger.triggerIndex);
        return;
      }
    } catch (e) {
      _reVerificationScheduler?.markPending(trigger.triggerIndex);
      return;
    }

    if (!mounted) return;

    try {
      final individualId = context.loggedInIndividualId;
      if (individualId != null) {
        final registerRepo = context.repository<AttendanceRegisterModel,
            AttendanceRegisterSearchModel>();
        final registers = await registerRepo.search(
          AttendanceRegisterSearchModel(attendeeId: individualId),
        );

        final todayStart =
            DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
        final todayEnd =
            todayStart + const Duration(days: 1).inMilliseconds - 1;

        AttendanceRegisterModel? activeRegister;
        for (final r in registers) {
          final start = r.startDate ?? 0;
          final end = r.endDate ?? 0;
          if (start <= todayEnd && end >= todayStart) {
            activeRegister = r;
            break;
          }
        }

        if (activeRegister == null && registers.isNotEmpty) {
          _reVerificationScheduler?.markPending(trigger.triggerIndex);
          return;
        }

        if (!_configFromRegister && activeRegister != null) {
          _configFromRegister = true;
          final mdmsFaceConfig = await _fetchFaceConfig();
          final newConfig = _buildConfigFromRegister(
            activeRegister,
            mdmsConfig: mdmsFaceConfig,
          );
          final configChanged =
              newConfig.startHour != _faceAuthConfig.startHour ||
                  newConfig.endHour != _faceAuthConfig.endHour ||
                  newConfig.promptCount != _faceAuthConfig.promptCount ||
                  newConfig.minGapMinutes != _faceAuthConfig.minGapMinutes;
          if (!_coWorkerEmbeddingsPrefetched) {
            _prefetchCoWorkerEmbeddings(context);
          }
          if (configChanged) {
            final newDayEnd =
                DateTime(now.year, now.month, now.day, newConfig.endHour);
            if (now.isAfter(newDayEnd)) {
              _restartSchedulerWithConfig(newConfig,
                  immediateFirstTrigger: false);
              return;
            } else {
              _restartSchedulerWithConfig(newConfig);
            }
          }
        }
      }
    } catch (e) {
      debugPrint(
          'AuthenticatedPage: attendance check threw: $e — failing open');
    }

    if (!mounted) return;

    final topRoute = context.router.topRoute.name;
    if (topRoute == FaceGateRoute.name ||
        topRoute == NonMobileFaceEnrollRoute.name) {
      _reVerificationScheduler?.markPending(trigger.triggerIndex);
      return;
    }

    if (_reVerificationBloc != null && !_reVerificationBloc!.isClosed) {
      _activeTriggerIndex = trigger.triggerIndex;
      _reVerificationBloc!.add(
        ReVerificationEvent.triggered(trigger: trigger),
      );
      _markTriggerHandledByApp(trigger.triggerIndex);
      _reVerificationScheduler?.clearPending();
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) _dispatchTrigger(trigger);
      });
    }
    if (mounted) {
      _scheduleController.add(_reVerificationScheduler!.currentSchedule);
    }
  }

  FaceAuthConfig _buildConfigFromRegister(
    AttendanceRegisterModel register, {
    FaceAuthConfig? mdmsConfig,
  }) {
    final d = mdmsConfig ?? const FaceAuthConfig();
    final details = register.additionalDetails;
    return FaceAuthConfig(
      startHour: (details?['startHour'] as num?)?.toInt() ?? d.startHour,
      endHour: (details?['endHour'] as num?)?.toInt() ?? d.endHour,
      promptCount: d.promptCount,
      minGapMinutes: d.minGapMinutes,
      countdownDuration: d.countdownDuration,
      maxFaceAttempts: d.maxFaceAttempts,
      faceMatchThreshold: d.faceMatchThreshold,
    );
  }

  void _restartSchedulerWithConfig(FaceAuthConfig newConfig,
      {bool immediateFirstTrigger = true}) {
    _reVerificationSubscription?.cancel();
    _reVerificationSubscription = null;
    _reVerificationScheduler?.dispose();
    _reVerificationScheduler = null;
    _faceAuthConfig = newConfig;
    _reVerificationBloc?.updateConfig(newConfig);
    _faceGateBloc?.updateConfig(
      threshold: newConfig.faceMatchThreshold,
      maxAttempts: newConfig.maxFaceAttempts,
    );
    _startReVerificationScheduler(immediateFirstTrigger: immediateFirstTrigger);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RootDetectionWrapper(
      child: ShowcaseWidget(
        enableAutoScroll: true,
        builder: Builder(
          builder: (context) {
            return StreamBuilder<bool>(
              stream: _drawerVisibilityController.stream,
              builder: (context, snapshot) {
                final showDrawer = snapshot.data ?? false;

                return Portal(
                  child: Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: theme.colorTheme.generic.background,
                    appBar: AppBar(
                      backgroundColor: theme.colorTheme.primary.primary2,
                      foregroundColor: theme.colorTheme.paper.primary,
                      title: ValueListenableBuilder<ReVerificationState?>(
                        valueListenable: _reVerStateNotifier,
                        builder: (context, state, _) {
                          if (state is! ReVerificationPromptedState) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            'Attempt ${state.iteration} of ${state.maxIterations}',
                            style: TextStyle(
                              color: theme.colorTheme.paper.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                      actions: null,
                    ),
                    drawer: showDrawer ? drawerWidget(context) : null,
                    body: MultiBlocProvider(
                      providers: [
                        // Face-auth: provide the ML service, embedding store,
                        // and gate/verification blocs so the FaceGate route
                        // (pushed from Home) can read them.
                        RepositoryProvider<FaceModelService>(
                          create: (_) => FaceModelService()..initialize(),
                        ),
                        RepositoryProvider<FaceEmbeddingRepository>(
                          create: (ctx) =>
                              FaceEmbeddingRepository(ctx.read<Isar>()),
                        ),
                        BlocProvider(
                          create: (ctx) {
                            final appInit = ctx
                                .read<AppInitializationBloc>()
                                .state as AppInitialized;
                            _faceGateBloc = FaceGateBloc(
                              repository: ctx.read<FaceEmbeddingRepository>(),
                              workerRegistryService:
                                  WorkerRegistryService.fromServiceRegistry(
                                dio: DioClient().dio,
                                tenantId: envConfig.variables.tenantId,
                                serviceRegistry: appInit.serviceRegistryList,
                              ),
                              // Independent MDMS fetch, loaded lazily by the bloc
                              // on checkEnrollment so the server threshold applies
                              // before the first verification.
                              configLoader: _fetchFaceConfig,
                            );
                            return _faceGateBloc!;
                          },
                        ),
                        BlocProvider(
                          create: (ctx) => FaceVerificationBloc(
                            faceModelService: ctx.read<FaceModelService>(),
                            embeddingRepository:
                                ctx.read<FaceEmbeddingRepository>(),
                            similarityThreshold:
                                FaceAuthConfig.defaultFaceMatchThreshold,
                            thresholdLoader: () async =>
                                (await _fetchFaceConfig())?.faceMatchThreshold,
                          ),
                        ),
                        BlocProvider(create: (_) => LivenessBloc()),
                        BlocProvider(
                          lazy: false,
                          create: (ctx) {
                            _reVerificationBloc = ReVerificationBloc(
                              repository: ctx.read<FaceEmbeddingRepository>(),
                              config: _faceAuthConfig,
                              currentUserIndividualId:
                                  context.loggedInIndividualId ?? '',
                            );
                            _reVerStateSubscription?.cancel();
                            _reVerStateSubscription =
                                _reVerificationBloc!.stream.listen((state) {
                              _reVerStateNotifier.value = state;
                              final terminal = state.maybeWhen(
                                verified: (_, __) => true,
                                missed: (_) => true,
                                orElse: () => false,
                              );
                              if (terminal && _activeTriggerIndex != null) {
                                final idx = _activeTriggerIndex!;
                                _reVerificationScheduler?.markCompleted(idx);
                                _activeTriggerIndex = null;
                              }
                            });
                            return _reVerificationBloc!;
                          },
                        ),
                        // INFO : Need to add bloc of package Here
                        BlocProvider(
                          create: (context) {
                            final userId = context.loggedInUserUuid;

                            final isar = context.read<Isar>();
                            final bloc = SyncBloc(
                              isar: isar,
                              syncService: SyncService(),
                            );

                            if (!bloc.isClosed) {
                              bloc.add(SyncRefreshEvent(userId));
                            }
                            /* Every time when the user changes the screen
     this will refresh the data of sync count */
                            isar.opLogs
                                .filter()
                                .createdByEqualTo(userId)
                                .syncedUpEqualTo(false)
                                .watch()
                                .listen(
                              (event) {
                                if (!bloc.isClosed) {
                                  triggerSyncRefreshEvent(bloc, userId, event);
                                }
                              },
                            );

                            isar.opLogs
                                .filter()
                                .createdByEqualTo(userId)
                                .syncedUpEqualTo(true)
                                .syncedDownEqualTo(false)
                                .watch()
                                .listen(
                              (event) {
                                if (!bloc.isClosed) {
                                  triggerSyncRefreshEvent(bloc, userId, event);
                                }
                              },
                            );

                            return bloc;
                          },
                        ),
                        BlocProvider(
                          create: (_) => LocationBloc(location: Location())
                            ..add(const LoadLocationEvent()),
                        ),
                        BlocProvider(
                          create: (ctx) => BeneficiaryDownSyncBloc(
                            bandwidthCheckRepository: BandwidthCheckRepository(
                              DioClient().dio,
                              bandwidthPath:
                                  envConfig.variables.checkBandwidthApiPath,
                            ),
                            individualLocalRepository: ctx.read<
                                LocalRepository<IndividualModel,
                                    IndividualSearchModel>>(),
                            downSyncRemoteRepository: ctx.read<
                                RemoteRepository<DownsyncModel,
                                    DownsyncSearchModel>>(),
                            downSyncLocalRepository: ctx.read<
                                LocalRepository<DownsyncModel,
                                    DownsyncSearchModel>>(),
                            householdLocalRepository: ctx.read<
                                LocalRepository<HouseholdModel,
                                    HouseholdSearchModel>>(),
                            householdMemberLocalRepository: ctx.read<
                                LocalRepository<HouseholdMemberModel,
                                    HouseholdMemberSearchModel>>(),
                            projectBeneficiaryLocalRepository: ctx.read<
                                LocalRepository<ProjectBeneficiaryModel,
                                    ProjectBeneficiarySearchModel>>(),
                            taskLocalRepository: ctx.read<
                                LocalRepository<TaskModel, TaskSearchModel>>(),
                            sideEffectLocalRepository: ctx.read<
                                LocalRepository<SideEffectModel,
                                    SideEffectSearchModel>>(),
                            referralLocalRepository: ctx.read<
                                LocalRepository<ReferralModel,
                                    ReferralSearchModel>>(),
                            hfReferralLocalRepository: ctx.read<
                                LocalRepository<HFReferralModel,
                                    HFReferralSearchModel>>(),
                            serviceLocalRepository: ctx.read<
                                LocalRepository<ServiceModel,
                                    ServiceSearchModel>>(),
                          ),
                        ),
                        BlocProvider(
                          create: (ctx) => StockDownSyncBloc(
                            localSecureStore: LocalSecureStore.instance,
                            bandwidthCheckRepository: BandwidthCheckRepository(
                              DioClient().dio,
                              bandwidthPath:
                                  envConfig.variables.checkBandwidthApiPath,
                            ),
                            projectFacilityLocalRepository: ctx.read<
                                LocalRepository<ProjectFacilityModel,
                                    ProjectFacilitySearchModel>>(),
                            facilityLocalRepository: ctx.read<
                                LocalRepository<FacilityModel,
                                    FacilitySearchModel>>(),
                            stockRemoteRepository: ctx.read<
                                RemoteRepository<StockModel,
                                    StockSearchModel>>(),
                            stockLocalRepository: ctx.read<
                                LocalRepository<StockModel,
                                    StockSearchModel>>(),
                            projectResourceLocalRepository: ctx.read<
                                LocalRepository<ProjectResourceModel,
                                    ProjectResourceSearchModel>>(),
                            downSyncLocalRepository: ctx.read<
                                LocalRepository<DownsyncModel,
                                    DownsyncSearchModel>>(),
                            userActionRemoteRepository:
                                ctx.read<UserActionRemoteRepository>(),
                            userActionLocalRepository:
                                ctx.read<UserActionLocalRepository>(),
                          ),
                        ),
                        BlocProvider(
                          create: (ctx) => HFReferralDownSyncBloc(
                            bandwidthCheckRepository: BandwidthCheckRepository(
                              DioClient().dio,
                              bandwidthPath:
                                  envConfig.variables.checkBandwidthApiPath,
                            ),
                            hfReferralLocalRepository: ctx.read<
                                LocalRepository<HFReferralModel,
                                    HFReferralSearchModel>>(),
                            hfReferralRemoteRepository: ctx.read<
                                RemoteRepository<HFReferralModel,
                                    HFReferralSearchModel>>(),
                            downSyncLocalRepository: ctx.read<
                                LocalRepository<DownsyncModel,
                                    DownsyncSearchModel>>(),
                            projectFacilityLocalRepository: ctx.read<
                                LocalRepository<ProjectFacilityModel,
                                    ProjectFacilitySearchModel>>(),
                          ),
                        ),
                        BlocProvider(
                          create: (_) => ServiceBloc(
                            const ServiceEmptyState(),
                            serviceDataRepository: context
                                .repository<ServiceModel, ServiceSearchModel>(),
                          ),
                        ),
                        BlocProvider(
                          create: (_) => FormsBloc(),
                        ),
                      ],
                      child: MultiBlocListener(
                        listeners: [
                          BlocListener<PushNotificationBloc,
                              PushNotificationState>(
                            listener: (context, state) {
                              if (state is PushNotificationTappedState) {
                                final notificationData =
                                    NotificationData.fromMap(state.data);

                                NotificationHandlerFactory.getHandler(
                                        notificationData.notificationType)
                                    ?.handle(context, notificationData.payload);
                              }
                            },
                          ),
                          BlocListener<HFReferralDownSyncBloc,
                              HFReferralDownSyncState>(
                            listener: (context, hfDownSyncState) {
                              final localizations =
                                  AppLocalizations.of(context);
                              final appConfiguration = (context
                                      .read<AppInitializationBloc>()
                                      .state as AppInitialized)
                                  .appConfiguration;
                              hfDownSyncState.maybeWhen(
                                orElse: () {},
                                loading: () {
                                  showCustomPopup(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (ctx) => Popup(
                                      type: PopUpType.simple,
                                      title: "",
                                      additionalWidgets: [
                                        DownloadSpinnerContent(
                                          title: localizations.translate(
                                            i18.beneficiaryDetails
                                                .dataDownloadInProgress,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                dataFound: (newCount, serverTotalCount) {
                                  Navigator.of(context, rootNavigator: true)
                                      .popUntil(
                                          (route) => route is! PopupRoute);
                                  if (newCount > 0)
                                    showCustomPopup(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (ctx) => Popup(
                                        title: localizations.translate(
                                          i18.beneficiaryDetails.dataFound,
                                        ),
                                        titleIcon: Icon(
                                          Icons.info_outline_rounded,
                                          color: Theme.of(context)
                                              .colorTheme
                                              .text
                                              .primary,
                                        ),
                                        description: localizations.translate(
                                          i18.beneficiaryDetails
                                              .dataFoundContent,
                                        ),
                                        actions: [
                                          DigitButton(
                                            label: localizations.translate(
                                              i18.common.coreCommonDownload,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<
                                                      HFReferralDownSyncBloc>()
                                                  .add(
                                                    HFReferralDownSyncDownloadEvent(
                                                      projectId:
                                                          context.projectId,
                                                      appConfiguration: [
                                                        appConfiguration
                                                      ],
                                                      totalCount: newCount,
                                                      serverTotalCount:
                                                          serverTotalCount,
                                                    ),
                                                  );
                                            },
                                            type: DigitButtonType.primary,
                                            size: DigitButtonSize.medium,
                                          ),
                                          DigitButton(
                                            label: localizations.translate(
                                              i18.beneficiaryDetails
                                                  .proceedWithoutDownloading,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              context.router
                                                  .replaceAll([HomeRoute()]);
                                            },
                                            type: DigitButtonType.secondary,
                                            size: DigitButtonSize.medium,
                                          ),
                                        ],
                                      ),
                                    );
                                  if (newCount == 0)
                                    showCustomPopup(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (ctx) => Popup(
                                        type: PopUpType.alert,
                                        title: localizations.translate(
                                          i18.beneficiaryDetails.noDataFound,
                                        ),
                                        description: localizations.translate(
                                          i18.beneficiaryDetails
                                              .noDataFoundContent,
                                        ),
                                        titleIcon: Icon(
                                          Icons.warning_amber_rounded,
                                          size: 60.0,
                                          color: Theme.of(context)
                                              .colorTheme
                                              .alert
                                              .error,
                                        ),
                                        actions: [
                                          DigitButton(
                                            label: localizations.translate(
                                              i18.common.proceed,
                                            ),
                                            capitalizeLetters: false,
                                            type: DigitButtonType.primary,
                                            size: DigitButtonSize.large,
                                            mainAxisSize: MainAxisSize.max,
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              context.router
                                                  .replaceAll([HomeRoute()]);
                                            },
                                          ),
                                          DigitButton(
                                            label: localizations.translate(
                                              i18.common.coreCommonGoback,
                                            ),
                                            capitalizeLetters: false,
                                            type: DigitButtonType.secondary,
                                            size: DigitButtonSize.large,
                                            mainAxisSize: MainAxisSize.max,
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              context
                                                  .read<
                                                      HFReferralDownSyncBloc>()
                                                  .add(
                                                    const HFReferralDownSyncResetStateEvent(),
                                                  );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                },
                                inProgress: (syncedCount, totalCount) {
                                  final progressData = HFReferralProgressData(
                                    progress: totalCount == 0
                                        ? 0
                                        : (syncedCount / totalCount)
                                            .clamp(0.0, 1.0),
                                    syncedCount: syncedCount,
                                    totalCount: totalCount,
                                  );
                                  if (syncedCount < 1) {
                                    if (_hfReferralProgress.isClosed) {
                                      _hfReferralProgress = StreamController<
                                          HFReferralProgressData>.broadcast();
                                    }
                                    showHFReferralProgressDialog(
                                      context,
                                      title: localizations.translate(
                                        i18.beneficiaryDetails
                                            .dataDownloadInProgress,
                                      ),
                                      progressController: _hfReferralProgress,
                                      initialData: progressData,
                                    );
                                  }
                                  if (!_hfReferralProgress.isClosed) {
                                    _hfReferralProgress.add(progressData);
                                  }
                                },
                                success: (syncedCount, totalCount) {
                                  Navigator.of(context, rootNavigator: true)
                                      .popUntil(
                                          (route) => route is! PopupRoute);
                                  DigitSyncDialog.show(
                                    context,
                                    type: DialogType.complete,
                                    label: localizations.translate(
                                      i18.beneficiaryDetails
                                          .referralDownloadCompleted,
                                    ),
                                    primaryAction: DigitDialogActions(
                                      label: localizations.translate(
                                        i18.acknowledgementSuccess.goToHome,
                                      ),
                                      action: (ctx) {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        context.router
                                            .replaceAll([HomeRoute()]);
                                      },
                                    ),
                                  );
                                },
                                failed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .popUntil(
                                          (route) => route is! PopupRoute);
                                  DigitSyncDialog.show(
                                    context,
                                    type: DialogType.failed,
                                    label: localizations.translate(
                                      i18.common.coreCommonDownloadFailed,
                                    ),
                                    primaryAction: DigitDialogActions(
                                      label: localizations.translate(
                                        i18.syncDialog.retryButtonLabel,
                                      ),
                                      action: (ctx) {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        context
                                            .read<HFReferralDownSyncBloc>()
                                            .add(
                                              HFReferralDownSyncStartEvent(
                                                projectId: context.projectId,
                                                appConfiguration: [
                                                  appConfiguration
                                                ],
                                              ),
                                            );
                                      },
                                    ),
                                    secondaryAction: DigitDialogActions(
                                      label: localizations.translate(
                                        i18.beneficiaryDetails
                                            .proceedWithoutDownloading,
                                      ),
                                      action: (ctx) {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        context.router
                                            .replaceAll([HomeRoute()]);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                        child: ErrorBoundary(builder: (context, error) {
                          if (error == null) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _prefetchCoWorkerEmbeddings(context);
                              _retryPendingWorkerRegistrySync();
                            });
                          }
                          return error != null
                              ? const ErrorScreen()
                              : ReVerificationListener(
                                  child: Column(
                                    children: [
                                      const _ReVerificationCountdownBanner(),
                                      Expanded(
                                        child: AutoRouter(
                                  navigatorObservers: () => [
                                    AuthenticatedRouteObserver(
                                      onNavigated: () {
                                        // Dismiss the side panel on any route
                                        // change. Deferred to after the frame
                                        // because onNavigated fires mid
                                        // navigation.
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          final scaffold =
                                              _scaffoldKey.currentState;
                                          if (scaffold?.isDrawerOpen ?? false) {
                                            scaffold!.closeDrawer();
                                          }
                                        });

                                        bool shouldShowDrawer;
                                        switch (context.router.topRoute.name) {
                                          case ProjectSelectionRoute.name:
                                          case BoundarySelectionRoute.name:
                                          case PermissionsRoute.name:
                                          case FaceGateRoute.name:
                                            shouldShowDrawer = false;
                                            break;
                                          default:
                                            shouldShowDrawer = true;
                                        }

                                        _drawerVisibilityController
                                            .add(shouldShowDrawer);
                                      },
                                    ),
                                  ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        }),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void triggerSyncRefreshEvent(
      SyncBloc bloc, String userId, List<OpLog> event) {
    bloc.add(
      SyncRefreshEvent(
        userId,
        SyncServiceSingleton().entityMapper!.getSyncCount(event),
      ),
    );
  }

  Widget drawerWidget(BuildContext context) {
    final appInitializationBloc = context.read<AppInitializationBloc>();
    final appConfig =
        (appInitializationBloc.state as AppInitialized).appConfiguration;
    final authBloc = context.read<AuthBloc>();
    bool isDistributor = authBloc.state != const AuthState.unauthenticated()
        ? context.loggedInUserRoles
            .where(
              (role) => role.code == RolesType.distributor.toValue(),
            )
            .toList()
            .isNotEmpty
        : false;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return BlocListener<LocalizationBloc, LocalizationState>(
        listener: (context, state) {
          // Only dismiss the overlay loader shown on language change.
          // Localization also reloads during logout, where a blind pop
          // would dismiss an arbitrary route (e.g. re-flash the logout
          // popup while it is animating out).
          if (state.loading == false && _isLanguageLoaderShowing) {
            _isLanguageLoaderShowing = false;
            Navigator.of(context, rootNavigator: true).pop();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: SideBar(
              profile: state.maybeMap(
                authenticated: (value) => ProfileWidget(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.router.push(UserQRDetailsRoute());
                    },
                    child: QrImageView(
                      // CDD identity QR carries both userId and the CDD's
                      // leaf boundary so the warehouse manager's dispatch
                      // scan can populate the receiver-side form. JSON keys
                      // are deliberately named after the warehouseDetails
                      // form field names (teamCode, administrativeArea) so
                      // JsonSchemaScannerBuilder's spread-by-form-control
                      // step lands them automatically — no transformer
                      // changes and no new form fields needed.
                      data: jsonEncode({
                        'userId': context.loggedInUserUuid,
                        'boundaryCode': context.boundaryOrNull?.code ?? '',
                      }),
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                  ),
                  title: value.userModel.name.toString(),
                  description: value.userModel.mobileNumber.toString(),
                ),
                orElse: () => null,
              ),
              sidebarItems: [
                SidebarItem(
                  title: AppLocalizations.of(context).translate(
                    i18.common.coreCommonHome,
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.router.replaceAll([HomeRoute()]);
                  },
                  icon: Icons.home,
                ),
                if (isDistributor) ...[
                  SidebarItem(
                    title: AppLocalizations.of(context).translate(
                      i18.common.coreCommonViewDownloadedData,
                    ),
                    icon: Icons.download,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.router.push(const BeneficiariesReportRoute());
                    },
                  ),
                  SidebarItem(
                    title: AppLocalizations.of(context).translate(
                      i18.nonMobileUser.nonMobileUserLabel,
                    ),
                    icon: Icons.people_alt,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.router.push(const NonMobileUserListRoute());
                    },
                  ),
                ],
              ],
              logOutDigitButtonLabel: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonLogout),
              onLogOut: () async {
                final isConnected = await getIsConnected();
                if (context.mounted) {
                  if (isConnected) {
                    // The popup only collects the decision; all logout side
                    // effects run after it has fully left the screen so it
                    // can never re-render (e.g. with cleared localization
                    // strings) while animating out.
                    final shouldLogout = await showCustomPopup(
                      context: context,
                      builder: (ctx) => Popup(
                        title: AppLocalizations.of(context).translate(
                          i18.common.logoutConfirmationHeading,
                        ),
                        description: AppLocalizations.of(context).translate(
                          i18.common.logoutConfirmationDescription,
                        ),
                        onOutsideTap: () {
                          Navigator.of(ctx).pop(false);
                        },
                        onCrossTap: () {
                          Navigator.of(ctx).pop(false);
                        },
                        type: PopUpType.simple,
                        inlineActions: true,
                        actions: [
                          DigitButton(
                              label: AppLocalizations.of(context).translate(
                                i18.common.coreCommonLogout,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(true);
                              },
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large),
                          DigitButton(
                              label: AppLocalizations.of(context).translate(
                                i18.common.coreCommonCancel,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                              type: DigitButtonType.secondary,
                              size: DigitButtonSize.large)
                        ],
                      ),
                    );

                    if (shouldLogout == true && context.mounted) {
                      // Wait out the popup's exit transition (300ms in
                      // showCustomPopup) before clearing localization.
                      await Future.delayed(const Duration(milliseconds: 300));
                      if (!context.mounted) return;
                      final isar = context.read<Isar>();
                      final serviceRegistry =
                          await isar.serviceRegistrys.where().findAll();
                      final apiEndPoint = Constants.getNotificationEndPoint(
                        serviceRegistry: serviceRegistry,
                        service: 'NOTIFICATION',
                        action: ApiOperation.unRegister.toValue(),
                        entityName: 'NotificationToken',
                      );

                      if (context.mounted) {
                        context.read<PushNotificationBloc>().add(
                              PushNotificationEvent.logout(
                                apiEndPoint: apiEndPoint,
                              ),
                            );
                        context
                            .read<BoundaryBloc>()
                            .add(const BoundaryResetEvent());
                        context.read<LocalizationBloc>().add(
                              LocalizationEvent.onLoadLocalization(
                                module: Constants.homeLocalizationModules
                                    .join(','),
                                tenantId: envConfig.variables.tenantId,
                                locale: AppSharedPreferences()
                                        .getSelectedLocale ??
                                    '',
                                path: Constants.localizationApiPath,
                              ),
                            );
                        context
                            .read<AuthBloc>()
                            .add(const AuthLogoutEvent());
                      }
                    }
                  } else {
                    Toast.showToast(
                      context,
                      message: AppLocalizations.of(context).translate(
                        i18.login.noInternetError,
                      ),
                      type: ToastType.error,
                    );
                  }
                }
              },
              footer: PoweredByDigit(
                version: Constants().version,
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Fetches and caches the boundary localization for [locale] in the main
  /// `localization` table. Runs at language-switch time so a locale we
  /// haven't fetched yet doesn't leave the boundary dropdown blank. Any
  /// failure here is non-fatal — the language switch always proceeds.
  Future<void> _ensureBoundaryLocalizationCached(
    BuildContext context,
    String locale,
  ) async {
    final locBloc = context.read<LocalizationBloc>();
    final hierarchyType = runtimeHierarchyType();
    final boundaryModule = 'hcm-boundary-${hierarchyType.toLowerCase()}';
    // Two kinds of code go in:
    //   1. Boundary code (e.g. IN_KA_BLR) — the raw `b.code`.
    //   2. Hierarchy-level LABEL code (e.g. HCM-MOZ-HIERARCHY_District) —
    //      not the bare `b.label`. The boundary selection page looks up
    //      level labels as `${runtimeHierarchyType()}_$label`
    //      (boundary_selection.dart:142-145), so the localization row for
    //      the label lives under that composite code, not the bare label.
    //
    // Reading from `boundaryLocalRepository`, NOT from
    // `boundaryBloc.state.boundaryList`. The bloc's list only holds the
    // partial slice `BoundaryFindEvent` returned; the full tree the user
    // can drill into was downsynced into the local DB at project selection
    // (project.dart:801). Using the local repo here means switching
    // language pulls translations for every drill-reachable boundary in
    // one shot.
    try {
      // Local boundary lookup lives inside the try — a failure here (Isar
      // error, cast mismatch when the repo isn't wired for this profile,
      // etc.) must not abort the language switch, otherwise the
      // non-dismissible overlay stays up and the localization event that
      // dispatches the actual language change is never fired.
      final boundaryLocalRepo =
          context.read<LocalRepository<BoundaryModel, BoundarySearchModel>>();
      final allBoundaries =
          await boundaryLocalRepo.search(BoundarySearchModel());
      final allBoundaryCodes = allBoundaries
          .expand((b) => [
                b.code,
                if (b.label != null && b.label!.isNotEmpty)
                  '${hierarchyType}_${b.label}',
              ])
          .whereType<String>()
          .where((s) => s.isNotEmpty)
          .toSet();
      // Only fetch codes that aren't already cached locally for this
      // locale. Historically this path did an unconditional fetch of
      // every boundary code (potentially thousands on a large hierarchy)
      // on every language switch, because the coarser module-level
      // fetchLocalization check would false-positive on a partially-
      // populated cache. `fetchCachedCodesForLocale` gives us a precise
      // code-level delta — an all-cached switch becomes one indexed
      // SELECT and zero HTTP calls.
      final cachedCodes =
          await LocalizationLocalRepository().fetchCachedCodesForLocale(
        sql: locBloc.sql,
        locale: locale,
        codes: allBoundaryCodes,
      );
      final missingCodes = allBoundaryCodes.difference(cachedCodes).toList();
      if (missingCodes.isNotEmpty) {
        final results = await locBloc.localizationRepository.loadLocalization(
          path: Constants.localizationApiPath,
          locale: locale,
          module: boundaryModule,
          tenantId: envConfig.variables.tenantId,
          codes: missingCodes.join(','),
        );
        await LocalizationLocalRepository().create(results, locBloc.sql);
      }
    } catch (e) {
      debugPrint(
          'error caching boundary localization for $locale on language switch: $e');
    }
  }

  List<SidebarItem>? buildLanguage(
      BackendInterface localizationModulesList,
      List<Languages>? languages,
      BuildContext context,
      AppConfiguration appConfig) {
    final state = context.read<AppInitializationBloc>().state as AppInitialized;
    return languages
        ?.map((e) => SidebarItem(
              title: e.label,
              onPressed: () async {
                _isLanguageLoaderShowing = true;
                DigitLoaders.overlayLoader(context: context);

                int index = languages.indexWhere(
                  (ele) => ele.value.toString() == e.value.toString(),
                );

                /// TODO: NEED TO CHECK HOW CAN WE UPDATE THE LOCALIZATION BASED ON THE FLOW
                // String? dynamicModule;
                // final isInRegistrationFlow = context.router.current.name
                //     .contains(RegistrationDeliveryWrapperRoute.name);
                //
                // if (isInRegistrationFlow) {
                //   final prefs = await SharedPreferences.getInstance();
                //   final schemaJsonRaw = prefs.getString('app_config_schemas');
                //
                //   if (schemaJsonRaw != null) {
                //     final allSchemas =
                //         json.decode(schemaJsonRaw) as Map<String, dynamic>;
                //     final projectId = context.selectedProject.referenceID;
                //
                //     // Initialize empty list to collect modules
                //     final List<String> modules = [];
                //
                //     // Handle registrationflow
                //     final registrationSchemaEntry =
                //         allSchemas['REGISTRATIONFLOW'] as Map<String, dynamic>?;
                //     final registrationSchemaData =
                //         registrationSchemaEntry?['data'];
                //     final registrationFlowName = registrationSchemaData?['name']
                //         ?.toString()
                //         .toLowerCase();
                //     if (registrationFlowName != null && projectId != null) {
                //       modules.add('hcm-$registrationFlowName-$projectId');
                //     }
                //
                //     // Handle deliveryflow
                //     final deliverySchemaEntry =
                //         allSchemas['DELIVERYFLOW'] as Map<String, dynamic>?;
                //     final deliverySchemaData = deliverySchemaEntry?['data'];
                //     final deliveryFlowName =
                //         deliverySchemaData?['name']?.toString().toLowerCase();
                //     if (deliveryFlowName != null && projectId != null) {
                //       modules.add('hcm-$deliveryFlowName-$projectId');
                //     }
                //
                //     // Combine into a single string
                //     dynamicModule = modules.join(',');
                //   }
                // }
                //
                // final staticModules = localizationModulesList.interfaces
                //     .where((element) =>
                //         element.type == Modules.localizationModule &&
                //         Constants.homeLocalizationModules
                //             .contains(element.name.toString()))
                //     .map((e) => e.name.toString())
                //     .followedBy([
                //   'hcm-boundary-${envConfig.variables.hierarchyType}'
                // ]).join(',');
                //
                // final combinedModules = dynamicModule != null
                //     ? '$dynamicModule,$staticModules'
                //     : staticModules;
                //
                // context
                //     .read<LocalizationBloc>()
                //     .add(LocalizationEvent.onLoadLocalization(
                //       module: combinedModules,
                //       tenantId: appConfig.tenantId ?? "default",
                //       locale: e.value.toString(),
                //       path: Constants.localizationApiPath,
                //     ));

                // Boundary localizations are seeded for every locale during
                // project_selection, but that seed loop swallows per-locale
                // failures (debugPrint only). When it failed for the locale
                // the user is now switching to, boundary labels would render
                // as raw codes because OnUpdateLocalizationIndexEvent only
                // reloads what's already cached. Try a best-effort fetch for
                // the new locale's boundary module before switching the
                // index; failures are non-fatal — language switch proceeds.
                await _ensureBoundaryLocalizationCached(
                    context, e.value.toString());
                if (!context.mounted) return;

                context.read<LocalizationBloc>().add(
                      OnUpdateLocalizationIndexEvent(
                        index: index,
                        code: e.value.toString(),
                      ),
                    );
              },
              initiallySelected: getSelectedLanguage(
                  state,
                  languages.indexWhere(
                    (ele) => ele.value.toString() == e.value.toString(),
                  )),
            ))
        .toList();
  }
}

// ── Face-auth role helpers (file-private; mirror context extensions) ──
bool _faceIsSupervisor(BuildContext context) {
  try {
    return context.loggedInUserRoles.any((r) =>
        r.code == RolesType.teamSupervisor.toValue() ||
        r.code == RolesType.districtSupervisor.toValue());
  } catch (_) {
    return false;
  }
}

bool _faceIsTeamSupervisor(BuildContext context) {
  try {
    return context.loggedInUserRoles
        .any((r) => r.code == RolesType.teamSupervisor.toValue());
  } catch (_) {
    return false;
  }
}

class _ReVerificationCountdownBanner extends StatelessWidget {
  const _ReVerificationCountdownBanner();

  @override
  Widget build(BuildContext context) {
    if (_faceIsTeamSupervisor(context)) return const SizedBox.shrink();

    final currentRoute = context.router.topRoute.name;
    final isOnFaceGate = currentRoute == FaceGateRoute.name;

    return BlocBuilder<ReVerificationBloc, ReVerificationState>(
      builder: (context, state) {
        final isPrompted =
            state is ReVerificationPromptedState && !isOnFaceGate;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation),
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              ),
            );
          },
          child: isPrompted
              ? _CountdownContent(
                  key: const ValueKey('countdown_active'),
                  remainingSeconds:
                      (state as ReVerificationPromptedState).remainingSeconds,
                  totalSeconds: context
                      .read<ReVerificationBloc>()
                      .config
                      .countdownDuration
                      .inSeconds,
                  iteration: (state as ReVerificationPromptedState).iteration,
                  maxIterations:
                      (state as ReVerificationPromptedState).maxIterations,
                )
              : const SizedBox.shrink(key: ValueKey('countdown_hidden')),
        );
      },
    );
  }
}

class _CountdownContent extends StatefulWidget {
  final int remainingSeconds;
  final int totalSeconds;
  final int? iteration;
  final int? maxIterations;

  const _CountdownContent({
    super.key,
    required this.remainingSeconds,
    required this.totalSeconds,
    this.iteration,
    this.maxIterations,
  });

  @override
  State<_CountdownContent> createState() => _CountdownContentState();
}

class _CountdownContentState extends State<_CountdownContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _processing = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    coWorkerPendingNotifier.addListener(_onCoWorkerPendingChanged);
  }

  void _onCoWorkerPendingChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    coWorkerPendingNotifier.removeListener(_onCoWorkerPendingChanged);
    _pulseController.dispose();
    super.dispose();
  }

  String _formatCountdown(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = theme.colorTheme;
    final progress = widget.remainingSeconds / widget.totalSeconds;
    final isUrgent = widget.remainingSeconds < 60;
    final accentColor = colorTheme.primary.primary1;
    final urgentColor = const Color(0xFFE53935);

    final barColor = isUrgent ? urgentColor : accentColor;

    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorTheme.primary.primary2,
            colorTheme.primary.primary2.withOpacity(0.95),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  FadeTransition(
                    opacity: _pulseAnimation,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: barColor.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.face_rounded,
                        size: 16,
                        color: barColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Face Verification Required',
                          style: TextStyle(
                            color: colorTheme.paper.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          isUrgent
                              ? 'Hurry! Time running out'
                              : coWorkerPendingNotifier.value
                                  ? 'Co-worker verification pending'
                                  : 'System user must verify face first',
                          style: TextStyle(
                            color: colorTheme.paper.primary.withOpacity(0.6),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: barColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: barColor.withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer_outlined, size: 13, color: barColor),
                        const SizedBox(width: 4),
                        Text(
                          _formatCountdown(widget.remainingSeconds),
                          style: TextStyle(
                            color: barColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            fontFeatures: const [
                              FontFeature.tabularFigures(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.iteration != null &&
                      widget.maxIterations != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: colorTheme.paper.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorTheme.paper.primary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        '${widget.iteration}/${widget.maxIterations}',
                        style: TextStyle(
                          color: colorTheme.paper.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                  ] else
                    const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _processing
                        ? null
                        : () async {
                            if (reVerificationInProgressNotifier.value) return;
                            setState(() => _processing = true);
                            reVerificationInProgressNotifier.value = true;
                            try {
                              if (coWorkerPendingNotifier.value) {
                                await verifyCoWorkersPending(context);
                                return;
                              }
                              final result =
                                  await showFaceVerificationDialog(context);
                              if (!context.mounted) return;
                              if (result.passed) {
                                await logAndCompleteReVerification(
                                    context, result);
                              }
                            } finally {
                              reVerificationInProgressNotifier.value = false;
                              if (mounted) setState(() => _processing = false);
                            }
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _processing
                            ? accentColor.withOpacity(0.6)
                            : accentColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: _processing
                            ? null
                            : [
                                BoxShadow(
                                  color: accentColor.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                      ),
                      child: _processing
                          ? SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colorTheme.paper.primary,
                              ),
                            )
                          : Text(
                              'VERIFY',
                              style: TextStyle(
                                color: colorTheme.paper.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: progress, end: progress),
            duration: const Duration(milliseconds: 900),
            curve: Curves.linear,
            builder: (context, value, _) {
              return Container(
                height: 3,
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: value.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      gradient: LinearGradient(
                        colors: isUrgent
                            ? [urgentColor.withOpacity(0.7), urgentColor]
                            : [accentColor.withOpacity(0.7), accentColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: barColor.withOpacity(0.5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
