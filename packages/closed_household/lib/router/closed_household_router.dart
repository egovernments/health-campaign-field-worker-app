import 'package:auto_route/auto_route.dart';

import 'closed_household_router.gm.dart';

@AutoRouterConfig.module()
class ClosedHouseholdPackageRoute extends $ClosedHouseholdPackageRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    AutoRoute(
        page: ClosedHouseholdWrapperRoute.page,
        path: 'closed-household-wrapper',
        children: [
          AutoRoute(
            page: ClosedHouseholdDetailsRoute.page,
            path: 'closed-household-details',
            initial: true,
          ),
          AutoRoute(
              page: ClosedHouseholdSummaryRoute.page,
              path: 'closed-household-summary'),
          AutoRoute(
              page: ClosedHouseholdAcknowledgementRoute.page,
              path: 'closed-household-acknowledgement'),
        ]),
  ];
}
