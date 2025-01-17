// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'maps_router.dart';

abstract class _$DigitMapsRoute extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    MapPathPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapPathPage(),
      );
    },
    MapPlotPageRoute.name: (routeData) {
      final args = routeData.argsAs<MapPlotPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapPlotPage(
          key: args.key,
          coordinatePair: args.coordinatePair,
        ),
      );
    },
    MapsHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MapsHomePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapsHomePage(
          key: args.key,
          markerDetails: args.markerDetails,
          onPressed: args.onPressed,
        ),
      );
    },
  };
}

/// generated route for
/// [MapPathPage]
class MapPathPageRoute extends PageRouteInfo<void> {
  const MapPathPageRoute({List<PageRouteInfo>? children})
      : super(
          MapPathPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapPathPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapPlotPage]
class MapPlotPageRoute extends PageRouteInfo<MapPlotPageRouteArgs> {
  MapPlotPageRoute({
    Key? key,
    required CoordinatePair coordinatePair,
    List<PageRouteInfo>? children,
  }) : super(
          MapPlotPageRoute.name,
          args: MapPlotPageRouteArgs(
            key: key,
            coordinatePair: coordinatePair,
          ),
          initialChildren: children,
        );

  static const String name = 'MapPlotPageRoute';

  static const PageInfo<MapPlotPageRouteArgs> page =
      PageInfo<MapPlotPageRouteArgs>(name);
}

class MapPlotPageRouteArgs {
  const MapPlotPageRouteArgs({
    this.key,
    required this.coordinatePair,
  });

  final Key? key;

  final CoordinatePair coordinatePair;

  @override
  String toString() {
    return 'MapPlotPageRouteArgs{key: $key, coordinatePair: $coordinatePair}';
  }
}

/// generated route for
/// [MapsHomePage]
class MapsHomePageRoute extends PageRouteInfo<MapsHomePageRouteArgs> {
  MapsHomePageRoute({
    Key? key,
    required List<MarkerDetails> markerDetails,
    required void Function(String) onPressed,
    List<PageRouteInfo>? children,
  }) : super(
          MapsHomePageRoute.name,
          args: MapsHomePageRouteArgs(
            key: key,
            markerDetails: markerDetails,
            onPressed: onPressed,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsHomePageRoute';

  static const PageInfo<MapsHomePageRouteArgs> page =
      PageInfo<MapsHomePageRouteArgs>(name);
}

class MapsHomePageRouteArgs {
  const MapsHomePageRouteArgs({
    this.key,
    required this.markerDetails,
    required this.onPressed,
  });

  final Key? key;

  final List<MarkerDetails> markerDetails;

  final void Function(String) onPressed;

  @override
  String toString() {
    return 'MapsHomePageRouteArgs{key: $key, markerDetails: $markerDetails, onPressed: $onPressed}';
  }
}
