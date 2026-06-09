import 'package:auto_route/auto_route.dart';

import 'flow_builder_routes.gr.dart';

export 'flow_builder_routes.gr.dart';

@AutoRouterConfig()
class FlowBuilderRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [AutoRoute(page: FlowBuilderHomeRoute.page)];
}
