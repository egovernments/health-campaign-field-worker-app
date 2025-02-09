import 'package:attendance_management/attendance_management.dart';
import 'package:digit_dss/digit_dss.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaign_field_worker_app/data/repositories/remote/bandwidth_check.dart';
import 'package:inventory_management/blocs/stock_reconciliation.dart';
import 'package:inventory_management/inventory_management.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:registration_delivery/data/repositories/local/household_global_search.dart';
import 'package:registration_delivery/data/repositories/local/individual_global_search.dart';
import 'package:registration_delivery/registration_delivery.dart';

import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/localization/localization.dart';
import 'blocs/project/project.dart';
import 'blocs/summary_reports/custom_distribution_summary_report.dart';
import 'blocs/summary_reports/custom_enumeration_summary_report.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/network_manager.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
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
  String defaultLanguageCode = "fr_BI";
  Locale getLocale(String? languageCode) {
    languageCode ??= defaultLanguageCode;
    List<String> results = languageCode.split("_");
    return Locale(
      results.first,
      results.last,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalSqlDataStore>.value(value: widget.sql),
        RepositoryProvider<Isar>.value(value: widget.isar),
        RepositoryProvider<IndividualGlobalSearchRepository>(
          create: (context) => IndividualGlobalSearchRepository(
            widget.sql,
            IndividualOpLogManager(widget.isar),
          ),
        ),
        RepositoryProvider<HouseHoldGlobalSearchRepository>(
          create: (context) => HouseHoldGlobalSearchRepository(
            widget.sql,
            HouseholdOpLogManager(widget.isar),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AppInitializationBloc(
          isar: widget.isar,
          mdmsRepository: MdmsRepository(widget.client),
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
                create: (_) {
                  return DigitScannerBloc(
                    const DigitScannerState(),
                  );
                },
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
              BlocProvider(
                create: (context) => CustomEnumerationSummaryReportBloc(
                  householdRepository: context
                      .repository<HouseholdModel, HouseholdSearchModel>(),
                  taskRepository:
                      context.repository<TaskModel, TaskSearchModel>(),
                  projectBeneficiaryRepository: context.repository<
                      ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(),
                ),
              ),
              BlocProvider(
                create: (context) => CustomDistributionSummaryReportBloc(
                  householdRepository: context
                      .repository<HouseholdModel, HouseholdSearchModel>(),
                  taskRepository:
                      context.repository<TaskModel, TaskSearchModel>(),
                  projectBeneficiaryRepository: context.repository<
                      ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>(),
                ),
              ),
            ],
            child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
              builder: (context, appConfigState) {
                return BlocBuilder<AuthBloc, AuthState>(
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

                    final localizationModulesList = appConfig.backendInterface;
                    List<Languages>? languages = appConfig.languages;
                    String firstLanguage =
                        languages?.last.value ?? defaultLanguageCode;
                    String? selectedLocale =
                        AppSharedPreferences().getSelectedLocale;

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (localizationModulesList != null)
                              ? (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                      widget.client,
                                      widget.sql,
                                    ),
                                    widget.sql,
                                  )..add(
                                      LocalizationEvent.onLoadLocalization(
                                        module:
                                            "hcm-boundary-${envConfig.variables.hierarchyType.toLowerCase()},${localizationModulesList.interfaces.where((element) => element.type == Modules.localizationModule).map((e) => e.name.toString()).join(',')}",
                                        tenantId: appConfig.tenantId.toString(),
                                        locale: selectedLocale ?? firstLanguage,
                                        path: Constants.localizationApiPath,
                                      ),
                                    )
                              : (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                      widget.client,
                                      widget.sql,
                                    ),
                                    widget.sql,
                                  ),
                        ),
                        BlocProvider(
                          create: (ctx) => ProjectBloc(
                            bandwidthCheckRepository: BandwidthCheckRepository(
                              DioClient().dio,
                              bandwidthPath:
                                  envConfig.variables.checkBandwidthApiPath,
                            ),
                            mdmsRepository: MdmsRepository(widget.client),
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
                            isar: widget.isar,
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
                            individualLocalRepository: ctx.read<
                                LocalRepository<IndividualModel,
                                    IndividualSearchModel>>(),
                            individualRemoteRepository: ctx.read<
                                RemoteRepository<IndividualModel,
                                    IndividualSearchModel>>(),
                            context: context,
                            attendanceLogLocalRepository: ctx.read<
                                LocalRepository<AttendanceLogModel,
                                    AttendanceLogSearchModel>>(),
                            attendanceLogRemoteRepository: ctx.read<
                                RemoteRepository<AttendanceLogModel,
                                    AttendanceLogSearchModel>>(),
                            attendanceLocalRepository: ctx.read<
                                LocalRepository<AttendanceRegisterModel,
                                    AttendanceRegisterSearchModel>>(),
                            attendanceRemoteRepository: ctx.read<
                                RemoteRepository<AttendanceRegisterModel,
                                    AttendanceRegisterSearchModel>>(),
                            dashboardRemoteRepository:
                                DashboardRemoteRepository(widget.client),

                            // Info can any package here
                          ),
                        ),
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
                          create: (context) => StockReconciliationBloc(
                            StockReconciliationState(
                              projectId: InventorySingleton().projectId,
                              dateOfReconciliation: DateTime.now(),
                            ),
                            stockReconciliationRepository: context.repository<
                                StockReconciliationModel,
                                StockReconciliationSearchModel>(),
                            stockRepository: context
                                .repository<StockModel, StockSearchModel>(),
                          ),
                        ),
                      ],
                      child: BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, langState) {
                          String? selectedLocale =
                              AppSharedPreferences().getSelectedLocale;
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
                                    case EnvType.uat:
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
                                ? languages.map((e) => getLocale(e.value)
                                    // {
                                    //     final results = e.value.split('_');

                                    //     return results.isNotEmpty
                                    //         ? Locale(results.first, results.last)
                                    //         : firstLanguage;
                                    //   }
                                    )
                                : [getLocale(firstLanguage)],
                            localizationsDelegates: getAppLocalizationDelegates(
                              sql: widget.sql,
                              appConfig: appConfig,
                              selectedLocale: selectedLocale ?? firstLanguage,
                            ),
                            locale: languages != null
                                ? getLocale(selectedLocale)
                                : getLocale(firstLanguage),
                            theme: DigitTheme.instance.mobileTheme,
                            routeInformationParser:
                                widget.appRouter.defaultRouteParser(),
                            scaffoldMessengerKey: scaffoldMessengerKey,
                            routerDelegate: AutoRouterDelegate.declarative(
                              widget.appRouter,
                              navigatorObservers: () => [AppRouterObserver()],
                              routes: (handler) => authState.maybeWhen(
                                orElse: () => [
                                  const UnauthenticatedRouteWrapper(),
                                ],
                                authenticated: (_, __, ___, ____, _____) => [
                                  AuthenticatedRouteWrapper(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
