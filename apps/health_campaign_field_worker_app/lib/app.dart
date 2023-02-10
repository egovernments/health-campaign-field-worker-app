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
import 'blocs/table_hide_action.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/network_manager.dart';
import 'data/repositories/remote/auth.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
import 'utils/constants.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitializationBloc(
            isar: isar,
            mdmsRepository: MdmsRepository(client),
          )..add(const AppInitializationSetupEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            const AuthState(),
            AuthRepository(client),
          ),
        ),
        BlocProvider(
          create: (context) => TableHideActionBloc(
            const TableHideActionState(),
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

              return BlocProvider(
                create:
                    (localizationModulesList != null && firstLanguage != null)
                        ? (context) => LocalizationBloc(
                              const LocalizationState(),
                              LocalizationRepository(client, isar),
                              isar,
                            )..add(
                                LocalizationEvent.onLoadLocalization(
                                  module: localizationModulesList.interfaces
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
                child: NetworkManagerProviderWrapper(
                  isar: isar,
                  configuration: const NetworkManagerConfiguration(
                    persistenceConfig: PersistenceConfiguration.offlineFirst,
                  ),
                  dio: client,
                  sql: sql,
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
                      routes: (handler) => [
                        if (authState.isAuthenticated)
                          const AuthenticatedRouteWrapper()
                        else
                          const UnauthenticatedRouteWrapper(),
                      ],
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
}
