import 'package:digit_components/digit_components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'blocs/app_bloc_observer.dart';
import 'blocs/app_initialization/app_initialization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/localization/app_localization.dart';
import 'blocs/localization/localization.dart';
import 'data/local_store/no_sql/schema/app_configuration.dart';
import 'data/local_store/no_sql/schema/localization.dart';
import 'data/local_store/no_sql/schema/service_registry.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'blocs/table_hide_action.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
import 'utils/constants.dart';
import 'utils/environment_config.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await envConfig.initialize();
  DigitUi.instance.initThemeComponents();

  Isar isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConfigurationSchema,
  ]);

  Dio client = Client().init();

  runApp(MainApplication(
    appRouter: AppRouter(),
    isar: isar,
    client: client,
  ));
}

class MainApplication extends StatelessWidget {
  final Dio client;
  final AppRouter appRouter;
  final Isar isar;

  const MainApplication({
    Key? key,
    required this.isar,
    required this.client,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitializationBloc(
            const AppInitializationState(),
            isar: isar,
            mdmsRepository: MdmsRepository(client),
          )..add(const AppInitializationSetupEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            const AuthState(),
          ),
        ),
        BlocProvider(create: (context) => AuthBloc(const AuthState())),
        BlocProvider(
          create: (_) => AppInitializationBloc(
            const AppInitializationState(),
            isar: isar,
            mdmsRepository: MdmsRepository(client),
          )..add(const AppInitializationEvent.onApplicationConfigurationSetup(
              actionType: 'search',
            )),
        ),
        BlocProvider(
          create: (context) =>
              TableHideActionBloc(const TableHideActionState()),
        ),
      ],
      child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
        builder: (context, appConfigState) {
          const defaultLocale = Locale('en', 'IN');

          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final appConfig = appConfigState.appConfiguration;
              final localizationModulesList = appConfig?.backendInterface;
              final firstLanguage = appConfig?.languages?.last.value;
              final languages = appConfig?.languages;

              return appConfig != null
                  ? BlocProvider(
                      create: (localizationModulesList != null &&
                              firstLanguage != null)
                          ? (context) => LocalizationBloc(
                                const LocalizationState(),
                                LocalizationRepository(client, isar),
                                isar,
                              )..add(LocalizationEvent.onLoadLocalization(
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
                                ))
                          : (context) => LocalizationBloc(
                                const LocalizationState(),
                                LocalizationRepository(client, isar),
                                isar,
                              ),
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
                    )
                  : const MaterialApp(home: Scaffold(body: Text('Loading')));
              // Placeholder for Loading Component
            },
          );
        },
      ),
    );
  }
}
