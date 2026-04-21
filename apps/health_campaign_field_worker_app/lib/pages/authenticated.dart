import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/helper_widget/digit_profile.dart';
import 'package:digit_ui_components/widgets/molecules/hamburger.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_form/survey_form.dart';
import 'package:sync_service/sync_service_lib.dart';

import 'package:digit_face_verification/digit_face_verification.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/face_auth/face_gate_bloc.dart';
import '../blocs/face_auth/reverification_bloc.dart';
import '../services/face_auth_config.dart';
import '../services/reverification_scheduler.dart';
import '../services/worker_registry_service.dart';
import '../widgets/face_auth/face_verification_dialog.dart';
import '../widgets/face_auth/reverification_popup.dart';
import '../blocs/push_notification/push_notification.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/remote_client.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../data/repositories/remote/bandwidth_check.dart';
import '../models/downsync/downsync.dart';
import '../models/entities/roles_type.dart';
import '../router/app_router.dart';
import '../router/authenticated_route_observer.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/error_screen.dart';
import 'error_boundary.dart';

@RoutePage()
class AuthenticatedPageWrapper extends StatefulWidget {
  const AuthenticatedPageWrapper({super.key});

  @override
  State<AuthenticatedPageWrapper> createState() =>
      _AuthenticatedPageWrapperState();
}

class _AuthenticatedPageWrapperState extends State<AuthenticatedPageWrapper> {
  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isOfflineDialogShowing = false;
  bool _hasCheckedEnrollment = false;

  // Face auth configuration — change these values to adjust timing
  // TODO: Restore production values after testing
  static const _faceAuthConfig = FaceAuthConfig(
    startHour: 0,          // all day for testing
    endHour: 24,           // all day for testing
    promptCount: 100,      // effectively unlimited for testing
    minGapMinutes: 2,      // every 2 minutes for testing
    countdownDuration: Duration(minutes: 5),
    maxFaceAttempts: 3,
    faceMatchThreshold: 0.80,
  );

  // Re-verification scheduler
  ReVerificationScheduler? _reVerificationScheduler;
  StreamSubscription<ReVerificationTrigger>? _reVerificationSubscription;
  ReVerificationBloc? _reVerificationBloc;
  final StreamController<List<DateTime>> _scheduleController =
      StreamController<List<DateTime>>.broadcast();

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
    // Start re-verification scheduler immediately on init
    _startReVerificationScheduler();
  }

  /// Called from ErrorBoundary builder — kept for backward compatibility.
  void _checkFaceEnrollment() {
    // Scheduler is now started in initState; nothing to do here.
  }

  void _startReVerificationScheduler() {
    debugPrint('AuthenticatedPage: _startReVerificationScheduler called, existing=${_reVerificationScheduler != null}');
    if (_reVerificationScheduler != null) return;
    _reVerificationScheduler = ReVerificationScheduler(config: _faceAuthConfig);
    _reVerificationScheduler!.start().then((_) {
      debugPrint('AuthenticatedPage: scheduler started, schedule=${_reVerificationScheduler!.currentSchedule}');
      if (mounted) {
        _scheduleController.add(_reVerificationScheduler!.currentSchedule);
      }
    }).catchError((e) {
      debugPrint('AuthenticatedPage: scheduler start failed: $e');
    });
    _reVerificationSubscription =
        _reVerificationScheduler!.triggers.listen((trigger) {
      debugPrint('AuthenticatedPage: re-verification trigger #${trigger.triggerIndex}, bloc=${_reVerificationBloc != null}');
      _dispatchTrigger(trigger);
    });
  }

  void _dispatchTrigger(ReVerificationTrigger trigger) async {
    // Skip re-verification triggers if no face enrollment exists yet
    try {
      final isar = context.read<Isar>();
      final repository = FaceEmbeddingRepository(isar);
      final enrollmentCount = await repository.count();
      if (enrollmentCount == 0) {
        debugPrint('AuthenticatedPage: no face enrollments yet, skipping trigger');
        return;
      }
    } catch (e) {
      debugPrint('AuthenticatedPage: enrollment check failed, skipping trigger: $e');
      return;
    }

    if (_reVerificationBloc != null && !_reVerificationBloc!.isClosed) {
      _reVerificationBloc!.add(
        ReVerificationEvent.triggered(trigger: trigger),
      );
      debugPrint('AuthenticatedPage: dispatched trigger #${trigger.triggerIndex} to bloc');
    } else {
      // Bloc not ready yet — retry after a short delay
      debugPrint('AuthenticatedPage: bloc not ready, retrying in 1s...');
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) _dispatchTrigger(trigger);
      });
    }
    if (mounted) {
      _scheduleController.add(_reVerificationScheduler!.currentSchedule);
    }
  }

  @override
  void dispose() {
    _reVerificationSubscription?.cancel();
    _reVerificationScheduler?.dispose();
    _scheduleController.close();
    _connectivitySubscription.cancel();
    _drawerVisibilityController.close();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShowcaseWidget(
      enableAutoScroll: true,
      builder: Builder(
        builder: (context) {
          return StreamBuilder<bool>(
            stream: _drawerVisibilityController.stream,
            builder: (context, snapshot) {
              final showDrawer = snapshot.data ?? false;

              return Portal(
                child: Scaffold(
                  backgroundColor: theme.colorTheme.generic.background,
                  appBar: AppBar(
                    backgroundColor: theme.colorTheme.primary.primary2,
                    foregroundColor: theme.colorTheme.paper.primary,
                    actions: showDrawer
                        ? [
                            BlocBuilder<BoundaryBloc, BoundaryState>(
                              builder: (ctx, state) {
                                final selectedBoundary = ctx.boundaryOrNull;

                                if (selectedBoundary == null) {
                                  return const SizedBox.shrink();
                                } else {
                                  LocalizationParams()
                                      .setCode([selectedBoundary.code!, i18.common.coreCommonSubmit]);
                                  final boundaryName =
                                      AppLocalizations.of(context).translate(
                                    selectedBoundary.code ??
                                        i18.projectSelection.onProjectMapped,
                                  );

                                  final theme = Theme.of(context);

                                  return GestureDetector(
                                    onTap: () {
                                      ctx.router.replaceAll([
                                        BoundarySelectionRoute(),
                                      ]);
                                    },
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(right: spacer2),
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                boundaryName,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: theme
                                                      .colorTheme.paper.primary,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_outlined,
                                              color: theme
                                                  .colorTheme.paper.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ]
                        : null,
                  ),
                  drawer: showDrawer ? drawerWidget(context) : null,
                  body: MultiRepositoryProvider(
                    providers: [
                      RepositoryProvider<FaceModelService>(
                        create: (_) => FaceModelService()..initialize(),
                      ),
                      RepositoryProvider<FaceEmbeddingRepository>(
                        create: (ctx) => FaceEmbeddingRepository(
                          ctx.read<Isar>(),
                        ),
                      ),
                    ],
                    child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (ctx) => FaceGateBloc(
                          repository: ctx.read<FaceEmbeddingRepository>(),
                          workerRegistryService: WorkerRegistryService(
                            dio: DioClient().dio,
                            tenantId: envConfig.variables.tenantId,
                          ),
                        ),
                      ),
                      BlocProvider(
                        create: (ctx) => FaceVerificationBloc(
                          faceModelService: ctx.read<FaceModelService>(),
                          embeddingRepository: ctx.read<FaceEmbeddingRepository>(),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => LivenessBloc(),
                      ),
                      BlocProvider(
                        lazy: false,
                        create: (ctx) {
                          debugPrint('AuthenticatedPage: creating ReVerificationBloc');
                          _reVerificationBloc = ReVerificationBloc(
                            repository: ctx.read<FaceEmbeddingRepository>(),
                            config: _faceAuthConfig,
                          );
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
                              if (event.isNotEmpty) {
                                performBackgroundService(
                                  stopService: false,
                                  isBackground: true,
                                );
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
                    child: BlocListener<PushNotificationBloc,
                        PushNotificationState>(
                      listener: (context, state) {
                        if (state is PushNotificationTappedState) {
                          // Only navigate if user has completed setup flow
                          // (boundary selected means project is also selected)
                          final hasBoundary = context.boundaryOrNull != null;
                          if (!hasBoundary) {
                            debugPrint('PushNotification: ignoring tap — boundary not selected yet');
                            return;
                          }

                          final screen = state.data['screen'];
                          switch (screen) {
                            case 'home':
                              context.router.replaceAll([HomeRoute()]);
                              break;
                            case 'profile':
                              context.router.push(ProfileRoute());
                              break;
                            default:
                              // No recognized screen — don't navigate blindly
                              debugPrint('PushNotification: unknown screen=$screen, ignoring');
                              break;
                          }
                        }
                      },
                      child: ErrorBoundary(builder: (context, error) {
                        if (error == null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _checkFaceEnrollment();
                          });
                        }
                        return error != null
                            ? const ErrorScreen()
                            : ReVerificationListener(
                              child: Column(
                              children: [
                                const _ReVerificationCountdownBanner(),
                                Expanded(child: AutoRouter(
                              navigatorObservers: () => [
                                AuthenticatedRouteObserver(
                                  onNavigated: () {
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
                            )),
                              ],
                            ),
                      );
                      }),
                    ),
                  ),
                  ),
                ),
              );
            },
          );
        },
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
    final languages = appConfig.languages;
    final localizationModulesList = appConfig.backendInterface;
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
          if (state.loading == false) {
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
                      data: context.loggedInUserUuid,
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
                if (appInitializationBloc.state is AppInitialized) ...[
                  SidebarItem(
                    title: AppLocalizations.of(context).translate(
                      i18.common.coreCommonlanguage,
                    ),
                    isSearchEnabled: false,
                    icon: Icons.language,
                    onPressed: () {},
                    children: (localizationModulesList != null)
                        ? buildLanguage(localizationModulesList, languages,
                            context, appConfig)
                        : null,
                  )
                ],
                SidebarItem(
                  title: AppLocalizations.of(context).translate(
                    i18.common.coreCommonProfile,
                  ),
                  icon: Icons.person,
                  onPressed: () async {
                    final connectivityResult =
                        await (Connectivity().checkConnectivity());
                    final isOnline =
                        connectivityResult.contains(ConnectivityResult.wifi) ||
                            connectivityResult.contains(ConnectivityResult.mobile);

                    if (isOnline) {
                      if (context.mounted) {
                        Navigator.of(context, rootNavigator: true).pop();
                        context.router.push(ProfileRoute());
                      }
                    } else {
                      if (context.mounted) {
                        showCustomPopup(
                          context: context,
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
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(),
                                  type: DigitButtonType.primary,
                                  size: DigitButtonSize.large)
                            ],
                          ),
                        );
                      }
                    }
                  },
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

                  // TODO: Non system user

                  SidebarItem(
                    title: AppLocalizations.of(context).translate(
                      //TODO: TO append the total count of non- system users
                      i18.nonMobileUser.nonMobileUserLabel,
                    ),
                    icon: Icons.group,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      context.router.push(const NonMobileUserListRoute());
                    },
                  ),
                ],
              ],
              logOutDigitButtonLabel: AppLocalizations.of(context)
                  .translate(i18.common.coreCommonLogout),
              onLogOut: () {
                context.read<BoundaryBloc>().add(const BoundaryResetEvent());
                context.read<LocalizationBloc>().add(
                      LocalizationEvent.onLoadLocalization(
                        module: Constants.homeLocalizationModules.join(','),
                        tenantId: envConfig.variables.tenantId,
                        locale: AppSharedPreferences().getSelectedLocale ?? '',
                        path: Constants.localizationApiPath,
                      ),
                    );
                context.read<AuthBloc>().add(const AuthLogoutEvent());
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

/// In-app countdown banner that slides in when a re-verification is triggered
/// and disappears when the window expires or verification is completed.
/// Similar to a flash-sale banner — appears only during active verification windows.
class _ReVerificationCountdownBanner extends StatelessWidget {
  const _ReVerificationCountdownBanner();

  @override
  Widget build(BuildContext context) {
    // Hide banner when on enrollment/face gate screen
    final currentRoute = context.router.topRoute.name;
    final isOnFaceGate = currentRoute == FaceGateRoute.name;

    return BlocBuilder<ReVerificationBloc, ReVerificationState>(
      builder: (context, state) {
        final isPrompted = state is ReVerificationPromptedState && !isOnFaceGate;

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

  const _CountdownContent({
    super.key,
    required this.remainingSeconds,
    required this.totalSeconds,
  });

  @override
  State<_CountdownContent> createState() => _CountdownContentState();
}

class _CountdownContentState extends State<_CountdownContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

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
  }

  @override
  void dispose() {
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
    final accentColor = colorTheme.primary.primary1; // orange
    final urgentColor = const Color(0xFFE53935); // red

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
          // ── Main row: icon + text + countdown + verify button ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // Pulsing icon
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

                  // Label
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
                          isUrgent ? 'Hurry! Time running out' : 'Verify now to continue',
                          style: TextStyle(
                            color: colorTheme.paper.primary.withOpacity(0.6),
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Countdown timer display
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
                        Icon(Icons.timer_outlined,
                            size: 13, color: barColor),
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

                  const SizedBox(width: 8),

                  // Verify button
                  GestureDetector(
                    onTap: () async {
                      final result = await showFaceVerificationDialog(context);
                      if (!context.mounted) return;

                      if (result.passed) {
                        await logAndCompleteReVerification(context, result);
                      } else {
                        context
                            .read<ReVerificationBloc>()
                            .add(const ReVerificationEvent.dismissed());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
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

          // ── Animated progress bar at bottom ──
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
