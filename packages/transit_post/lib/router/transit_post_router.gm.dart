// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:transit_post/pages/custom_scanner/custom_scanner_page.dart'
    as _i1;
import 'package:transit_post/pages/transit_post_acknowledgment.dart' as _i2;
import 'package:transit_post/pages/transit_post_record_vaccination.dart' as _i3;
import 'package:transit_post/pages/transit_post_selection.dart' as _i4;
import 'package:transit_post/pages/transit_post_wrapper.dart' as _i5;

abstract class $TransitPostRoute extends _i6.AutoRouterModule {
  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CustomScannerRoute.name: (routeData) {
      final args = routeData.argsAs<CustomScannerRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CustomScannerPage(
          key: args.key,
          quantity: args.quantity,
          isGS1code: args.isGS1code,
        ),
      );
    },
    TransitPostAcknowledgmentRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TransitPostAcknowledgmentPage(),
      );
    },
    TransitPostRecordVaccinationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TransitPostRecordVaccinationPage(),
      );
    },
    TransitPostSelectionRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TransitPostSelectionPage(),
      );
    },
    TransitPostWrapperRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TransitPostWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomScannerPage]
class CustomScannerRoute extends _i6.PageRouteInfo<CustomScannerRouteArgs> {
  CustomScannerRoute({
    _i7.Key? key,
    required int quantity,
    required bool isGS1code,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CustomScannerRoute.name,
          args: CustomScannerRouteArgs(
            key: key,
            quantity: quantity,
            isGS1code: isGS1code,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomScannerRoute';

  static const _i6.PageInfo<CustomScannerRouteArgs> page =
      _i6.PageInfo<CustomScannerRouteArgs>(name);
}

class CustomScannerRouteArgs {
  const CustomScannerRouteArgs({
    this.key,
    required this.quantity,
    required this.isGS1code,
  });

  final _i7.Key? key;

  final int quantity;

  final bool isGS1code;

  @override
  String toString() {
    return 'CustomScannerRouteArgs{key: $key, quantity: $quantity, isGS1code: $isGS1code}';
  }
}

/// generated route for
/// [_i2.TransitPostAcknowledgmentPage]
class TransitPostAcknowledgmentRoute extends _i6.PageRouteInfo<void> {
  const TransitPostAcknowledgmentRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TransitPostAcknowledgmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostAcknowledgmentRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TransitPostRecordVaccinationPage]
class TransitPostRecordVaccinationRoute extends _i6.PageRouteInfo<void> {
  const TransitPostRecordVaccinationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TransitPostRecordVaccinationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostRecordVaccinationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TransitPostSelectionPage]
class TransitPostSelectionRoute extends _i6.PageRouteInfo<void> {
  const TransitPostSelectionRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TransitPostSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostSelectionRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TransitPostWrapperPage]
class TransitPostWrapperRoute extends _i6.PageRouteInfo<void> {
  const TransitPostWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TransitPostWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitPostWrapperRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
