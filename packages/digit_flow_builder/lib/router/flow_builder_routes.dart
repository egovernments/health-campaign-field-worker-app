import 'package:auto_route/auto_route.dart';

import 'flow_builder_routes.gm.dart';

@AutoRouterConfig.module()
class FlowBuilderRoute extends $FlowBuilderRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [AutoRoute(page: FlowBuilderHomeRoute.page)];
}
