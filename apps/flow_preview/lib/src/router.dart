import 'package:auto_route/auto_route.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:digit_forms_engine/router/forms_router.dart';
import 'package:digit_forms_engine/router/forms_router.gm.dart';
import 'package:digit_scanner/router/digit_scanner_router.dart';
import 'package:digit_scanner/router/digit_scanner_router.gm.dart';

import 'app_screens.dart';
import 'embed/embed.dart';
import 'home_page.dart';

/// Router for the preview: the home page plus the same package route modules
/// the field worker app mounts (apps/health_campaign_field_worker_app/lib/
/// router/app_router.dart) that flows can navigate to:
/// - FlowBuilderRoute: flow screens
/// - FormsRoute: each page of a multi-page form ("Next")
/// - DigitScannerPackageRoute: the scanner
/// Written by hand (no auto_route code generation needed).
class PreviewRouter extends RootStackRouter {
  PreviewRouter() : super();

  final _modules = <AutoRouterModule>[
    FlowBuilderRoute(),
    FormsRoute(),
    DigitScannerPackageRoute(),
  ];

  @override
  late final Map<String, PageFactory> pagesMap = {
    PreviewEntryRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const PreviewEntryPage(),
        ),
    EmbedRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const EmbedPage(),
        ),
    AppLoginRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const AppLoginPage(),
        ),
    AppProjectsRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const AppProjectsPage(),
        ),
    AppBoundaryRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const AppBoundaryPage(),
        ),
    AppCurrentBoundaryRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const AppCurrentBoundaryPage(),
        ),
    AppHomeRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const AppHomePage(),
        ),
    PreviewHomeRoute.name: (routeData) => AutoRoutePage<dynamic>(
          routeData: routeData,
          child: const PreviewHomePage(),
        ),
    for (final m in _modules) ...m.pagesMap,
  };

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: PreviewEntryRoute.page, path: '/', initial: true),
    AutoRoute(page: AppLoginRoute.page, path: '/login'),
    // Inside the campaign console (?embed=1): waits for its session.
    AutoRoute(page: EmbedRoute.page, path: '/embed'),
    AutoRoute(page: AppProjectsRoute.page, path: '/projects'),
    AutoRoute(page: AppBoundaryRoute.page, path: '/boundary'),
    AutoRoute(page: AppHomeRoute.page, path: '/home'),
    AutoRoute(page: AppCurrentBoundaryRoute.page, path: '/current-boundary'),
    // Developer page: paste, examples, ?config= links.
    AutoRoute(page: PreviewHomeRoute.page, path: '/tools'),
    AutoRoute(page: FlowBuilderHomeRoute.page, path: '/flow'),
    // Same pages the app mounts via FormsRoute().routes and its scanner route;
    // top-level paths here, so they start with '/'.
    AutoRoute(page: FormsRenderRoute.page, path: '/forms-render/:pageName'),
    AutoRoute(page: DigitScannerRoute.page, path: '/scanner'),
  ];
}

class PreviewHomeRoute extends PageRouteInfo<void> {
  const PreviewHomeRoute() : super(PreviewHomeRoute.name);

  static const String name = 'PreviewHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

class PreviewEntryRoute extends PageRouteInfo<void> {
  const PreviewEntryRoute() : super(PreviewEntryRoute.name);
  static const String name = 'PreviewEntryRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AppLoginRoute extends PageRouteInfo<void> {
  const AppLoginRoute() : super(AppLoginRoute.name);
  static const String name = 'AppLoginRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AppProjectsRoute extends PageRouteInfo<void> {
  const AppProjectsRoute() : super(AppProjectsRoute.name);
  static const String name = 'AppProjectsRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AppHomeRoute extends PageRouteInfo<void> {
  const AppHomeRoute() : super(AppHomeRoute.name);
  static const String name = 'AppHomeRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AppBoundaryRoute extends PageRouteInfo<void> {
  const AppBoundaryRoute() : super(AppBoundaryRoute.name);
  static const String name = 'AppBoundaryRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class AppCurrentBoundaryRoute extends PageRouteInfo<void> {
  const AppCurrentBoundaryRoute() : super(AppCurrentBoundaryRoute.name);
  static const String name = 'AppCurrentBoundaryRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}

class EmbedRoute extends PageRouteInfo<void> {
  const EmbedRoute() : super(EmbedRoute.name);
  static const String name = 'EmbedRoute';
  static const PageInfo<void> page = PageInfo<void>(name);
}
