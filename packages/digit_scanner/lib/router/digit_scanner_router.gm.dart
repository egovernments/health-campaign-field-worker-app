// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:digit_scanner/blocs/app_localization.dart' as _i4;
import 'package:digit_scanner/pages/qr_scanner.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $DigitScannerPackageRoute extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DigitScannerRoute.name: (routeData) {
      final args = routeData.argsAs<DigitScannerRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DigitScannerPage(
          key: args.key,
          appLocalizations: args.appLocalizations,
          quantity: args.quantity,
          isGS1code: args.isGS1code,
          singleValue: args.singleValue,
          isEditEnabled: args.isEditEnabled,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.DigitScannerPage]
class DigitScannerRoute extends _i2.PageRouteInfo<DigitScannerRouteArgs> {
  DigitScannerRoute({
    _i3.Key? key,
    _i4.ScannerLocalization? appLocalizations,
    required int quantity,
    required bool isGS1code,
    bool singleValue = false,
    bool isEditEnabled = false,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DigitScannerRoute.name,
          args: DigitScannerRouteArgs(
            key: key,
            appLocalizations: appLocalizations,
            quantity: quantity,
            isGS1code: isGS1code,
            singleValue: singleValue,
            isEditEnabled: isEditEnabled,
          ),
          initialChildren: children,
        );

  static const String name = 'DigitScannerRoute';

  static const _i2.PageInfo<DigitScannerRouteArgs> page =
      _i2.PageInfo<DigitScannerRouteArgs>(name);
}

class DigitScannerRouteArgs {
  const DigitScannerRouteArgs({
    this.key,
    this.appLocalizations,
    required this.quantity,
    required this.isGS1code,
    this.singleValue = false,
    this.isEditEnabled = false,
  });

  final _i3.Key? key;

  final _i4.ScannerLocalization? appLocalizations;

  final int quantity;

  final bool isGS1code;

  final bool singleValue;

  final bool isEditEnabled;

  @override
  String toString() {
    return 'DigitScannerRouteArgs{key: $key, appLocalizations: $appLocalizations, quantity: $quantity, isGS1code: $isGS1code, singleValue: $singleValue, isEditEnabled: $isEditEnabled}';
  }
}
