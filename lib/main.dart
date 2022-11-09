import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/walkthrough/walkthrough.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/blocs/app_bloc_observer.dart';
import 'package:health_campaigns_flutter/blocs/auth/auth.dart';
import 'package:health_campaigns_flutter/router/app_navigator_observer.dart';
import 'package:health_campaigns_flutter/router/app_router.dart';
import 'package:location/location.dart';

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
        BlocProvider(create: (context) => AuthBloc(const AuthState())),
        BlocProvider<WalkthroughBloc>(
          create: (BuildContext context) => WalkthroughBloc(
            const WalkthroughState(
              walkthroughData: SchemaObject(name: '', version: 1),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => LocationBloc(location: Location())
            ..add(const LoadLocationEvent()),
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
                const LoginRoute(),
            ],
          ),
        );
      }),
    );
  }
}
