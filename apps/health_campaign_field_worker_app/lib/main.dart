import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app_bloc_observer.dart';
<<<<<<< HEAD
import 'blocs/app_config/app_config.dart';
=======
import 'blocs/app_initilization/app_initilization.dart';
>>>>>>> 8a5bccb (added api integration)
import 'blocs/auth/auth.dart';
import 'blocs/table_hide_action.dart';
import 'router/app_navigator_observer.dart';
import 'router/app_router.dart';

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
    return MultiBlocProvider(
      providers: [
<<<<<<< HEAD
        BlocProvider(create: (context) => AuthBloc(const AuthState())),
        BlocProvider(
          create: (_) => ApplicationConfigBloc(const ApplicationConfigState())
            ..add(const ApplicationConfigEvent.onFetchConfig()),
        ),
        BlocProvider(
          create: (context) =>
              TableHideActionBloc(const TableHideActionState()),
=======
        BlocProvider(
          create: (context) => AppInitilizationBloc(
            const AppInitilizationState(),
          )..add(const AppInitilizationSetupEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            const AuthState(),
          ),
>>>>>>> 8a5bccb (added api integration)
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return MaterialApp.router(
          theme: DigitTheme.instance.mobileTheme,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate.declarative(
            appRouter,
            navigatorObservers: () => [AppRouterObserver()],
            routes: (handler) => [
              if (state.isAuthenticated)
                const AuthenticatedRouteWrapper()
              else
                const UnauthenticatedRouteWrapper(),
            ],
          ),
        );
      }),
    );
  }
}
