import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/app_bloc_observer.dart';
import 'blocs/app_initilization/app_initilization.dart';
import 'blocs/auth/auth.dart';
import 'blocs/localization/app_localization.dart';
import 'blocs/localization/localization.dart';
import 'data/remote_client.dart';
import 'data/repositories/remote/localization.dart';
import 'data/repositories/remote/mdmd.dart';
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
        BlocProvider(
          create: (context) => LocalizationBloc(
            const LocalizationState(),
            LocalizationRepository(client.init()),
          )..add(const LocalizationEvent.onLoadLocalization(
              module: 'hcm-common',
              tenantId: 'pb',
              locale: 'en_IN',
            )),
          lazy: false,
        BlocProvider(create: (context) => AuthBloc(const AuthState())),
        BlocProvider(
          create: (context) =>
              TableHideActionBloc(const TableHideActionState()),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return MaterialApp.router(
          supportedLocales: const [
            Locale('en', 'IN'),
            Locale('hi', 'IN'),
            Locale.fromSubtags(languageCode: 'pn'),
          ],
          locale: const Locale('en', 'IN'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
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
              if (state.isAuthenticated)
                const AuthenticatedRouteWrapper()
              else
                const LoginRoute(),
            ],
          ),
        );
      }),
    );
  }
}
