// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:digit_flow_builder/flow_builder_home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $FlowBuilderRoute extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    FlowBuilderHomeRoute.name: (routeData) {
      final args = routeData.argsAs<FlowBuilderHomeRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FlowBuilderHomePage(
          key: args.key,
          pageName: args.pageName,
          navigationParams: args.navigationParams,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.FlowBuilderHomePage]
class FlowBuilderHomeRoute extends _i2.PageRouteInfo<FlowBuilderHomeRouteArgs> {
  FlowBuilderHomeRoute({
    _i3.Key? key,
    required String pageName,
    Map<String, dynamic>? navigationParams,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          FlowBuilderHomeRoute.name,
          args: FlowBuilderHomeRouteArgs(
            key: key,
            pageName: pageName,
            navigationParams: navigationParams,
          ),
          initialChildren: children,
        );

  static const String name = 'FlowBuilderHomeRoute';

  static const _i2.PageInfo<FlowBuilderHomeRouteArgs> page =
      _i2.PageInfo<FlowBuilderHomeRouteArgs>(name);
}

class FlowBuilderHomeRouteArgs {
  const FlowBuilderHomeRouteArgs({
    this.key,
    required this.pageName,
    this.navigationParams,
  });

  final _i3.Key? key;

  final String pageName;

  final Map<String, dynamic>? navigationParams;

  @override
  String toString() {
    return 'FlowBuilderHomeRouteArgs{key: $key, pageName: $pageName, navigationParams: $navigationParams}';
  }
}
