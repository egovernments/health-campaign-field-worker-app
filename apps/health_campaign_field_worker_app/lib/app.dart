import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:location/location.dart';

import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/boundary/boundary.dart';
import 'blocs/localization/app_localization.dart';
import 'blocs/localization/localization.dart';
import 'blocs/project/project.dart';
import 'data/data_repository.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/network_manager.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'models/data_model.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
import 'utils/constants.dart';
import 'utils/environment_config.dart';
import 'widgets/network_manager_provider_wrapper.dart';

class MainApplication extends StatelessWidget {
  final Dio client;
  final AppRouter appRouter;
  final Isar isar;
  final LocalSqlDataStore sql;

  const MainApplication({
    Key? key,
    required this.isar,
    required this.client,
    required this.appRouter,
    required this.sql,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalSqlDataStore>.value(value: sql),
        RepositoryProvider<Isar>.value(value: isar),
      ],
      child: BlocProvider(
        create: (context) => AppInitializationBloc(
          isar: isar,
          mdmsRepository: MdmsRepository(client),
        )..add(const AppInitializationSetupEvent()),
        child: NetworkManagerProviderWrapper(
          isar: isar,
          configuration: const NetworkManagerConfiguration(
            persistenceConfig: PersistenceConfiguration.offlineFirst,
          ),
          dio: client,
          sql: sql,
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
                create: (ctx) => AuthBloc(authRepository: ctx.read())
                  ..add(
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
                const defaultLocale = Locale('en', 'IN');

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
                    final firstLanguage = appConfig.languages?.first.value;
                    final languages = appConfig.languages;

                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (localizationModulesList != null &&
                                  firstLanguage != null)
                              ? (context) => LocalizationBloc(
                                    const LocalizationState(),
                                    LocalizationRepository(client, isar),
                                    isar,
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
                                    LocalizationRepository(client, isar),
                                    isar,
                                  ),
                        ),
                        BlocProvider(
                          create: (ctx) => ProjectBloc(
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
                            isar: isar,
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
                          ),
                        ),
                      ],
                      child: BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, langState) {
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
                                        : defaultLocale;
                                  })
                                : [defaultLocale],
                            localizationsDelegates: [
                              AppLocalizations.getDelegate(appConfig, isar),
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                              GlobalMaterialLocalizations.delegate,
                            ],
                            locale: languages != null
                                ? Locale(
                                    languages[langState.index]
                                        .value
                                        .split('_')
                                        .first,
                                    languages[langState.index]
                                        .value
                                        .split('_')
                                        .last,
                                  )
                                : defaultLocale,
                            theme: DigitTheme.instance.mobileTheme,
                            routeInformationParser:
                                appRouter.defaultRouteParser(),
                            scaffoldMessengerKey: scaffoldMessengerKey,
                            routerDelegate: AutoRouterDelegate.declarative(
                              appRouter,
                              navigatorObservers: () => [AppRouterObserver()],
                              routes: (handler) => authState.maybeWhen(
                                orElse: () => [
                                  const UnauthenticatedRouteWrapper(),
                                ],
                                authenticated: (_, __, ___) => [
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
