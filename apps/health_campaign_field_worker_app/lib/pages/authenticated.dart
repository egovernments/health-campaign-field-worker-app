import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
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
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_form/survey_form.dart';
import 'package:sync_service/sync_service_lib.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/projects_beneficiary_downsync/project_beneficiaries_downsync.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/remote_client.dart';
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
class AuthenticatedPageWrapper extends StatelessWidget {
  AuthenticatedPageWrapper({super.key});

  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

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
                                      .setCode([selectedBoundary.code!]);
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
                    final isOnline = connectivityResult.firstOrNull ==
                            ConnectivityResult.wifi ||
                        connectivityResult.firstOrNull ==
                            ConnectivityResult.mobile;

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

                /// TODO: NEED TO EXTRACT THIS AS UTIL FUNCTION
                String? dynamicModule;
                final isInRegistrationFlow = context.router.current.name
                    .contains(RegistrationDeliveryWrapperRoute.name);

                if (isInRegistrationFlow) {
                  final prefs = await SharedPreferences.getInstance();
                  final schemaJsonRaw = prefs.getString('app_config_schemas');

                  if (schemaJsonRaw != null) {
                    final allSchemas =
                        json.decode(schemaJsonRaw) as Map<String, dynamic>;
                    final projectId = context.selectedProject.referenceID;

                    // Initialize empty list to collect modules
                    final List<String> modules = [];

                    // Handle registrationflow
                    final registrationSchemaEntry =
                        allSchemas['REGISTRATIONFLOW'] as Map<String, dynamic>?;
                    final registrationSchemaData =
                        registrationSchemaEntry?['data'];
                    final registrationFlowName = registrationSchemaData?['name']
                        ?.toString()
                        .toLowerCase();
                    if (registrationFlowName != null && projectId != null) {
                      modules.add('hcm-$registrationFlowName-$projectId');
                    }

                    // Handle deliveryflow
                    final deliverySchemaEntry =
                        allSchemas['DELIVERYFLOW'] as Map<String, dynamic>?;
                    final deliverySchemaData = deliverySchemaEntry?['data'];
                    final deliveryFlowName =
                        deliverySchemaData?['name']?.toString().toLowerCase();
                    if (deliveryFlowName != null && projectId != null) {
                      modules.add('hcm-$deliveryFlowName-$projectId');
                    }

                    // Combine into a single string
                    dynamicModule = modules.join(',');
                  }
                }

                final staticModules = localizationModulesList.interfaces
                    .where(
                        (element) => element.type == Modules.localizationModule)
                    .map((e) => e.name.toString())
                    .followedBy([
                  'hcm-boundary-${envConfig.variables.hierarchyType}'
                ]).join(',');

                final combinedModules = dynamicModule != null
                    ? '$dynamicModule,$staticModules'
                    : staticModules;

                context
                    .read<LocalizationBloc>()
                    .add(LocalizationEvent.onLoadLocalization(
                      module: combinedModules,
                      tenantId: appConfig.tenantId ?? "default",
                      locale: e.value.toString(),
                      path: Constants.localizationApiPath,
                    ));

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
