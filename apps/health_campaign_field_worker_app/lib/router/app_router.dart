import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/authenticated.dart';
import '../pages/forms.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/search_beneficiary.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(
      page: AuthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(page: HomePage, path: ''),
        AutoRoute(page: FormsPage, path: 'forms/:pageName'),
        AutoRoute(page: SearchBeneficiaryPage, path: 'search-benificary'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
