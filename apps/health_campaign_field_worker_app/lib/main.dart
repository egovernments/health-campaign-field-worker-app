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

void main() async {
  Bloc.observer = AppBlocObserver();
  DigitUi.instance.initThemeComponents();

  Isar isar = await Isar.open([
    ServiceRegistrySchema,
    LocalizationWrapperSchema,
    AppConigurationSchema,
  ]);

  runApp(MainApplication(
    appRouter: AppRouter(),
    isar: isar,
  ));
}

class MainApplication extends StatelessWidget {
  final AppRouter appRouter;
  final Isar isar;
  const MainApplication({
    Key? key,
    required this.isar,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio client = Client().init();

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
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final appConfig = appConfigState.appConiguration;
              // final tenantId = appConfigState.appConiguration?;
              final localizationModulesList = appConfig?.localizationModules;
              final firstLanguage = appConfig?.languages?.first.value;
              final languages = appConfig?.languages;

              return BlocProvider(
                create: (appConfig != null &&
                        localizationModulesList != null &&
                        firstLanguage != null)
                    ? (context) => LocalizationBloc(
                          const LocalizationState(),
                          LocalizationRepository(client),
                          isar,
                        )..add(LocalizationEvent.onLoadLocalization(
                            module: localizationModulesList
                                .map((e) => e.value.toString())
                                .join(',')
                                .toString(),
                            tenantId: "pb",
                            locale: firstLanguage,
                            path: 'localization/messages/v1/_search',
                          ))
                    : (context) => LocalizationBloc(
                          const LocalizationState(),
                          LocalizationRepository(client),
                          isar,
                        ),
                child: MaterialApp.router(
                  supportedLocales: appConfig != null && languages != null
                      ? languages.map((e) {
                          final results = e.value.split('_');

                          return results.isNotEmpty
                              ? Locale(results.first, results.last)
                              : const Locale('en', 'MZ');
                        })
                      : [const Locale('en', 'MZ')],
                  localizationsDelegates: [
                    if (appConfig != null)
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
              );
            },
          );
        },
      ),
    );
  }
}
