import 'package:digit_components/digit_components.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';
import 'package:referral_reconciliation/blocs/referral_recon_service.dart';
import 'package:referral_reconciliation/blocs/search_referral_reconciliations.dart';
import 'package:registration_delivery/blocs/facility/facility.dart';
import 'package:registration_delivery/blocs/project_facility/project_facility.dart';
import 'package:registration_delivery/utils/utils.dart';

import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/boundary/boundary.dart';
import 'blocs/localization/localization.dart';
import 'blocs/product_variant/product_variant.dart';
import 'blocs/project/project.dart';
import 'blocs/user/user.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/network_manager.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'models/data_model.dart';
// import 'models/entities/hcm_attendance_log_model.dart';
// import 'models/entities/hcm_attendance_model.dart';
import 'models/entities/product_variant.dart';
import 'models/entities/project_resource.dart';
import 'models/entities/project_staff.dart';
import 'models/entities/user.dart';

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
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalSqlDataStore>.value(value: widget.sql),
        RepositoryProvider<Isar>.value(value: widget.isar),
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
                    var firstLanguage;
                    firstLanguage = appConfig.languages?.last.value;
                    final languages = appConfig.languages;

                    RegistrationDeliverySingleton().setInitialData(
                      tenantId: envConfig.variables.tenantId,
                      loggedInUserUuid: context.loggedInUserUuid,
                      maxRadius: appConfig.maxRadius!,
                      projectId: context.projectId,
                      selectedBeneficiaryType: context.beneficiaryType,
                      projectType: context.selectedProjectType!,
                      selectedProject: context.selectedProject,
                      boundaryModel: context.boundary,
                      genderOptions: appConfig.genderOptions!.map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                        };
                      }).toList(),
                      idTypeOptions: appConfig.idTypeOptions!.map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                        };
                      }).toList(),
                      householdDeletionReasonOptions: appConfig
                          .householdDeletionReasonOptions!
                          .map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                        };
                      }).toList(),
                      householdMemberDeletionReasonOptions: appConfig
                          .householdMemberDeletionReasonOptions!
                          .map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                        };
                      }).toList(),
                      deliveryCommentOptions:
                      appConfig.deliveryCommentOptions!.map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                        };
                      }).toList(),
                      symptomsTypes: appConfig.symptomsTypes!.map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                          'bool': option.active,
                        };
                      }).toList(),
                      referralReasons: appConfig.referralReasons!.map((option) {
                        return {
                          'label': option.name,
                          'value': option.code,
                          'bool': option.active,
                        };
                      }).toList(),
                    );

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (localizationModulesList != null &&
                                  firstLanguage != null)
                              ? (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                      widget.client,
                                      widget.isar,
                                    ),
                                    widget.isar,
                                  )..add(
                                      LocalizationEvent.onLoadLocalization(
                                        module: localizationModulesList
                                            .interfaces
                                            .where((element) =>
                                                element.type ==
                                                Modules.localizationModule)
                                            .map((e) => e.name.toString())
                                            .join(',')
                                            .toString(),
                                        tenantId: appConfig.tenantId.toString(),
                                        locale: firstLanguage,
                                        path: Constants.localizationApiPath,
                                      ),
                                    )
                              : (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(
                                      widget.client,
                                      widget.isar,
                                    ),
                                    widget.isar,
                                  ),
                        ),
                        BlocProvider(
                          create: (ctx) => ProjectBloc(
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
                            // attendanceLocalRepository: ctx.read<
                            //     LocalRepository<HCMAttendanceRegisterModel,
                            //         HCMAttendanceSearchModel>>(),
                            // attendanceRemoteRepository: ctx.read<
                            //     RemoteRepository<HCMAttendanceRegisterModel,
                            //         HCMAttendanceSearchModel>>(),
                            individualLocalRepository: ctx.read<
                                LocalRepository<IndividualModel,
                                    IndividualSearchModel>>(),
                            individualRemoteRepository: ctx.read<
                                RemoteRepository<IndividualModel,
                                    IndividualSearchModel>>(),
                            // attendanceLogLocalRepository: ctx.read<
                            //     LocalRepository<HCMAttendanceLogModel,
                            //         HCMAttendanceLogSearchModel>>(),
                            // attendanceLogRemoteRepository: ctx.read<
                            //     RemoteRepository<HCMAttendanceLogModel,
                            //         HCMAttendanceLogSearchModel>>(),
                            stockLocalRepository: ctx.read<
                                LocalRepository<StockModel,
                                    StockSearchModel>>(),
                            stockRemoteRepository: ctx.read<
                                RemoteRepository<StockModel,
                                    StockSearchModel>>(),
                            context: context,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => FacilityBloc(
                            facilityLocalRepository: context.read<
                                LocalRepository<FacilityModel,
                                    FacilitySearchModel>>(),
                            projectFacilityLocalRepository: context.read<
                                LocalRepository<ProjectFacilityModel,
                                    ProjectFacilitySearchModel>>(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => ProductVariantBloc(
                            const ProductVariantEmptyState(),
                            productVariantDataRepository: context.read<
                                RemoteRepository<ProductVariantModel,
                                    ProductVariantSearchModel>>(),
                            projectResourceDataRepository: context.read<
                                RemoteRepository<ProjectResourceModel,
                                    ProjectResourceSearchModel>>(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => ProjectFacilityBloc(
                            const ProjectFacilityState.empty(),
                            projectFacilityDataRepository: context.repository<
                                ProjectFacilityModel,
                                ProjectFacilitySearchModel>(),
                          ),
                        ),
                        BlocProvider(
                          create: (context) => SearchReferralsBloc(
                            userUid: context.loggedInUserUuid,
                          ),
                        ),
                        BlocProvider(
                          create: (context) => ReferralReconServiceBloc(
                            const ReferralReconServiceEmptyState(),
                          ),
                        ),
                      ],
                      child: BlocBuilder<LocalizationBloc, LocalizationState>(
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
                                ? languages.map((e) {
                                    final results = e.value.split('_');

                                    return results.isNotEmpty
                                        ? Locale(results.first, results.last)
                                        : firstLanguage;
                                  })
                                : [firstLanguage],
                            localizationsDelegates: getAppLocalizationDelegates(
                              isar: widget.isar,
                              appConfig: appConfig,
                              selectedLocale: selectedLocale,
                            ),
                            locale: languages != null
                                ? Locale(
                                    selectedLocale!.split("_").first,
                                    selectedLocale.split("_").last,
                                  )
                                : firstLanguage,
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
