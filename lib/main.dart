import 'package:digit_ui_components/digit_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaigns_flutter/blocs/auth/auth.dart';
import 'package:health_campaigns_flutter/blocs/forms/forms.dart';
import 'package:health_campaigns_flutter/router/app_router.dart';

void main() {
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
        BlocProvider(
          create: (context) => FormsBloc()..add(const FormsLoadEvent('')),
        ),
        BlocProvider(
          create: (context) => AuthBloc(const AuthState()),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return MaterialApp.router(
          theme: DigitTheme.instance.mobileTheme,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate.declarative(
            appRouter,
            routes: (handler) => [
              if (state.isAuthenticated)
                const AuthenticatedPageWrapperRoute()
              else
                const LoginPageRoute(),
            ],
          ),
        );
      }),
    );
  }
}
