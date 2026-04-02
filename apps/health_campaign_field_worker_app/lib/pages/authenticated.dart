import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:digit_forms_engine/blocs/forms/forms.dart';
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
import 'package:location/location.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:survey_form/survey_form.dart';
import 'package:sync_service/sync_service_lib.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/data/repositories/remote/user_action.dart';

import 'package:digit_data_model/models/entities/hf_referral.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/hf_referral_downsync/hf_referral_downsync.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../blocs/stock_downsync/stock_downsync.dart';
import '../data/local_store/secure_store/secure_store.dart';
import '../blocs/push_notification/push_notification.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/remote_client.dart';
import '../data/repositories/remote/bandwidth_check.dart';
import '../models/downsync/downsync.dart';
import '../models/entities/notification_data.dart';
import '../models/entities/roles_type.dart';
import '../notification_handlers/notification_handler.dart';
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
  StreamController<HFReferralProgressData> _hfReferralProgress =
      StreamController<HFReferralProgressData>.broadcast();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isOfflineDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _drawerVisibilityController.close();
    _hfReferralProgress.close();
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
                    actions: null,
                  ),
                  drawer: showDrawer ? drawerWidget(context) : null,
                  body: MultiBlocProvider(
                    providers: [
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
                              RemoteRepository<StockModel, StockSearchModel>>(),
                          stockLocalRepository: ctx.read<
                              LocalRepository<StockModel, StockSearchModel>>(),
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
                            final localizations = AppLocalizations.of(context);
                            final appConfiguration = (context
                                    .read<AppInitializationBloc>()
                                    .state as AppInitialized)
                                .appConfiguration;
                            hfDownSyncState.maybeWhen(
                              orElse: () {},
                              loading: () {
                                DigitSyncDialog.show(
                                  context,
                                  type: DialogType.inProgress,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails
                                        .dataDownloadInProgress,
                                  ),
                                  barrierDismissible: false,
                                );
                              },
                              dataFound: (newCount, serverTotalCount) {
                                Navigator.of(context, rootNavigator: true)
                                    .popUntil((route) => route is! PopupRoute);
                                showCustomPopup(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (ctx) => Popup(
                                    title: localizations.translate(
                                      newCount > 0
                                          ? i18.beneficiaryDetails.dataFound
                                          : i18.beneficiaryDetails.noDataFound,
                                    ),
                                    titleIcon: Icon(
                                      Icons.info_outline_rounded,
                                      color: Theme.of(context)
                                          .colorTheme
                                          .text
                                          .primary,
                                    ),
                                    description: localizations.translate(
                                      newCount > 0
                                          ? i18.beneficiaryDetails
                                              .dataFoundContent
                                          : i18.beneficiaryDetails
                                              .noDataFoundContent,
                                    ),
                                    actions: [
                                      DigitButton(
                                        label: localizations.translate(
                                          newCount > 0
                                              ? i18.common.coreCommonDownload
                                              : i18.common.coreCommonGoback,
                                        ),
                                        onPressed: () {
                                          if (newCount > 0) {
                                            context
                                                .read<HFReferralDownSyncBloc>()
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
                                          } else {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            context.router
                                                .replaceAll([HomeRoute()]);
                                          }
                                        },
                                        type: DigitButtonType.primary,
                                        size: DigitButtonSize.medium,
                                      ),
                                      if (newCount > 0)
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
                                    .popUntil((route) => route is! PopupRoute);
                                DigitSyncDialog.show(
                                  context,
                                  type: DialogType.complete,
                                  label: localizations.translate(
                                    i18.beneficiaryDetails
                                        .referralDownloadCompleted,
                                  ),
                                  primaryAction: DigitDialogActions(
                                    label: localizations.translate(
                                      i18.common.coreCommonGoback,
                                    ),
                                    action: (ctx) {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      context.router.replaceAll([HomeRoute()]);
                                    },
                                  ),
                                );
                              },
                              failed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .popUntil((route) => route is! PopupRoute);
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
                                      Navigator.of(context, rootNavigator: true)
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
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      context.router.replaceAll([HomeRoute()]);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                      child: ErrorBoundary(builder: (context, error) {
                        return error != null
                            ? const ErrorScreen()
                            : AutoRouter(
                                navigatorObservers: () => [
                                  AuthenticatedRouteObserver(
                                    onNavigated: () {
                                      bool shouldShowDrawer;
                                      switch (context.router.topRoute.name) {
                                        case ProjectSelectionRoute.name:
                                        case BoundarySelectionRoute.name:
                                        case PermissionsRoute.name:
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
                    final isOnline = connectivityResult
                            .contains(ConnectivityResult.wifi) ||
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
