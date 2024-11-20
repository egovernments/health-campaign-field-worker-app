import 'package:auto_route/auto_route.dart';
import 'package:institution_campaign/pages/institution_campaign_wrapper.dart';

import 'institution_campaign_router.gm.dart';

@AutoRouterConfig.module()
class InstitutionCampaignRouter extends $InstitutionCampaignRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: InstitutionCampaignWrapperRoute.page,
            path: 'institution-campaign',
            children: [
              AutoRoute(
                page: InstitutionTypeRoute.page,
                path: 'institution-type',
                initial: true,
              )
            ])
      ];
}
