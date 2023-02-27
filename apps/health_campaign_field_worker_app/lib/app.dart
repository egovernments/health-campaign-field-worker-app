import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';

import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/localization/app_localization.dart';
import 'blocs/localization/localization.dart';
import 'blocs/project/project.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/network_manager.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'data/repositories/remote/project.dart';
import 'data/repositories/remote/project_staff.dart';
import 'models/oplog/oplog_entry.dart';
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
                create: (ctx) => AuthBloc(authRepository: ctx.read())
                  ..add(
                    AuthAutoLoginEvent(
                      tenantId: envConfig.variables.tenantId,
                    ),
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
                          create: (_) => ProjectBloc(
                            projectStaffRemoteRepository:
                                ProjectStaffRemoteRepository(
                              client,
                              actionMap: {
                                ApiOperation.search:
                                    '/project/staff/v1/_search',
                              },
                            ),
                            projectRemoteRepository: ProjectRemoteRepository(
                              client,
                              actionMap: {
                                ApiOperation.search: '/project/v1/_search',
                              },
                            ),
                            isar: isar,
                            sql: sql,
                          ),
                        ),
                      ],
                      child: MaterialApp.router(
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
                        theme: DigitTheme.instance.mobileTheme,
                        routeInformationParser: appRouter.defaultRouteParser(),
                        scaffoldMessengerKey: scaffoldMessengerKey,
                        routerDelegate: AutoRouterDelegate.declarative(
                          appRouter,
                          navigatorObservers: () => [AppRouterObserver()],
                          routes: (handler) => authState.maybeWhen(
                            orElse: () => [
                              const UnauthenticatedRouteWrapper(),
                            ],
                            authenticated: (_, __) => [
                              const AuthenticatedRouteWrapper(),
                            ],
                          ),
                        ),
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
