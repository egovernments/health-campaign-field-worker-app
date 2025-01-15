import 'package:auto_route/auto_route.dart';
import 'package:digit_maps/bloc/map_path/map_path_bloc.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/map_path.dart';
import '../pages/map_plot.dart';

part 'maps_router.gm.dart';

@AutoRouterConfig.module(
  replaceInRouteName: 'Page',
)
class DigitMapsRoute extends _$DigitMapsRoute {
  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> get routes => [
        AutoRoute(page: MapsHomePageRoute.page),
        AutoRoute(
          page: MapPathPageRoute.page,
        ),
        AutoRoute(page: MapPlotPageRoute.page),
      ];
}
