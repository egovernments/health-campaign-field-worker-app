import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/blocs/localization/app_localization.dart';
import 'package:health_campaign_field_worker_app/pages/household_details.dart';
import 'package:health_campaign_field_worker_app/pages/household_overview.dart';
import 'package:health_campaign_field_worker_app/pages/individual_details.dart';

export 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
    AutoRoute(page: IndividualDetailsPage, path: 'individual-details'),
    AutoRoute(page: HouseholdOverViewPage, path: 'household-overview'),
  ],
)
class AppRouter extends _$AppRouter {}
