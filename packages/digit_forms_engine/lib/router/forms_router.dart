import 'package:auto_route/auto_route.dart';

import 'forms_router.gr.dart';

export 'forms_router.gr.dart';

@AutoRouterConfig()
class FormsRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: FormsRenderRoute.page, path: 'forms-render/:pageName'),];
}
