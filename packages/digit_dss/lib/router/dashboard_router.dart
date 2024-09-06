import 'package:auto_route/auto_route.dart';

import 'dashboard_router.gm.dart';

@AutoRouterConfig.module()
class DashboardRoute extends $DashboardRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
    AutoRoute(
      page: UserDashboardRoute.page,
      path: 'dashboard',
    ),
  ];
}
