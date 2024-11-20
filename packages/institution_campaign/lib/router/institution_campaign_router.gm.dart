// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:institution_campaign/blocs/app_localization.dart' as _i5;
import 'package:institution_campaign/pages/institution_campaign_wrapper.dart'
    as _i1;
import 'package:institution_campaign/pages/institution_type.dart' as _i2;

abstract class $InstitutionCampaignRouter extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InstitutionCampaignWrapperRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.InstitutionCampaignWrapperPage(),
      );
    },
    InstitutionTypeRoute.name: (routeData) {
      final args = routeData.argsAs<InstitutionTypeRouteArgs>(
          orElse: () => const InstitutionTypeRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.InstitutionTypePage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.InstitutionCampaignWrapperPage]
class InstitutionCampaignWrapperRoute extends _i3.PageRouteInfo<void> {
  const InstitutionCampaignWrapperRoute({List<_i3.PageRouteInfo>? children})
      : super(
          InstitutionCampaignWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstitutionCampaignWrapperRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InstitutionTypePage]
class InstitutionTypeRoute extends _i3.PageRouteInfo<InstitutionTypeRouteArgs> {
  InstitutionTypeRoute({
    _i4.Key? key,
    _i5.InstitutionCampaignLocalization? appLocalizations,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          InstitutionTypeRoute.name,
          args: InstitutionTypeRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'InstitutionTypeRoute';

  static const _i3.PageInfo<InstitutionTypeRouteArgs> page =
      _i3.PageInfo<InstitutionTypeRouteArgs>(name);
}

class InstitutionTypeRouteArgs {
  const InstitutionTypeRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i4.Key? key;

  final _i5.InstitutionCampaignLocalization? appLocalizations;

  @override
  String toString() {
    return 'InstitutionTypeRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}
