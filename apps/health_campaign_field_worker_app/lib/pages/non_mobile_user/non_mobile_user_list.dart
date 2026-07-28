import 'dart:typed_data';

import 'package:attendance_management/attendance_management.dart';
import 'package:digit_data_model/data_model.dart';
// Attendance models come from the attendance_management package barrel here
// (this page drives the package's AttendanceBloc); digit_data_model's
// attendance models are intentionally not imported to avoid the same-name
// class clash.
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/attendance_register.dart';
import 'package:digit_data_model/models/entities/face_auth_event.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/models/entities/scanned_individual_data.dart';
import 'package:digit_face_verification/digit_face_verification.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../blocs/face_auth/reverification_bloc.dart';
import '../../data/local_store/no_sql/schema/service_registry.dart';
import '../../data/remote_client.dart';
import '../../router/app_router.dart';
import '../../services/face_auth_event_logger.dart';
import '../../services/worker_registry_service.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/utils.dart';
import '../../widgets/face_auth/reverification_popup.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/no_result_card/no_result_card.dart';
import '../../widgets/non_mobile_user/non_mobile_user_card.dart';
import '../../widgets/non_mobile_user/show_qr_code_non_mobile_user.dart';

@RoutePage()
class NonMobileUserListPage extends LocalizedStatefulWidget {
  const NonMobileUserListPage({super.key});

  @override
  State<NonMobileUserListPage> createState() => _NonMobileUserListPageState();
}

class _NonMobileUserListPageState
    extends LocalizedState<NonMobileUserListPage> {
  AttendanceBloc? attendanceBloc;
  final Set<String> _enrolledIds = {};
  bool _isNavigating = false;
  bool _isTimerRunning = false;
  // False until the registry-sync pass of _loadEnrollmentStatus completes.
  // Cards show a loading indicator until then to avoid the "Enroll Face" flash.
  bool _enrollmentStatusLoaded = false;
  // Pre-fetched location — starts immediately on page load so it's ready
  // by the time any co-worker verification completes.
  late Future<LocationData?> _locationFuture;

  @override
  void initState() {
    super.initState();
    attendanceBloc = AttendanceBloc(
      const RegisterLoading(),
      attendanceDataRepository: context
          .repository<AttendanceRegisterModel, AttendanceRegisterSearchModel>(),
      attendanceLogDataRepository:
          context.repository<AttendanceLogModel, AttendanceLogSearchModel>(),
      individualDataRepository:
          context.repository<IndividualModel, IndividualSearchModel>(),
    );
    _locationFuture = _fetchLocation();
    _loadEnrollmentStatus();
    coWorkersVerifiedThisCycleNotifier.addListener(_onVerifiedCycleChanged);
  }

  void _onVerifiedCycleChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    coWorkersVerifiedThisCycleNotifier.removeListener(_onVerifiedCycleChanged);
    super.dispose();
  }

  Future<void> _loadEnrollmentStatus({List<String>? individualIds}) async {
    try {
      final repository = context.read<FaceEmbeddingRepository>();
      final allEmbeddings = await repository.getAllEmbeddings();

      final enrolledIds = <String>{};

      for (final e in allEmbeddings) {
        if (!e.isSystemUser) enrolledIds.add(e.individualId);
      }

      // For workers not found locally, sync from the worker registry.
      // This handles cases where enrollment happened on another device.
      if (individualIds != null) {
        final unenrolled = individualIds
            .where((id) => id.isNotEmpty && !enrolledIds.contains(id))
            .toList();
        if (unenrolled.isNotEmpty) {
          final serviceRegistry =
              await context.read<Isar>().serviceRegistrys.where().findAll();
          if (!mounted) return;
          final service = WorkerRegistryService.fromServiceRegistry(
            dio: DioClient().dio,
            tenantId: envConfig.variables.tenantId,
            serviceRegistry: serviceRegistry,
          );
          await Future.wait(
            unenrolled.map((id) async {
              final synced = await service.syncEnrollmentFromRegistry(
                individualId: id,
                repository: repository,
              );
              if (synced) enrolledIds.add(id);
            }),
          );
        }
      }

      if (mounted) {
        setState(() {
          _enrolledIds
            ..clear()
            ..addAll(enrolledIds);
          // Mark loaded only after the registry-sync pass (called with IDs).
          if (individualIds != null) _enrollmentStatusLoaded = true;
        });
      }
    } catch (e) {
      debugPrint('Failed to load face enrollment status: $e');
      // On error, unblock the UI so cards don't spin forever.
      if (individualIds != null && mounted) {
        setState(() => _enrollmentStatusLoaded = true);
      }
    }
  }

  Future<void> _verifyCoWorker(
      BuildContext context, String individualId, String name) async {
    if (_isNavigating) return;
    _isNavigating = true;
    try {
      final repository = context.read<FaceEmbeddingRepository>();
      final faceModelService = context.read<FaceModelService>();

      // Reuse the page-level location future (started at initState).
      final locationFuture = _locationFuture;

      // Capture context-dependent values synchronously before any async gap.
      final eventRepo = context.read<
          LocalRepository<FaceAuthEventModel, FaceAuthEventSearchModel>>();
      final userUuid = context.loggedInUserUuid;
      final projectId = context.projectId;
      final boundaryCode = context.boundaryOrNull?.code ?? '';

      double? rejectedConfidence;
      Uint8List? rejectedImageBytes;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => FaceVerificationBloc(
                  faceModelService: faceModelService,
                  embeddingRepository: repository,
                ),
              ),
            ],
            child: FaceAttendanceWrapper(
              individualId: individualId,
              faceModelService: faceModelService,
              title: name,
              subtitle:
                  localizations.translate(i18.nonMobileUser.nonMobileUserLabel),
              onVerified: (confidence, {faceImageBytes}) async {
                await repository.updateLastVerified(individualId);
                markCoWorkerVerifiedThisCycle(individualId);
                // notifier update triggers _onVerifiedCycleChanged → setState
                final location = await locationFuture;
                try {
                  final logger = FaceAuthEventLogger(
                    repository: eventRepo,
                    userId: individualId,
                    userUuid: userUuid,
                    projectId: projectId,
                    boundaryCode: boundaryCode,
                    subjectName: name,
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
                  debugPrint('NonMobileUserList: face event log failed: $e');
                }
                _loadEnrollmentStatus();
              },
              onFailed: (confidence, {faceImageBytes}) {
                rejectedConfidence = confidence;
                rejectedImageBytes = faceImageBytes;
              },
            ),
          ),
        ),
      );

      // Log the outcome when verification was not successful.
      if (rejectedConfidence != null) {
        try {
          await FaceAuthEventLogger(
            repository: eventRepo,
            userId: individualId,
            userUuid: userUuid,
            projectId: projectId,
            boundaryCode: boundaryCode,
            subjectName: name,
          ).logFaceRejected(
            eventType: FaceAuthEventType.checkIn,
            confidence: rejectedConfidence!,
            faceImageBytes: rejectedImageBytes,
            failedAttemptCount: 1,
          );
        } catch (e) {
          debugPrint('NonMobileUserList: face rejected log failed: $e');
        }
      }
    } finally {
      _isNavigating = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return BlocListener<ReVerificationBloc, ReVerificationState>(
      listener: (context, state) {
        if (state is ReVerificationPromptedState) {
          if (mounted) setState(() => _isTimerRunning = true);
        } else if (state is ReVerificationIdleState ||
            state is ReVerificationMissedState) {
          if (mounted) setState(() => _isTimerRunning = false);
        }
      },
      child: Scaffold(
        body: BlocProvider<AttendanceBloc>(
          create: (context) =>
              attendanceBloc!..add(const AttendanceEvents.fetchNonMobileUsers()),
          child: BlocBuilder<AttendanceBloc, AttendanceStates>(
            builder: (context, state) {
              return ScrollableContent(
                enableFixedDigitButton: true,
                header: BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  handleback: () {
                    context.router.replaceAll([HomeRoute()]);
                  },
                  defaultPopRoute: false,
                ),
                footer: DigitCard(
                    margin: const EdgeInsets.only(top: spacer2),
                    children: [
                      DigitButton(
                        mainAxisSize: MainAxisSize.max,
                        label: localizations.translate(
                          i18.common.coreCommonGoback,
                        ),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        onPressed: () {
                          context.router.replace(HomeRoute());
                        },
                      ),
                    ]),
                children: [
                  BlocConsumer<AttendanceBloc, AttendanceStates>(
                      listener: (context, attendanceState) {
                    attendanceState.maybeWhen(
                      orElse: () {},
                      registerLoaded: (registers, offset, limit) {
                        // Sync enrollment status from worker registry for all
                        // individuals in the list, so cross-device enrollments
                        // are reflected without re-enrolling.
                        final ids = registers.firstOrNull?.individualList
                                ?.map((i) => i.id ?? '')
                                .where((id) => id.isNotEmpty)
                                .toList() ??
                            [];
                        if (ids.isNotEmpty) {
                          _loadEnrollmentStatus(individualIds: ids);
                        } else {
                          // No attendees — nothing to sync, unblock the UI.
                          if (mounted) {
                            setState(() => _enrollmentStatusLoaded = true);
                          }
                        }
                      },
                    );
                  }, builder: (context, attendanceState) {
                    return attendanceState.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        registerLoaded: (registers, offset, limit) {
                          return registers.isNotEmpty
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(spacer2),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${localizations.translate(i18.nonMobileUser.nonMobileUserLabel)} (${registers.first.attendees!.length.toString()})',
                                          style: textTheme.headingXl.copyWith(
                                              color: theme.colorScheme.primary),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    ...List.generate(
                                        registers.first.attendees!.length, (x) {
                                      final individualList =
                                          registers.first.individualList;
                                      if (individualList == null ||
                                          x >= individualList.length) {
                                        return const SizedBox.shrink();
                                      }
                                      final individual = individualList[x];
                                      // id (UUID) is the key used for face storage
                                      // and worker registry lookups.
                                      // individualId ("IND-...") is display-only.
                                      final enrollmentId = individual.id ?? '';
                                      final displayId =
                                          individual.individualId ?? enrollmentId;
                                      final givenName =
                                          individual.name?.givenName ?? '';
                                      final genderName =
                                          individual.gender?.name.toUpperCase() ??
                                              '';

                                      return NonMobileUserCard(
                                        mobileNumber:
                                            individual.mobileNumber.toString(),
                                        userName: givenName,
                                        age: getAge(individual.dateOfBirth),
                                        isFaceEnrolled: enrollmentId.isNotEmpty &&
                                            _enrolledIds.contains(enrollmentId),
                                        isTimerRunning: _isTimerRunning,
                                        isVerifiedThisCycle:
                                            coWorkersVerifiedThisCycleNotifier
                                                .value
                                                .contains(enrollmentId),
                                        isEnrollmentLoading:
                                            !_enrollmentStatusLoaded,
                                        onFaceEnroll: () async {
                                          if (enrollmentId.isEmpty) return;
                                          if (_isNavigating) return;
                                          _isNavigating = true;
                                          try {
                                            await context.router.push(
                                              NonMobileFaceEnrollRoute(
                                                individualId: enrollmentId,
                                                individualName: givenName,
                                              ),
                                            );
                                            _loadEnrollmentStatus();
                                          } finally {
                                            _isNavigating = false;
                                          }
                                        },
                                        onFaceVerify: () => _verifyCoWorker(
                                            context, enrollmentId, givenName),
                                        onScanMe: () {
                                          showQRForNonMobileUser(
                                              context: context,
                                              individualScannerData:
                                                  ScannedIndividualDataModel(
                                                      individualId: displayId,
                                                      age: getAge(
                                                          individual.dateOfBirth),
                                                      locality: localizations
                                                          .translate(registers
                                                                  .first
                                                                  .individualList
                                                                  ?.first
                                                                  .address
                                                                  ?.first
                                                                  .locality
                                                                  ?.code ??
                                                              ''),
                                                      name: givenName,
                                                      qrCreatedTime: DateTime
                                                              .now()
                                                          .millisecondsSinceEpoch),
                                              localizations: localizations,
                                              textTheme: textTheme);
                                        },
                                        gender:
                                            localizations.translate(genderName),
                                        individualId: displayId,
                                      );
                                    })
                                  ],
                                )
                              : NoResultCard(
                                  align: Alignment.center,
                                  label: localizations.translate(
                                    i18.common.noResultsFound,
                                  ),
                                );
                        });
                  })
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  static Future<LocationData?> _fetchLocation() async {
    const maxAttempts = 3;
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        final loc = Location();
        if (!await loc.serviceEnabled()) {
          if (!await loc.requestService()) return null;
        }
        var perm = await loc.hasPermission();
        if (perm == PermissionStatus.denied) {
          perm = await loc.requestPermission();
        }
        if (perm != PermissionStatus.granted &&
            perm != PermissionStatus.grantedLimited) return null;
        await loc.changeSettings(
            accuracy: LocationAccuracy.balanced, distanceFilter: 0);
        final data =
            await loc.getLocation().timeout(const Duration(seconds: 4));
        debugPrint('NonMobileUserList: location fetched on attempt $attempt');
        return data;
      } catch (e) {
        debugPrint('NonMobileUserList: location attempt $attempt failed: $e');
        if (attempt < maxAttempts) {
          await Future.delayed(const Duration(seconds: 2));
        }
      }
    }
    debugPrint('NonMobileUserList: all location attempts failed');
    return null;
  }

  getAge(String? dateOfBirth) {
    if (dateOfBirth == null) {
      return '0 ${localizations.translate('YEARS')} 0 ${localizations.translate('MONTHS')}';
    }
    final parsedDate = DigitDateUtils.getFormattedDateToDateTime(dateOfBirth) ??
        DateTime.now();
    final age = DigitDateUtils.calculateAge(parsedDate);
    return '${age.years} ${localizations.translate('YEARS')} ${age.months} ${localizations.translate('MONTHS')}';
  }
}
