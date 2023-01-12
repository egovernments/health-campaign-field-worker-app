import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/authenticated.dart';
import '../pages/home.dart';
import '../pages/household_location.dart';
import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/unauthenticated.dart';
import '../pages/search_beneficiary.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: UnauthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(
          page: LanguageSelectionPage,
          path: 'language_selection',
          initial: true,
        ),
        AutoRoute(page: LoginPage, path: 'login'),
      ],
    ),
    AutoRoute(
      page: AuthenticatedPageWrapper,
      path: '/',
      children: [
        AutoRoute(page: HomePage, path: ''),
        AutoRoute(page: SearchBeneficiaryPage, path: 'search-beneficiary'),
        AutoRoute(page: HouseholdLocationPage, path: 'household-location'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
