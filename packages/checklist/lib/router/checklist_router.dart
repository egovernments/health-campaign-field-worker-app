import 'package:auto_route/auto_route.dart';

import 'checklist_router.gm.dart';

@AutoRouterConfig.module()
class CheckListRoute extends $CheckListRoute {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
        page: ChecklistWrapperRoute.page,
        path: 'checklist',
        children: [
          AutoRoute(
          page: ChecklistRoute.page,
          path: '',
      ),
    ],
    ),
    AutoRoute(
        page: ChecklistBoundaryViewRoute.page, path: 'view-boundary'),
    AutoRoute(page: ChecklistViewRoute.page, path: 'view'),
    AutoRoute(page: ChecklistPreviewRoute.page, path: 'preview'),
  ];
}