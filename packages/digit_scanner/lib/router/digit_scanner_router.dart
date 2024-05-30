import 'package:auto_route/auto_route.dart';

import 'digit_scanner_router.gm.dart';

@AutoRouterConfig.module()
class DigitScannerPackageRoute extends $DigitScannerPackageRoute {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: DigitScannerRoute.page,
      path: 'digit-scanner',
    ),
  ];
}
