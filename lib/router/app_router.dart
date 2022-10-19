import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_campaigns_flutter/pages/authenticated.dart';
import 'package:health_campaigns_flutter/pages/forms.dart';
import 'package:health_campaigns_flutter/pages/home.dart';
import 'package:health_campaigns_flutter/pages/landing.dart';
import 'package:health_campaigns_flutter/pages/login.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LandingPage, path: ''),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(
      page: AuthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(page: HomePage, path: ''),
        AutoRoute(page: FormsPage, path: 'forms/:pageName'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
