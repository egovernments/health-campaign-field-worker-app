// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:closed_household/blocs/app_localization.dart' as _i7;
import 'package:closed_household/closed_household.dart' as _i8;
import 'package:closed_household/pages/closed_household_acknowledgement.dart'
    as _i1;
import 'package:closed_household/pages/closed_household_details.dart' as _i2;
import 'package:closed_household/pages/closed_household_summary.dart' as _i3;
import 'package:closed_household/pages/closed_household_wrapper.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

abstract class $ClosedHouseholdPackageRoute extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ClosedHouseholdAcknowledgementRoute.name: (routeData) {
      final args = routeData.argsAs<ClosedHouseholdAcknowledgementRouteArgs>(
          orElse: () => const ClosedHouseholdAcknowledgementRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ClosedHouseholdAcknowledgementPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ClosedHouseholdDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ClosedHouseholdDetailsRouteArgs>(
          orElse: () => const ClosedHouseholdDetailsRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ClosedHouseholdDetailsPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ClosedHouseholdSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<ClosedHouseholdSummaryRouteArgs>(
          orElse: () => const ClosedHouseholdSummaryRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ClosedHouseholdSummaryPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
        ),
      );
    },
    ClosedHouseholdWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ClosedHouseholdWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ClosedHouseholdAcknowledgementPage]
class ClosedHouseholdAcknowledgementRoute
    extends _i5.PageRouteInfo<ClosedHouseholdAcknowledgementRouteArgs> {
  ClosedHouseholdAcknowledgementRoute({
    _i6.Key? key,
    _i7.ClosedHouseholdLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ClosedHouseholdAcknowledgementRoute.name,
          args: ClosedHouseholdAcknowledgementRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ClosedHouseholdAcknowledgementRoute';

  static const _i5.PageInfo<ClosedHouseholdAcknowledgementRouteArgs> page =
      _i5.PageInfo<ClosedHouseholdAcknowledgementRouteArgs>(name);
}

class ClosedHouseholdAcknowledgementRouteArgs {
  const ClosedHouseholdAcknowledgementRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i6.Key? key;

  final _i7.ClosedHouseholdLocalization? appLocalizations;

  @override
  String toString() {
    return 'ClosedHouseholdAcknowledgementRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i2.ClosedHouseholdDetailsPage]
class ClosedHouseholdDetailsRoute
    extends _i5.PageRouteInfo<ClosedHouseholdDetailsRouteArgs> {
  ClosedHouseholdDetailsRoute({
    _i6.Key? key,
    _i8.ClosedHouseholdLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ClosedHouseholdDetailsRoute.name,
          args: ClosedHouseholdDetailsRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ClosedHouseholdDetailsRoute';

  static const _i5.PageInfo<ClosedHouseholdDetailsRouteArgs> page =
      _i5.PageInfo<ClosedHouseholdDetailsRouteArgs>(name);
}

class ClosedHouseholdDetailsRouteArgs {
  const ClosedHouseholdDetailsRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i6.Key? key;

  final _i8.ClosedHouseholdLocalization? appLocalizations;

  @override
  String toString() {
    return 'ClosedHouseholdDetailsRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i3.ClosedHouseholdSummaryPage]
class ClosedHouseholdSummaryRoute
    extends _i5.PageRouteInfo<ClosedHouseholdSummaryRouteArgs> {
  ClosedHouseholdSummaryRoute({
    _i6.Key? key,
    _i7.ClosedHouseholdLocalization? appLocalizations,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ClosedHouseholdSummaryRoute.name,
          args: ClosedHouseholdSummaryRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
          ),
          initialChildren: children,
        );

  static const String name = 'ClosedHouseholdSummaryRoute';

  static const _i5.PageInfo<ClosedHouseholdSummaryRouteArgs> page =
      _i5.PageInfo<ClosedHouseholdSummaryRouteArgs>(name);
}

class ClosedHouseholdSummaryRouteArgs {
  const ClosedHouseholdSummaryRouteArgs({
    this.key,
    this.appLocalizations,
  });

  final _i6.Key? key;

  final _i7.ClosedHouseholdLocalization? appLocalizations;

  @override
  String toString() {
    return 'ClosedHouseholdSummaryRouteArgs{key: $key, appLocalizations: $appLocalizations}';
  }
}

/// generated route for
/// [_i4.ClosedHouseholdWrapperPage]
class ClosedHouseholdWrapperRoute extends _i5.PageRouteInfo<void> {
  const ClosedHouseholdWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ClosedHouseholdWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClosedHouseholdWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
