import 'package:auto_route/auto_route.dart';

import 'forms_router.gm.dart';

@AutoRouterConfig.module()
class FormsRoute extends $FormsRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
    AutoRoute(page: FormsRenderRoute.page, path: 'forms-render/:pageName'),];
}
