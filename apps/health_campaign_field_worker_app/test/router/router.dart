import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_campaign_field_worker_app/pages/household_details.dart';

export 'package:auto_route/auto_route.dart';
import '../../lib/blocs/localization/app_localization.dart';
part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HouseHoldDetailsPage, path: 'household-details'),
  ],
)
class AppRouter extends _$AppRouter {}
