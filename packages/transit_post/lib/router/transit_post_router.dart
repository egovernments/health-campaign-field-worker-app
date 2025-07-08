import 'package:auto_route/auto_route.dart';

import 'transit_post_router.gm.dart';

@AutoRouterConfig.module()
class TransitPostRoute extends $TransitPostRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
        AutoRoute(
            page: TransitPostWrapperRoute.page,
            path: 'transit-post-wrapper',
            children: [
              AutoRoute(
                page: TransitPostSelectionRoute.page,
                initial: true,
                path: 'transit-post-selection',
              ),
              AutoRoute(
                  page: TransitPostRecordVaccinationRoute.page,
                  path: 'transit-post-record'),
              AutoRoute(
                  page: TransitPostAcknowledgmentRoute.page,
                  path: 'transit-post-acknowledgment')
            ]),
      ];
}
