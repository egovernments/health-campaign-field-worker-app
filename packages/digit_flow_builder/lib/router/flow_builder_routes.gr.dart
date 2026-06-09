// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:collection/collection.dart' as _i4;
import 'package:digit_flow_builder/flow_builder_home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

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

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FlowBuilderHomeRouteArgs>();
      return _i1.FlowBuilderHomePage(
        key: args.key,
        pageName: args.pageName,
        navigationParams: args.navigationParams,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FlowBuilderHomeRouteArgs) return false;
    return key == other.key &&
        pageName == other.pageName &&
        const _i4.MapEquality<String, dynamic>().equals(
          navigationParams,
          other.navigationParams,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      pageName.hashCode ^
      const _i4.MapEquality<String, dynamic>().hash(navigationParams);
}
