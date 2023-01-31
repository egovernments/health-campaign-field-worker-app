import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../blocs/localization/app_localization.dart';
import '../pages/acknowledgement.dart';
import '../pages/authenticated.dart';
import '../pages/deliver_intervention.dart';
import '../pages/home.dart';
import '../pages/household_overview.dart';
import '../pages/individual_details.dart';
import '../pages/household_details.dart';
import '../pages/household_location.dart';

import '../pages/language_selection.dart';
import '../pages/login.dart';
import '../pages/project_selection.dart';
import '../pages/reason_for_deletion.dart';
import '../pages/search_beneficiary.dart';
import '../pages/unauthenticated.dart';

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
        AutoRoute(page: HouseholdOverViewPage, path: 'household-overview'),
        AutoRoute(page: DeliverInterventionPage, path: 'deliver-intervention'),
        AutoRoute(page: IndividualDetailsPage, path: 'individual-details'),
        AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
        AutoRoute(page: HouseholdLocationPage, path: 'household-location'),
        AutoRoute(page: AcknowledgementPage, path: 'ackowledgement'),
        AutoRoute(page: ReasonForDeletionPage, path: 'reason-for-deletion'),
        AutoRoute(page: ProjectSelectionPage, path: 'project-selection'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
