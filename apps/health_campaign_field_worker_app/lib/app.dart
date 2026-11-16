import 'package:digit_crud_bloc/repositories/local/search_entity_repository.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_data_model/models/entities/attendance_log.dart';
import 'package:digit_data_model/models/entities/attendance_register.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:digit_flow_builder/action_handler/action_handler.dart';
import 'package:digit_flow_builder/analytics_hooks.dart';
import 'package:digit_flow_builder/blocs/flow_crud_bloc.dart';
import 'package:digit_flow_builder/flow_builder_home_page.dart';
import 'package:digit_forms_engine/pages/forms_render.dart';
import 'package:digit_forms_engine/widgets/back_header/back_navigation_help_header.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:survey_form/survey_form.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';
import 'package:transit_post/data/repositories/remote/user_action.dart';

import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/error/error.dart';
import 'blocs/push_notification/push_notification.dart';
import 'blocs/localization/localization.dart';
import 'blocs/project/project.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/network_manager.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/bandwidth_check.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'data/repositories/remote/notification_token.dart';
import 'executors/stock_balance_executor.dart';
import 'executors/update_identifier_status_executor.dart';
import 'executors/navigate_to_downsync_executor.dart';
import 'executors/load_unique_id_pool_executor.dart';
import 'models/downsync/downsync.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
import 'utils/analytics_service.dart';
import 'utils/environment_config.dart';
import 'utils/localization_delegates.dart';
import 'utils/utils.dart';
import 'widgets/network_manager_provider_wrapper.dart';

class MainApplication extends StatefulWidget {
  final Dio client;
  final AppRouter appRouter;
  final Isar isar;
  final LocalSqlDataStore sql;

  const MainApplication({
    super.key,
    required this.isar,
    required this.client,
    required this.appRouter,
    required this.sql,
  });

  @override
  State<StatefulWidget> createState() {
    return MainApplicationState();
  }
}

class MainApplicationState extends State<MainApplication>
    with WidgetsBindingObserver {
  @override
  void initState() {
    LocalizationParams().setModule('boundary', true);
    super.initState();
    requestDisableBatteryOptimization();

    // Register custom action executors
    ActionHandler.registry.register(
      'UPDATE_STOCK_BALANCE',
      StockBalanceExecutor(),
    );
    ActionHandler.registry.register(
      'UPDATE_IDENTIFIER_STATUS',
      UpdateIdentifierStatusExecutor(),
    );
    ActionHandler.registry.register(
      'NAVIGATE_TO_BENEFICIARY_ID_DOWN_SYNC',
      NavigateToBeneficiaryIdDownSyncExecutor(),
    );
    ActionHandler.registry.register(
      'LOAD_UNIQUE_ID_POOL',
      LoadUniqueIdPoolExecutor(),
    );

    // Product analytics hooks for the flow builder and forms engine.
    // Only outcomes a product owner acts on are reported; low-level action
    // execution is intentionally not tracked.
    FlowBuilderHomePage.onFlowStart = (pageName, params, config) {
      AnalyticsService.instance.logFlowScreenOpened(
        pageName: pageName,
        config: config,
      );
    };

    FlowBuilderHomePage.onFlowEnd = (pageName) {
      AnalyticsService.instance.logFlowScreenClosed(pageName: pageName);
    };

    // Button / card / link taps, back links and search triggers in flows.
    FlowAnalyticsHooks.onWidgetAction =
        (screenKey, fieldName, labelKey, format, actionTypes, destination) {
      AnalyticsService.instance.logFlowWidgetTapped(
        screenKey: screenKey,
        fieldName: fieldName,
        labelKey: labelKey,
        format: format,
        actionTypes: actionTypes,
        destination: destination,
      );
    };

    // Next / Submit / secondary / popup buttons on forms-engine pages.
    FormsRenderPage.onFormButtonPressed =
        (pageName, schemaKey, kind, labelKey, pageNumber, pageCount) {
      AnalyticsService.instance.logFormButtonPressed(
        pageName: pageName,
        schemaKey: schemaKey,
        kind: kind,
        labelKey: labelKey,
        pageNumber: pageNumber,
        pageCount: pageCount,
      );
    };

    // Header back arrow on forms-engine pages.
    BackNavigationHelpHeaderWidget.onBackPressed = () {
      AnalyticsService.instance.logBackPressed();
    };

    // Error and warning toasts raised by flow actions.
    ActionHandler.registry.onExecute =
        (String actionType, Map<dynamic, dynamic> properties, Map<String, dynamic> result) {
      if (actionType != 'SHOW_TOAST') return;
      final type = (properties['type'] as String?) ?? 'error';
      if (type != 'error' && type != 'warning') return;
      AnalyticsService.instance.logErrorShown(
        messageKey: (properties['message'] as String?) ?? '',
        screen: (result['parentScreenKey'] ?? properties['parentScreenKey']) as String?,
        type: type,
      );
    };

    FlowCrudBloc.onFlowCompleted = (flowKey, recordTypes) {
      AnalyticsService.instance.logFlowCompleted(
        flowKey: flowKey,
        recordTypes: recordTypes,
      );
    };

    FormsRenderPage.onFormPageStart = (pageName, schemaKey, isEdit) {
      AnalyticsService.instance.logFormOpened(
        pageName: pageName,
        schemaKey: schemaKey,
      );
    };

    FormsRenderPage.onFormPageEnd = (pageName, schemaKey) {
      AnalyticsService.instance.logFormClosed(
        pageName: pageName,
        schemaKey: schemaKey,
      );
    };

    FormsRenderPage.onFormValidationFailed = (pageName, schemaKey, failedFields) {
      AnalyticsService.instance.logFormValidationFailed(
        pageName: pageName,
        schemaKey: schemaKey,
        failedFields: failedFields,
      );
    };

    ActionHandler.registry.onExecuteError =
        (String actionType, Map<dynamic, dynamic> properties, dynamic error) {
      AnalyticsService.instance.logActionFailed(
        action: actionType,
        error: error.toString(),
      );
    };

    FlowBuilderHomePage.onFlowDataUpdate = (
      screenKey,
      isLoading,
      recordCount,
      isPersisted,
      errorMessage,
    ) {
      if (errorMessage != null) {
        AnalyticsService.instance.logDataLoadFailed(
          flowKey: screenKey,
          error: errorMessage,
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalSqlDataStore>.value(value: widget.sql),
        RepositoryProvider<Isar>.value(value: widget.isar),
        RepositoryProvider<SearchEntityRepository>(
          create: (context) => SearchEntityRepository(
            widget.sql,
            IndividualOpLogManager(widget.isar),

            /// todo: need to be changed to make is generic as this won't affect anything right now
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppInitializationBloc(
          isar: widget.isar,
          mdmsRepository: MdmsRepository(widget.client),
          dashboardRemoteRepository: DashboardRemoteRepository(widget.client),
        )..add(const AppInitializationSetupEvent()),
        child: NetworkManagerProviderWrapper(
          isar: widget.isar,
          configuration: const NetworkManagerConfiguration(
            persistenceConfig: PersistenceConfiguration.offlineFirst,
          ),
          dio: widget.client,
          sql: widget.sql,
          child: MultiBlocProvider(
            providers: [
              // INFO : Need to add bloc of package Here
              BlocProvider(
                create: (_) => PushNotificationBloc(
                  notificationTokenRepository:
                      NotificationTokenRepository(widget.client),
                )..add(const PushNotificationEvent.initialize()),
                lazy: false,
              ),

              BlocProvider(
                create: (_) {
                  return LocationBloc(location: Location())
                    ..add(const LoadLocationEvent());
                },
                lazy: false,
              ),
              BlocProvider(
                create: (_) {
                  return DigitScannerBloc(
                    const DigitScannerState(),
                  );
                },
                lazy: false,
              ),
              BlocProvider(
                create: (context) {
                  return UserBloc(
                    const UserEmptyState(),
                    userRemoteRepository: context
                        .read<RemoteRepository<UserModel, UserSearchModel>>(),
                  );
                },
              ),
              BlocProvider(
                create: (ctx) => AuthBloc(
                  authRepository: ctx.read(),
                  mdmsRepository: MdmsRepository(widget.client),
                  individualRemoteRepository: ctx.read<
                      RemoteRepository<IndividualModel,
                          IndividualSearchModel>>(),
                )..add(
                    AuthAutoLoginEvent(
                      tenantId: envConfig.variables.tenantId,
                    ),
                  ),
              ),
              BlocProvider(
                create: (ctx) => BoundaryBloc(
                  const BoundaryState(),
                  boundaryRepository: ctx
                      .read<NetworkManager>()
                      .repository<BoundaryModel, BoundarySearchModel>(ctx),
                ),
              ),
            ],
            child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
              builder: (context, appConfigState) {
                return BlocListener<AuthBloc, AuthState>(
                  listener: (context, authState) {
                    if (authState is AuthAuthenticatedState) {
                      context.read<PushNotificationBloc>().add(
                            PushNotificationEvent.login(
                              userId: authState.userModel.uuid,
                            ),
                          );
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, authState) {
                      if (appConfigState is! AppInitialized) {
                        return const MaterialApp(
                          home: Scaffold(
                            body: Center(
                              child: Text('Loading'),
                            ),
                          ),
                        );
                      }

                      final appConfig = appConfigState.appConfiguration;

                      final localizationModulesList =
                          appConfig.backendInterface;
                      var firstLanguage;
                      firstLanguage = appConfig.languages?.lastOrNull?.value;
                      final selectedLocale =
                          AppSharedPreferences().getSelectedLocale ??
                              firstLanguage;
                      LocalizationParams().setLocale(Locale(selectedLocale));
                      final languages = appConfig.languages;

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (localizationModulesList != null &&
                                    selectedLocale != null)
                                ? (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                        widget.client, widget.sql),
                                    widget.sql)
                                  ..add(
                                    LocalizationEvent.onLoadLocalization(
                                      /*Boundary module (hcm-boundary-<hierarchy>)
                                        is intentionally excluded here*/
                                      module: localizationModulesList.interfaces
                                          .where((element) =>
                                              element.type ==
                                                  Modules.localizationModule &&
                                              Constants
                                                  .initialLocalizationModules
                                                  .contains(
                                                      element.name.toString()))
                                          .map((e) => e.name.toString())
                                          .join(','),
                                      tenantId: envConfig.variables.tenantId,
                                      locale: selectedLocale,
                                      path: Constants.localizationApiPath,
                                    ),
                                  )
                                : (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                        widget.client, widget.sql),
                                    widget.sql),
                          ),
                          BlocProvider(
                            create: (ctx) => ProjectBloc(
                              bandwidthCheckRepository:
                                  BandwidthCheckRepository(
                                DioClient().dio,
                                bandwidthPath:
                                    envConfig.variables.checkBandwidthApiPath,
                              ),
                              mdmsRepository: MdmsRepository(widget.client),
                              dashboardRemoteRepository:
                                  DashboardRemoteRepository(widget.client),
                              facilityLocalRepository: ctx.read<
                                  LocalRepository<FacilityModel,
                                      FacilitySearchModel>>(),
                              facilityRemoteRepository: ctx.read<
                                  RemoteRepository<FacilityModel,
                                      FacilitySearchModel>>(),
                              projectFacilityLocalRepository: ctx.read<
                                  LocalRepository<ProjectFacilityModel,
                                      ProjectFacilitySearchModel>>(),
                              projectFacilityRemoteRepository: ctx.read<
                                  RemoteRepository<ProjectFacilityModel,
                                      ProjectFacilitySearchModel>>(),
                              projectLocalRepository: ctx.read<
                                  LocalRepository<ProjectModel,
                                      ProjectSearchModel>>(),
                              projectStaffLocalRepository: ctx.read<
                                  LocalRepository<ProjectStaffModel,
                                      ProjectStaffSearchModel>>(),
                              projectStaffRemoteRepository: ctx.read<
                                  RemoteRepository<ProjectStaffModel,
                                      ProjectStaffSearchModel>>(),
                              projectRemoteRepository: ctx.read<
                                  RemoteRepository<ProjectModel,
                                      ProjectSearchModel>>(),
                              serviceDefinitionRemoteRepository: ctx.read<
                                  RemoteRepository<ServiceDefinitionModel,
                                      ServiceDefinitionSearchModel>>(),
                              isar: widget.isar,
                              serviceDefinitionLocalRepository: ctx.read<
                                  LocalRepository<ServiceDefinitionModel,
                                      ServiceDefinitionSearchModel>>(),
                              boundaryRemoteRepository: ctx.read<
                                  RemoteRepository<BoundaryModel,
                                      BoundarySearchModel>>(),
                              boundaryLocalRepository: ctx.read<
                                  LocalRepository<BoundaryModel,
                                      BoundarySearchModel>>(),
                              productVariantLocalRepository: ctx.read<
                                  LocalRepository<ProductVariantModel,
                                      ProductVariantSearchModel>>(),
                              productVariantRemoteRepository: ctx.read<
                                  RemoteRepository<ProductVariantModel,
                                      ProductVariantSearchModel>>(),
                              projectResourceLocalRepository: ctx.read<
                                  LocalRepository<ProjectResourceModel,
                                      ProjectResourceSearchModel>>(),
                              projectResourceRemoteRepository: ctx.read<
                                  RemoteRepository<ProjectResourceModel,
                                      ProjectResourceSearchModel>>(),
                              attendanceLocalRepository: ctx.read<
                                  LocalRepository<AttendanceRegisterModel,
                                      AttendanceRegisterSearchModel>>(),
                              attendanceRemoteRepository: ctx.read<
                                  RemoteRepository<AttendanceRegisterModel,
                                      AttendanceRegisterSearchModel>>(),
                              individualLocalRepository: ctx.read<
                                  LocalRepository<IndividualModel,
                                      IndividualSearchModel>>(),
                              individualRemoteRepository: ctx.read<
                                  RemoteRepository<IndividualModel,
                                      IndividualSearchModel>>(),
                              attendanceLogLocalRepository: ctx.read<
                                  LocalRepository<AttendanceLogModel,
                                      AttendanceLogSearchModel>>(),
                              attendanceLogRemoteRepository: ctx.read<
                                  RemoteRepository<AttendanceLogModel,
                                      AttendanceLogSearchModel>>(),
                              downSyncLocalRepository: ctx.read<
                                  LocalRepository<DownsyncModel,
                                      DownsyncSearchModel>>(),
                              stockLocalRepository: ctx.read<
                                  LocalRepository<StockModel,
                                      StockSearchModel>>(),
                              stockRemoteRepository: ctx.read<
                                  RemoteRepository<StockModel,
                                      StockSearchModel>>(),
                              userActionLocalRepository:
                                  ctx.read<UserActionLocalRepository>(),
                              userActionRemoteRepository:
                                  ctx.read<UserActionRemoteRepository>(),
                              context: context,
                            ),
                          ),
                          BlocProvider(
                              create: (ctx) => DashboardBloc(
                                    const DashboardState.initialState(),
                                    isar: widget.isar,
                                    dashboardRemoteRepo:
                                        DashboardRemoteRepository(
                                            widget.client),
                                    attendanceDataRepository:
                                        context.repository<
                                            AttendanceRegisterModel,
                                            AttendanceRegisterSearchModel>(),
                                    individualDataRepository:
                                        context.repository<IndividualModel,
                                            IndividualSearchModel>(),
                                  )),
                          BlocProvider(
                            create: (context) => FacilityBloc(
                              facilityDataRepository: context.repository<
                                  FacilityModel, FacilitySearchModel>(),
                              projectFacilityDataRepository: context.repository<
                                  ProjectFacilityModel,
                                  ProjectFacilitySearchModel>(),
                            ),
                          ),
                          BlocProvider(
                            create: (context) => ProductVariantBloc(
                              const ProductVariantEmptyState(),
                              context.repository<ProductVariantModel,
                                  ProductVariantSearchModel>(),
                              context.repository<ProjectResourceModel,
                                  ProjectResourceSearchModel>(),
                            ),
                          ),
                          BlocProvider(
                            create: (context) => ProjectFacilityBloc(
                              const ProjectFacilityState.loading(),
                              projectFacilityDataRepository: context.repository<
                                  ProjectFacilityModel,
                                  ProjectFacilitySearchModel>(),
                            ),
                          ),
                          BlocProvider(
                            create: (_) => ErrorBloc(),
                          ),
                        ],
                        child: BlocBuilder<ErrorBloc, ErrorState>(
                            builder: (context, errorState) {
                          return BlocBuilder<LocalizationBloc,
                              LocalizationState>(
                            builder: (context, langState) {
                              final selectedLocale =
                                  AppSharedPreferences().getSelectedLocale ??
                                      firstLanguage;

                              return MaterialApp.router(
                                debugShowCheckedModeBanner: false,
                                builder: (context, child) {
                                  final env = envConfig.variables.envType;
                                  if (env == EnvType.prod) {
                                    return child ?? const SizedBox.shrink();
                                  }

                                  return Banner(
                                    message: envConfig.variables.envType.name,
                                    location: BannerLocation.topEnd,
                                    color: () {
                                      switch (envConfig.variables.envType) {
                                        case EnvType.uat || EnvType.demo:
                                          return Colors.green;
                                        case EnvType.qa:
                                          return Colors.pink;
                                        default:
                                          return Colors.red;
                                      }
                                    }(),
                                    child: child,
                                  );
                                },
                                supportedLocales: languages != null
                                    ? languages.map((e) {
                                        final results = e.value.split('_');

                                        return results.isNotEmpty
                                            ? Locale(
                                                results.first, results.last)
                                            : firstLanguage;
                                      })
                                    : [firstLanguage],
                                localizationsDelegates:
                                    getAppLocalizationDelegates(
                                  sql: widget.sql,
                                  appConfig: appConfig,
                                  selectedLocale: Locale(
                                    selectedLocale!.split("_").first,
                                    selectedLocale.split("_").last,
                                  ),
                                ),
                                locale: languages != null
                                    ? Locale(
                                        selectedLocale!.split("_").first,
                                        selectedLocale.split("_").last,
                                      )
                                    : firstLanguage,
                                theme:
                                    DigitExtendedTheme.instance.getLightTheme(),
                                routeInformationParser:
                                    widget.appRouter.defaultRouteParser(),
                                scaffoldMessengerKey: scaffoldMessengerKey,
                                routerDelegate: AutoRouterDelegate.declarative(
                                  widget.appRouter,
                                  navigatorObservers: () => [
                                    AppRouterObserver(),
                                    ...AnalyticsService.instance.observers,
                                  ],
                                  routes: (handler) => authState.maybeWhen(
                                    orElse: () => [
                                      const UnauthenticatedRouteWrapper(),
                                    ],
                                    authenticated: (_, __, ___, ____, _____) =>
                                        [
                                      AuthenticatedRouteWrapper(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
