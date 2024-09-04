import 'package:auto_route/auto_route.dart';

import 'dashboard_router.gr.dart';

@AutoRouterConfig()
class DashboardRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: UserDashboardRoute.page,
      path: 'dashboard',
    ),
  ];
}
