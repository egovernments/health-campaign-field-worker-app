import 'package:auto_route/auto_route.dart';

import 'checklist_router.gm.dart';


//Used auto_route package to navigate to different pages in checklist package

@AutoRouterConfig.module()
class CheckListRoute extends $CheckListRoute {

  RouteType get defaultRouteType => const RouteType.material();

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
    AutoRoute(page: ChecklistAcknowledgementRoute.page, path: 'checklist-acknowledgement'),
  ];
}