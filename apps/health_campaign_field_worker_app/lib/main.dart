import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/app_bloc_observer.dart';
import 'blocs/app_config/app_config.dart';
import 'blocs/app_initilization/app_initilization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/localization/app_localization.dart';
import 'blocs/localization/localization.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdms.dart';
import 'blocs/table_hide_action.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';
import 'utils/constants.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  DigitUi.instance.initThemeComponents();

  runApp(MainApplication(appRouter: AppRouter()));
}

class MainApplication extends StatelessWidget {
  final AppRouter appRouter;

  const MainApplication({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client = Client();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitilizationBloc(
            const AppInitilizationState(),
            MdmsRepository(client.init()),
          )..add(const AppInitilizationSetupEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            const AuthState(),
          ),
        ),
        BlocProvider(create: (context) => AuthBloc(const AuthState())),
        BlocProvider(
          create: (_) => ApplicationConfigBloc(const ApplicationConfigState())
            ..add(const ApplicationConfigEvent.onFetchConfig()),
        ),
        BlocProvider(
          create: (context) =>
              TableHideActionBloc(const TableHideActionState()),
        ),
      ],
      child: BlocBuilder<ApplicationConfigBloc, ApplicationConfigState>(
        builder: (context, appConfigState) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final appConfig =
                  appConfigState.appConfigDetail?.configuration?.appConfig;
              final tenantId = appConfigState.appConfigDetail?.tenantId;

              return BlocProvider(
                create: appConfig != null
                    ? (context) => LocalizationBloc(
                          const LocalizationState(),
                          LocalizationRepository(client.init()),
                        )..add(LocalizationEvent.onLoadLocalization(
                            module: appConfig.localizationModules!
                                .map((e) => e.value.toString())
                                .toList()
                                .join(',')
                                .toString(),
                            tenantId: tenantId ?? "default",
                            locale: appConfig.languages.first.value,
                          ))
                    : (context) => LocalizationBloc(
                          const LocalizationState(),
                          LocalizationRepository(client.init()),
                        ),
                lazy: false,
                child: MaterialApp.router(
                  supportedLocales: appConfig != null
                      ? appConfig.languages.map((e) {
                          final results = e.value.split('_');

                          return results.isNotEmpty
                              ? Locale(results.first, results.last)
                              : const Locale('en', 'IN');
                        })
                      : [],
                  localizationsDelegates: [
                    if (appConfig != null)
                      AppLocalizations.getDelegate(appConfig),
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
